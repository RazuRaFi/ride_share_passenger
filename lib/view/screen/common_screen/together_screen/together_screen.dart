
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../component/common_button.dart';
import '../../../component/common_text.dart';

class TogetherScreen extends StatelessWidget {
  const TogetherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 197,),
          Center(
            child: Container(
              height: 233.h,
              width: 297.w,
              child: Image.asset("assets/images/together.png"),
            ),
          ),
         CommontText(text: "Let’s travel together!", fSize: 20, fweight:FontWeight.w500),
          SizedBox(height: 143,),
          CommonButton(ttile: 'Sign In',height:56.h,width: 361.w,textcolor: Colors.black,),
          SizedBox(height: 24,),
          CommonButton(ttile: 'Sign up',height:56.h,width: 361.w,textcolor: Colors.white,color: Colors.black,),
        ],
      ),
    );
  }
}



