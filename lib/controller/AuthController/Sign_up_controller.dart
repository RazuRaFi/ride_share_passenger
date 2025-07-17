

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ride_share_flat/view/component/NavBar/common_bottom_nav.dart';

import '../../helpers/app_routes.dart';
import '../../helpers/pref_helper.dart';
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


  signUpUser() async {
    isLoading(true);

    Map<String, String> body = {
      "fullName": fullNameController.text,
      "email": emailController.text,
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


