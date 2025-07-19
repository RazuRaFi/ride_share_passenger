import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share_flat/helpers/app_routes.dart';
import 'package:ride_share_flat/helpers/pref_helper.dart';
import 'package:ride_share_flat/services/api_services.dart';
import 'package:ride_share_flat/utils/app_urls.dart';

import '../../helpers/others_helper.dart';
import '../../model/profile/get_profile_model.dart';
import '../../model/profile/update_profile_model.dart';

class ProfileController extends GetxController {
  UserProfileModel userProfileModel = UserProfileModel.fromJson({});
  UpdateProfileModel updateProfileModel = UpdateProfileModel();

  List gender = const ["Male", "Female", "Other"];

  // String selectedLanguage = "English";
  String image = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  RxBool isLoading = false.obs;
  var userProfile = {""};

  @override
  void onClose() {
    // Always dispose controllers to avoid memory leaks
    dayController.dispose();
    monthController.dispose();
    yearController.dispose();
    super.onClose();
  }

  // selectedGender(int index) {
  //   genderController.text = gender[index].toString();
  //   update();
  //   Get.back();
  // }

  getProfileImage() async {
    image = await OtherHelper.openGallery() ?? "";
    update();
  }

  // selectLanguage(int index) {
  //   selectedLanguage = languages[index];
  //   update();
  //   Get.back();
  // }
  var selectedGender = 'Female'.obs;

  void setGender(String gender) {
    selectedGender.value = gender;
  }

  var selectedLanguage =
      'English'.obs; // Observable variable for reactive updates

  final List<String> languages = ['English', 'Spanish', 'French', 'German'];

  void changeLanguage(String newLanguage) {
    selectedLanguage.value = newLanguage;
  }

  RxBool isGetProfile = false.obs;
  Future<UserProfileModel?> getMyProfile() async {
    isGetProfile(true);
    try {
      Map<String, String> header = {"token": PrefsHelper.token};

      var response = await ApiService.getApi(AppUrls.myProfile, header: header);

      if (response.statusCode == 200) {
        log("Profile details fetched successfully");

        var data = response.body["data"];
        log(">>>>>>>>>>>>>>>>>> $data");
        userProfileModel = UserProfileModel.fromJson(data);
      } else {
        log("Failed to fetch profile details: ${response.statusCode}");
      }
    } catch (e) {
      log("Exception profile details: $e");
    } finally {
      isGetProfile(false);
    }
    return null;
  }

  updateProfile() async {
    isLoading(true);
    try {
      Map<String, String> header = {"token": PrefsHelper.token};

      Map<String, dynamic> body = {
        "data": jsonEncode({
          "fullName": nameController.text,
          "phone": numberController.text,
          "dob": {
            "day": dayController.text,
            "month": monthController.text,
            "year": yearController.text,
          },
          "address": addressController.text,
          "gender": selectedGender.value,
        }),
      };

      final response = await ApiService.multipartRequest(
        url: AppUrls.updateProfile,
        body: body,
        imagePath: image ?? "",
        header: header,
        method: "PATCH",
      );

      if (response.statusCode == 200) {
        log("✅ Profile updated successfully");
        Get.back();
        getMyProfile();
      } else {
        log(" Failed to update profile: ${response.statusCode} - ${response.body}");
      }
    } catch (e, stackTrace) {
      log("Exception while updating profile: $e\n$stackTrace");
    } finally {
      isLoading(false);
    }
  }

}
