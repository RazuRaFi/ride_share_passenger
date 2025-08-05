

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share_flat/controller/splash_controller/splash_controller.dart';
import 'package:ride_share_flat/helpers/my_extension.dart';
import 'package:ride_share_flat/view/component/other_widgets/common_loader.dart';

class SplashScreen extends StatelessWidget {
 const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/images/splash.png")),
          CommonLoader(),
          50.height,
        ],
      ),

    );
  }
}
