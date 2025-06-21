
import 'package:flutter/material.dart';

import '../../../component/button/CommonButton.dart';
import '../../../component/CommonText.dart';
import '../../../component/CommonTextField.dart';
import '../../../component/text_field/custom_textfield.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: "Create New Password ", fontSize: 16, fontWeight:FontWeight.w500),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 42,),
              Center(child: Image.asset("assets/images/newpassword.png",height: 100,width: 120,)),
              SizedBox(height: 24,),
              Center(child: CommonText(text: "Please create and enter a new password\n "
                  "                  for your account", fontSize: 14, fontWeight:FontWeight.w400)),
              SizedBox(height: 48,),
              CommonText(text: "Password", fontSize: 14, fontWeight: FontWeight.w500),
              SizedBox(height: 7,),
              CustomTextField(hindText: "Enter new password",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),),
              SizedBox(height: 16,),
              CommonText(text: "Confirm Password", fontSize: 14, fontWeight: FontWeight.w500),
              SizedBox(height: 7,),
              CustomTextField(hindText: "Enter confirm password",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),),
              SizedBox(height: 68,),
              GestureDetector(
                  onTap: (){
                    // Get.to(EmailVerification());
          
                  },
                  child: CommonButton(titleText: "Save",buttonHeight: 56,buttonWidth: 360,backgroundColor: Colors.black,titleColor: Colors.white,titleSize: 20,)),
          
            ],
          ),
        ),
      ),

    );
  }
}
