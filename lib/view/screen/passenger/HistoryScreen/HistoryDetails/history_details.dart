
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/controller/HistoryController/history_controller.dart';
import 'package:ride_share_flat/helpers/others_helper.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';

import '../../../../../utils/app_urls.dart';
import '../../../../component/image/common_image.dart';

class HistoryDetailsScreen extends StatefulWidget {
  const HistoryDetailsScreen({super.key});

  @override
  State<HistoryDetailsScreen> createState() => _HistoryDetailsScreenState();
}

class _HistoryDetailsScreenState extends State<HistoryDetailsScreen> {
  final HistoryController controller=Get.put(HistoryController());
  @override
  void initState() {
    controller.getCompleteDetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: "Trip Details",fontSize: 16,fontWeight: FontWeight.w500,),
        centerTitle: true,
      ),
      body:Obx((){
        return controller.isHistoryDetails.value
            ? Center(child: CircularProgressIndicator(color: Colors.blueAccent,),)
            : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5,
                    children: [
                      CommonText(text: "Trip ID",fontSize: 14,fontWeight: FontWeight.w500,),
                      CommonText(text: controller.historyDetailsModel.driverId.id,fontSize: 14,fontWeight: FontWeight.w500,),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        Clipboard.setData(ClipboardData(text:controller.historyDetailsModel.driverId.id));
                      }, icon: Icon(Icons.copy)),
                      CommonText(text: "COPY",fontSize: 14,fontWeight: FontWeight.w500,),

                    ],
                  )
                ],
              ),
              SizedBox(height: 14,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(text: "Trip Info",fontSize: 14,fontWeight: FontWeight.w500,),
                  Row(
                    spacing: 5,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal:2),
                        height: 25,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey)
                        ),
                        child: Row(
                          spacing: 5,
                          children: [
                            Image.asset("assets/icons/car.png",height: 28,width: 28,),
                            CommonText(text: controller.historyDetailsModel.vehicleType,fontSize: 14,fontWeight: FontWeight.w500,),
                          ],
                        ),
                      ),

                    ],
                  )
                ],
              ),
              SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(text: OtherHelper.formatDate(controller.historyDetailsModel.endTime),fontSize: 16,fontWeight: FontWeight.w500,),

                ],
              ),
              SizedBox(height: 14,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Row(
                        spacing: 5,
                        children: [
                          Image.asset("assets/icons/man.png",height: 20,width: 20,),
                          CommonText(text: controller.historyDetailsModel.pickupLocation.address,fontSize: 14,fontWeight: FontWeight.w400,),
                        ],
                      ),
                      Row(
                        spacing: 5,
                        children: [
                          Image.asset("assets/icons/pin.png",height: 20,width: 20,),
                          CommonText(text: controller.historyDetailsModel.dropofLocation.address,fontSize: 14,fontWeight: FontWeight.w400,),
                        ],
                      ),
                    ],
                  ),

                ],
              ),
              SizedBox(height: 14,),
              Row(
                spacing: 10,
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black)
                    ),
                    child:  ClipOval(
                      child: CommonImage(
                        imageSrc:
                        "${AppUrls.imageUrl}${controller.historyDetailsModel.driverId.profileImage}",
                        imageType: ImageType.network,
                        fill: BoxFit.fill,
                      ),
                    ),
                  ),
                  CommonText(text: controller.historyDetailsModel.driverId.fullName,fontSize: 16,fontWeight: FontWeight.w500,),
                ],
              ),
              SizedBox(height: 24,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15,
                children: [
                  CommonText(text: "Receipt"),
                  SizedBox(height:5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(text: "Base fare"),
                      CommonText(text: controller.historyDetailsModel.fare.toString()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(text: "Distance"),
                      CommonText(text: controller.historyDetailsModel.distance.toString()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(text: "Time"),
                      CommonText(text: controller.historyDetailsModel.rideTotalTime.toString()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(text: "Safety Coverage Fee"),
                      CommonText(text: controller.historyDetailsModel.safetyFee.toString()),
                    ],
                  ),
                  DottedLine(dashColor: Colors.red.shade300,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(text: "Subtotal"),
                      CommonText(text: controller.historyDetailsModel.subTotal.toString()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(text: "Discount"),
                      CommonText(text: "-${controller.historyDetailsModel.discount.toString()}"),
                    ],
                  ),
                  DottedLine(dashColor: Colors.red.shade300,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(text: "Net fare"),
                      CommonText(text: controller.historyDetailsModel.netFare.toString()),
                    ],
                  ),

                ],
              ),
              SizedBox(height: 24,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(text: "REQUEST AGAIN"),
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined,size: 16,)),
                ],
              ),


            ],
          ),
        );
      }),
    );
  }
}
