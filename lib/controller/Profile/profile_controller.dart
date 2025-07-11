


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/others_helper.dart';

class ProfileController extends GetxController {
  // List languages = ["English", "French", "Arabic"];
  List gender = const ["Male", "Female", "Other"];

  // String selectedLanguage = "English";
  String? image;

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();



  // selectedGender(int index) {
  //   genderController.text = gender[index].toString();
  //   update();
  //   Get.back();
  // }

  getProfileImage() async {
    image = await OtherHelper.openGallery();
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

  var selectedLanguage = 'English'.obs; // Observable variable for reactive updates

  final List<String> languages = ['English', 'Spanish', 'French', 'German'];

  void changeLanguage(String newLanguage) {
    selectedLanguage.value = newLanguage;
  }

}
