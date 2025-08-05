

import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_intl_phone_field/countries.dart';
import 'package:get/get.dart';

import '../../helpers/app_routes.dart';
import '../../services/api_services.dart';
import '../../utils/app_urls.dart';
import '../../utils/app_utils.dart';

class SignUpController extends GetxController{
  Timer? _timer;
  int start = 0;

  String time = "";
  RxBool isLoading=false.obs;
  String signUpToken="";
  String otpVerifyToken="";

  final TextEditingController fullNameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController phoneController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final TextEditingController confirmPassController=TextEditingController();
  final TextEditingController forgotMailController=TextEditingController();
  RxBool isRemembered = false.obs;

  void toggleRemembered(bool value) {
    isRemembered.value = value;
  }
  var selectedDialCode = "+33".obs;

  void countryChange(Country country) {
    selectedDialCode.value = country.dialCode;
    log(">>>>>>>>>>>>>>> ${country.dialCode}");
  }

  signUpUser() async {
    isLoading(true);

    Map<String, String> body = {
      "fullName": fullNameController.text,
      "email": emailController.text,
      "phone": "${selectedDialCode.value}${phoneController.text}",
      "password": passwordController.text,
      "termsAndConditions":isRemembered.toString()
    };

    var response = await ApiService.postApi(
      AppUrls.signUp,
      body,
    );

    if (response.statusCode == 200) {
      var data = response.body;
      signUpToken = data['data']['accessToken'];
      Get.offNamed(AppRoutes.navBarScreen);
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
    isLoading(false);
  }

  void startTimer() {
    _timer?.cancel(); // Cancel any existing timer
    start = 180; // Reset the start value
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start > 0) {
        start--;
        final minutes = (start ~/ 60).toString().padLeft(2, '0');
        final seconds = (start % 60).toString().padLeft(2, '0');

        time = "$minutes:$seconds";

        update();
      } else {
        _timer?.cancel();
      }
    });
  }



}


