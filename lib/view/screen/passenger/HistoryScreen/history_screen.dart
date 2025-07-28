
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/controller/HistoryController/history_controller.dart';
import 'package:ride_share_flat/helpers/others_helper.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';
import 'package:ride_share_flat/view/screen/passenger/HistoryScreen/HistoryDetails/history_details.dart';

import '../../../../utils/app_urls.dart';
import '../../../component/image/common_image.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final HistoryController controller=Get.put(HistoryController());
  @override
  void initState() {
   controller.getHistory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: "History",fontSize: 16,fontWeight: FontWeight.w500,),
        centerTitle: true,
      ),
      body: Obx((){
        return controller.isHistory.value
            ? Center(child: CircularProgressIndicator(color: Colors.blueAccent,),)
            : SingleChildScrollView(
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
                  itemCount:controller.historyList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,index){
                    final history=controller.historyList[index];
                    return GestureDetector(
                      onTap: (){
                        Get.to(HistoryDetailsScreen());
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height: 148,
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
                                  CommonText(text:OtherHelper.formatDate(history.endTime),fontSize: 16,fontWeight: FontWeight.w500,),
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    spacing: 5,
                                    children: [
                                      Row(
                                        spacing: 5,
                                        children: [
                                          Image.asset("assets/icons/man.png",height: 20,width: 20,),
                                          CommonText(text: history.pickupLocation.address,fontSize: 14,fontWeight: FontWeight.w400,),
                                        ],
                                      ),
                                      Row(
                                        spacing: 5,
                                        children: [
                                          Image.asset("assets/icons/pin.png",height: 20,width: 20,),
                                          CommonText(text: history.dropofLocation.address,fontSize: 14,fontWeight: FontWeight.w400,),
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
                                        child: ClipOval(
                                          child: CommonImage(
                                            imageSrc:
                                            "${AppUrls.imageUrl}${history.driverId.profileImage}",
                                            imageType: ImageType.network,
                                            fill: BoxFit.fill,
                                          ),
                                        ),
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
        );
      }),
    );
  }
}
