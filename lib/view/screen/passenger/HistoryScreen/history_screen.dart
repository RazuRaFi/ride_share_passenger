
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';
import 'package:ride_share_flat/view/screen/passenger/HistoryScreen/TripDetails/trip_details.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: "History",fontSize: 16,fontWeight: FontWeight.w500,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 16),
                   child: CommonText(text: "Today",fontSize: 14,fontWeight: FontWeight.w500,),
                 ),
            SizedBox(height: 16,),
            ListView.builder(
              shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: 4,
                scrollDirection: Axis.vertical,
                itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  Get.to(TripDetailsScreen());
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 143,
                  width: 393,
                  decoration: BoxDecoration(
                    border: Border.symmetric(horizontal:BorderSide(color: Colors.grey)),
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
                            Row(
                              spacing: 5,
                              children: [
                                CommonText(text: "110",fontSize: 16,fontWeight: FontWeight.w500,),
                                Icon(Icons.arrow_forward_ios_outlined,size: 16,),
                              ],
                            )

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
                            )

                          ],
                        ),
                        TextButton(onPressed: (){}, child:CommonText(text: "REQUEST AGAIN")),
                      ],
                    ),
                  ),
                ),
              );
            }),
            SizedBox(height: 16,),
        
        
          ],
        ),
      ),
    );
  }
}
