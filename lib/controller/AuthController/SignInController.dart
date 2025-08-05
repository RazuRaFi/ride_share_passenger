

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ride_share_flat/model/profile/login_profile_model.dart';

import '../../helpers/app_routes.dart';
import '../../helpers/pref_helper.dart';
import '../../services/api_services.dart';
import '../../services/socket_services.dart';
import '../../utils/app_urls.dart';

class SignInController extends GetxController{
  RxBool isLoading=false.obs;
  RxBool isRemembered = false.obs;
  final TextEditingController emailController=TextEditingController(text: kDebugMode? 'passenger@gmail.com' : '');
  final TextEditingController passwordController=TextEditingController(text:  kDebugMode? '12345678' : '');
  LoginProfileModel loginProfileModel = LoginProfileModel();

  void toggleRemembered(bool value) {
    isRemembered.value = value;
    log("isRemembered: $isRemembered");
  }

  Future<void> signInUser() async {

    isLoading(true);

    Map<String, String> body = {
      "email": emailController.text,
      "password": passwordController.text
    };

    var response = await ApiService.postApi(
      AppUrls.signIn,
      body,
    ).timeout(const Duration(seconds: 30));

    if (response.statusCode == 200) {
      var data = response.body;
      loginProfileModel = LoginProfileModel.fromJson(data);

      initPrefsHelperValue(responseData: loginProfileModel);
      Get.offAllNamed(AppRoutes.navBarScreen);
      SocketServices.connectToSocket(token: loginProfileModel.accessToken);

      emailController.clear();
      passwordController.clear();
    } else {
      Get.snackbar(response.statusCode.toString(), response.message);
    }

    isLoading(false);
  }

  /// init prefs helper value
  initPrefsHelperValue({required LoginProfileModel responseData}){
    PrefsHelper.token = responseData.accessToken;
    PrefsHelper.userId = responseData.user.id;
    PrefsHelper.myImage = responseData.user.profileImage;
    PrefsHelper.myName = responseData.user.fullName;
    PrefsHelper.myRole = responseData.user.role;
    PrefsHelper.myEmail = responseData.user.email;
    PrefsHelper.phone = responseData.user.phone;
    PrefsHelper.isLogIn = true;

    if(isRemembered.value){
      PrefsHelper.setString('token', PrefsHelper.token);
      PrefsHelper.setString("userId", PrefsHelper.userId);
      PrefsHelper.setString("myImage", PrefsHelper.myImage);
      PrefsHelper.setString("myName", PrefsHelper.myName);
      PrefsHelper.setString("myEmail", PrefsHelper.myEmail);
      PrefsHelper.setString("phone", PrefsHelper.phone);
      PrefsHelper.setString("myRole", PrefsHelper.myRole);
      PrefsHelper.setBool("isLogIn", PrefsHelper.isLogIn);
    }
    log("PrefsHelper.token ${PrefsHelper.token}");

  }
}

