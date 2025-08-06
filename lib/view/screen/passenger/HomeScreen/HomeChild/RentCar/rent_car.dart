
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/controller/RentCarController/rentcar_show_controller.dart';
import 'package:ride_share_flat/utils/app_string.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';


import '../../../../../../utils/app_urls.dart';
import '../../../../../component/image/common_image.dart';
import '../../../../../component/text_field/custom_textfield.dart';

import 'RentcarDetails/rent-car_details.dart';

class RentCarScreen extends StatefulWidget {
  const RentCarScreen({super.key});

  @override
  State<RentCarScreen> createState() => _RentCarScreenState();
}

class _RentCarScreenState extends State<RentCarScreen> {
  final RentCarController controller=RentCarController();

  @override
  void initState() {
    controller.getRentCar();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: AppString.rentCar,fontSize: 16,fontWeight: FontWeight.w500,),
        centerTitle: true,
      ),
      body: Obx((){
        return controller.isLoading.value
            ? Center(child: CircularProgressIndicator(color: Colors.blueAccent,),)
            : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 14,),
                CustomTextField(hindText: "13th Street.47 W 13th St, New York",suffixIcon: Icon(Icons.search),fieldBorderRadius: 10,prefixIcon: Icon(Icons.location_pin),fieldBorderColor: Colors.grey,textStyle: TextStyle(fontSize: 12)),
                SizedBox(height: 20,),
                GridView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount:controller.carList.length,
                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.80
                    ),
                    itemBuilder: (context,index){
                      final car=controller.carList[index];
                      return  GestureDetector(
                        onTap: (){
                          Get.to(RentCarDetails(),arguments: car.id);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          height: 210,
                          width: 172,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Column(
                            spacing: 5,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/icons/logo.png",height: 22,width: 22,),
                                  CommonText(text: "CARENT",fontSize: 14,fontWeight: FontWeight.w600,)
                                ],
                              ),
                              CommonText(text: car.brandName,fontSize: 14,fontWeight: FontWeight.w500,),
                              SizedBox(height: 10,),
                              Container(
                                height: 61,
                                width: 167.53,
                                child:ClipOval(
                                  child: CommonImage(
                                    imageSrc:
                                    "${AppUrls.imageUrl}${car.vehiclePic}",
                                    imageType: ImageType.network,
                                    fill: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CommonText(text: car.rentTime,fontSize: 14,fontWeight: FontWeight.w500,),
                                      CommonText(text: "\$${car.rentRate.toString()}",fontSize: 14,fontWeight: FontWeight.w500),
                                    ],
                                  ),
                                  Container(
                                    height: 20,
                                    width: 56,
                                    decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Center(child: CommonText(text: AppString.rentNow,fontSize: 10,fontWeight: FontWeight.w500,color: Colors.white,)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                SizedBox(height: 24,),


              ],
            ),
          ),
        );
      }),
    );
  }
}
