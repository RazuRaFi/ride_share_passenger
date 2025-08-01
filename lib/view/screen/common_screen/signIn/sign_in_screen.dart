
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ride_share_flat/controller/AuthController/SignInController.dart';
import 'package:ride_share_flat/utils/app_string.dart';
import 'package:ride_share_flat/view/component/button/CommonButton.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';
import 'package:ride_share_flat/view/component/text_field/custom_textfield.dart';
import 'package:ride_share_flat/view/screen/common_screen/ForgottenPassword/forgottern_password.dart';
import 'package:ride_share_flat/view/screen/common_screen/SignUp/SIgn_up_screen.dart';

import '../../../component/CommonTextField.dart';
import '../../../component/NavBar/common_bottom_nav.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final formkey=GlobalKey<FormState>();
    final SignInController controller=Get.put(SignInController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Obx((){
        return controller.isLoading.value
            ? Center(child: CircularProgressIndicator(color: Colors.blueAccent,),)
            : Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 49,),
                  Center(child: CommonText(text: AppString.welcome, fontSize: 20, fontWeight: FontWeight.w600)),
                  SizedBox(height: 16,),
                  Center(child: CommonText(text: AppString.pleaseSign, fontSize: 14, fontWeight: FontWeight.w400)),
                  SizedBox(height: 56,),
                  CommonText(text: AppString.email, fontSize: 14, fontWeight:FontWeight.w500),
                  SizedBox(height: 7,),
                  // CommonTextField(title: 'Enter your email',),
                  CustomTextField(
                    controller: controller.emailController,
                    hindText: AppString.enterEmail,fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Email is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16,),
                  CommonText(text: AppString.password, fontSize: 14, fontWeight:FontWeight.w500),
                  SizedBox(height: 7,),
                  CustomTextField(
                    controller: controller.passwordController,
                    hindText: AppString.enterYouPassword,fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Number is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 11,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Obx(() => FlutterSwitch(
                            width: 40.0,
                            height: 20.0,
                            toggleSize: 20.0,
                            value: controller.isRemembered.value,
                            borderRadius: 30.0,
                            padding: 2.0,
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey,
                            toggleColor: Colors.white,
                            onToggle: controller.toggleRemembered, // simplified
                          )),

                          const SizedBox(width: 5),
                          CommonText(text:AppString.remember, fontSize: 14, fontWeight: FontWeight.w400)
                        ],
                      ),
                      GestureDetector(
                          onTap: (){
                            Get.to(ForgottenPassword());

                          },
                          child: CommonText(text:AppString.forgotPassword, fontSize: 14, fontWeight: FontWeight.w500))
                    ],
                  ),
                  SizedBox(height: 32,),
                  GestureDetector(
                      onTap: (){
                        if(formkey.currentState!.validate()){
                          controller.signInUser();

                        }
                      },
                      child: CommonButton(titleText:AppString.signIn,buttonHeight: 56,buttonWidth: 361,backgroundColor: Colors.black,titleColor: Colors.white,titleSize: 20,)),
                  SizedBox(height: 24,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(text: AppString.doNotHaveAccount, fontSize: 14, fontWeight:FontWeight.w400),
                      TextButton(onPressed: (){
                        Get.to(()=>SignUpScreen());
                      }, child:CommonText(text: AppString.signUp, fontSize: 14, fontWeight: FontWeight.w600,color: Colors.black,))
                    ],
                  )




                ],
              ),
            ),
          ),
        );
      }),

    );
  }
}


