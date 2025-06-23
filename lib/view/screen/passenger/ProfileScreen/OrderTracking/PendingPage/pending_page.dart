
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/view/component/button/CommonButton.dart';
import 'package:ride_share_flat/view/screen/passenger/ProfileScreen/OrderTracking/PendingPage/TripDetails/trip_details_order.dart';

import '../../../../../component/CommonText.dart';

class PendingPage extends StatelessWidget {
  const PendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 24,),
            ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: 4,
                scrollDirection: Axis.vertical,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                       Get.to(TripDetailsOrder());
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      height: 155,
                      width: 393,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 5,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonText(text: "25 June 2024, 04:40 PM",fontSize: 16,fontWeight: FontWeight.w500,),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  spacing: 5,
                                  children: [
                                    Row(
                                      spacing: 5,
                                      children: [
                                        Image.asset("assets/icons/man.png",height: 20,width: 20,),
                                        CommonText(text: "Block B, Banasree, Dhaka.",fontSize: 14,fontWeight: FontWeight.w400,),
                                      ],
                                    ),
                                    Row(
                                      spacing: 5,
                                      children: [
                                        Image.asset("assets/icons/pin.png",height: 20,),
                                        CommonText(text: "Block B, Banasree, Dhaka.",fontSize: 14,fontWeight: FontWeight.w400,),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.black)
                                      ),
                                      child:  Image.asset("assets/images/driver.png",height: 48,width: 48,),
                                    )

                                  ],
                                ),

                              ],
                            ),
                            SizedBox(height: 5,),
                          CommonButton(titleText: "View Details",buttonHeight: 40,buttonWidth: 332,backgroundColor: Colors.white,titleColor: Colors.black,borderColor: Colors.red,titleSize: 14,),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
