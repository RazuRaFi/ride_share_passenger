

import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../helpers/app_routes.dart';
import '../../helpers/pref_helper.dart';
import '../../services/api_services.dart';
import '../../utils/app_urls.dart';
import '../../utils/app_utils.dart';

class ForgotPasswordController extends GetxController{
  final TextEditingController forgotMailController=TextEditingController();

  Timer? _timer;
  int start = 0;

  String time = "";
  RxBool isLoading=false.obs;
  String signUpToken="";
  String otpVerifyToken="";

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

  Future<void> forgotPasswordRepo() async {
    isLoading(true);
    try{
      Map<String, String> headers = {
        "token": PrefsHelper.token,
      };

      Map<String, String> body = {
        "email": forgotMailController.text,
      };
      var response = await ApiService.postApi(AppUrls.forgotPassword, body,header:headers);

      if (response.statusCode == 200) {
        Utils.toastMessage(response.message);
        otpVerifyToken = response.body['data']['forgetToken'];
        Get.toNamed(AppRoutes.verifyEmail);
      } else {
        Get.snackbar(response.statusCode.toString(), response.message);
      }

    }catch(e){
      log(">>>>>>>>>>>>>>>>>>> $e");
    }finally{
      log(">>>>>>>>>>>>>>>>Error");
    }

    isLoading(false);
  }
}