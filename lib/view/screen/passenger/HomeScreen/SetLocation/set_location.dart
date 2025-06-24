
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/view/component/button/CommonButton.dart';

import '../../../../component/text_field/custom_textfield.dart';

class SetLocation extends StatelessWidget {
  const SetLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                child: Image.asset("assets/images/map.png",),
              ),
            ],
          ),
          Positioned(
            top: 35,
              left: 15,
              child:CircleAvatar(
                radius: 20,
                  backgroundColor: Colors.white,
                  child: IconButton(onPressed: (){
                    Get.back();
                  }, icon:Icon(Icons.arrow_back_outlined,color: Colors.black,)))),
          Positioned(
            bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 203,
                width: 396,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(height: 28,),
                      CustomTextField(hindText: "13th Street.47 W 13th St, New York",suffixIcon: Icon(Icons.search),fieldBorderRadius: 10,prefixIcon: Icon(Icons.location_pin),fieldBorderColor: Colors.grey,textStyle: TextStyle(fontSize: 12),),
                     SizedBox(height: 16,),
                      CommonButton(titleText: "Set Location",backgroundColor: Colors.black,titleColor: Colors.white,buttonHeight: 56,buttonWidth: 359,titleSize: 16,titleWeight: FontWeight.w500,),
                    ],
                  ),
                ),

          ))
        ],
      ),
    );
  }
}
