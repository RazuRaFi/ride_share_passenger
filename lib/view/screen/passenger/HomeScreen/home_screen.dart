
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share_flat/controller/HomeController/home_controller.dart';
import 'package:ride_share_flat/controller/MapControllers/custom_map_controller.dart';
import 'package:ride_share_flat/helpers/app_routes.dart';
import 'package:ride_share_flat/utils/app_string.dart';
import 'package:ride_share_flat/view/component/text_field/custom_textfield.dart';
import 'package:ride_share_flat/view/screen/passenger/HomeScreen/Widget/drawer_screen.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../component/CommonText.dart';
import '../../../component/image/common_image.dart';
import 'HomeChild/Notifications/notifications.dart';
import 'HomeChild/RentCar/rent_car.dart';
import 'HomeChild/Schedule/Schedule_screen.dart';
import 'HomeChild/SetLocation/set_location.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController searchTextController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final HomeController homeController=Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: HomeDrawer(),
      key: _scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: CommonImage(
                      imageSrc: AppIcons.drawermenu,
                      imageType: ImageType.png,
                      size: 24,
                    ),
                  ),
                  IconButton(onPressed: (){
                    Get.to(Notifications());
                  }, icon: Icon(Icons.notifications_none_outlined,size: 24,))
                ],
              ),
              Expanded(
                  child:SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on_sharp,color: Colors.black,size: 30,),
                            Obx(() => Flexible(
                              child: CommonText(
                                textAlign: TextAlign.start,
                                text: CustomMapController.instance.currentAddress.isNotEmpty? CustomMapController.instance.currentAddress.value : "current Location Loading...",
                                color: AppColors.blackLight,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),),
                          ],
                        ),
                        SizedBox(height: 47,),
                        SizedBox(
                          height: 120, // <-- Provide a fixed height
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: homeController.serviceList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: GestureDetector(
                                onTap:(){
                                  if(index==0){
                                    CustomMapController.instance.vehicleType.value = 'bike';
                                    Get.toNamed(AppRoutes.takeRideSet);
                                    // Get.to(()=> TakeRideSet());
                                  }else if(index==1){
                                    CustomMapController.instance.vehicleType.value = 'car';
                                    Get.toNamed(AppRoutes.takeRideSet);
                                  }else if(index==2){
                                    Get.to(()=> RentCarScreen());
                                  }
                                  else if(index==3){
                                  Get.to(()=> ScheduleScreen());
                                  }
                                },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 75,
                                        width: 75,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          "${homeController.serviceList[index]['image']}",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      CommonText(text: "${homeController.serviceList[index]['title']}"),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 26,),
                        CommonText(text: AppString.takeRide,fontSize: 16,fontWeight: FontWeight.w500,),
                        SizedBox(height: 16,),
                        // GestureDetector(
                        //   onTap: (){
                        //     Get.to(SetLocation());
                        //   },
                        //   child: TextFormField(
                        //     controller: searchTextController,
                        //     decoration: InputDecoration(
                        //       contentPadding: EdgeInsets.zero,
                        //       hintText: "Search a destination",
                        //       prefixIcon: Icon(Icons.location_on),
                        //       suffixIcon: Icon(Icons.search),
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(10),
                        //         borderSide: BorderSide(color: Colors.grey)
                        //       ),
                        //       enabledBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(10),
                        //           borderSide: BorderSide(color: Colors.grey)
                        //       ),
                        //       focusedBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(10),
                        //           borderSide: BorderSide(color: Colors.grey)
                        //       ),
                        //
                        //     ),
                        //   ),
                        // ),
                        CustomTextField(hindText:AppString.searchDestination,prefixIcon: Icon(Icons.location_pin),suffixIcon: Icon(Icons.search),fieldBorderRadius: 10,fieldBorderColor: Colors.grey,
                          onTap: (){
                          Get.to(SetLocation());
                          },),
                        SizedBox(height: 16,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                          height:59,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             Row(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.start,
                               spacing: 10,
                               children: [
                                 Image.asset("assets/icons/homeicon.png",height: 38,width: 38,),
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   spacing: 5,
                                   children: [
                                     CommonText(text: AppString.home,fontSize: 14,fontWeight:FontWeight.w500),
                                     CommonText(text: AppString.setAddress,fontSize: 12,fontWeight: FontWeight.w400,),
                                   ],
                                 )
                               ],
                             ),
                              VerticalDivider(thickness: 1,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                spacing: 10,
                                children: [
                                  Image.asset("assets/icons/workicon.png",height: 38,width: 38,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    spacing: 5,
                                    children: [
                                      CommonText(text: AppString.work,fontSize: 14,fontWeight:FontWeight.w500),
                                      CommonText(text: AppString.setAddress,fontSize: 12,fontWeight: FontWeight.w400,),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16,),
                        SizedBox(
                          height: 120, // <-- Provide a fixed height
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Container(
                                  height: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 19,),
                                            CommonText(text: AppString.multiplePromos,fontSize: 12,fontWeight: FontWeight.w500,),
                                            Row(
                                              children: [
                                                CommonText(text: AppString.termsApply,fontSize: 12,fontWeight: FontWeight.w400,),
                                                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined,size: 15,)),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: double.infinity,
                                        width: 87,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade400,
                                          borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
                                        ),
                                        child: Image.asset("assets/icons/promos.png"),

                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 23,),
                        CommonText(text: AppString.moreWayScope,fontSize: 16,fontWeight: FontWeight.w500,),
                        SizedBox(height: 24,),
                        SizedBox(
                          height: 210, // <-- Provide a fixed height
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Container(
                                  height:210,
                                  width: 205,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child:Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 2,),
                                      Container(
                                        height: 119,
                                        width: 196,
                                        decoration: BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                        ),
                                        child: Image.asset("assets/icons/scope1.png"),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                CommonText(text: AppString.passengerSafety),
                                                Expanded(child: IconButton(onPressed: (){}, icon:Icon(Icons.arrow_forward,size: 18,)))
                                              ],
                                            ),
                                            CommonText(textAlign: TextAlign.start,
                                                text:AppString.onTripIssues),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 26,),
                      ],
                    ),
                  ))


            ],
          ),
        ),
      ),
    );
  }
}
