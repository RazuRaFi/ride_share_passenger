
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:ride_share_flat/helpers/app_routes.dart';
import 'package:ride_share_flat/utils/app_image.dart';
import 'package:ride_share_flat/view/screen/common_screen/CreatePassword/create_new_password.dart';

import '../../../component/button/CommonButton.dart';
import '../../../component/CommonText.dart';
import '../ForgottenPassword/widget/otp_controller.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final OtpController controller = Get.put(OtpController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: "Email verification", fontSize: 16, fontWeight:FontWeight.w500),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key:formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 42,),
                Center(child: Image.asset("assets/images/password.png",height: 100,width: 120,)),
                SizedBox(height: 24,),
                Center(child: CommonText(
                    textAlign: TextAlign.center ,text: "Please enter the 5 digit code that was sent to\n     "
                       " xyz@gmail.com ", fontSize: 14, fontWeight:FontWeight.w400)),
                SizedBox(height: 48,),
                PinCodeTextField(),
                SizedBox(height: 48,),
                OtpTextField(
                  numberOfFields: 5,
                  borderColor: Colors.grey,
                  showFieldAsBox: true,
                  fieldHeight: 55,
                  fieldWidth: 55,
                  borderRadius: BorderRadius.circular(10),
                  onCodeChanged: (String code) {
                    log(">>>>>>>>>>>>>>>> $code");
                    },
                  onSubmit: (String verificationCode){
                    showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text("Verification Code"),
                            content: Text('Code entered is $verificationCode'),
                          );
                        }
                    );
                  }, // end onSubmit
                ),
                SizedBox(height: 135,),
                CommonButton(
                  onTap: (){
                    if(formKey.currentState!.validate()){

                      Get.toNamed(AppRoutes.createPassword);

                    }
                  },
                  titleText: "Verify OTP",buttonHeight: 56,buttonWidth: 361,backgroundColor: Colors.black,titleColor: Colors.white,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
