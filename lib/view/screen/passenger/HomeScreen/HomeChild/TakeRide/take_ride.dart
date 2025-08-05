

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/controller/Mapcontroller/map_controller.dart';
import 'package:ride_share_flat/utils/app_string.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';
import 'package:ride_share_flat/view/component/text_field/custom_textfield.dart';
import 'package:ride_share_flat/view/screen/passenger/HomeScreen/HomeChild/SetLocation/set_location.dart';

import '../ConfirmLocationHome/confirm_location.dart';
import '../ConfirmLocationOffice/confirm_location.dart';

class TakeRideSet extends StatelessWidget {
  TakeRideSet({super.key});

  CustomMapController customMapController = Get.find<CustomMapController>();
  TextEditingController pickedLocationController = TextEditingController();
  TextEditingController dropOffLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: AppString.setLocation,fontSize: 16,fontWeight: FontWeight.w500,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CustomTextField(
              controller: pickedLocationController,
              onTap: (){
                Get.to(()=>SetLocation());
              },
              hindText: "Picked Location",suffixIcon: Icon(Icons.close),fieldBorderRadius: 10,prefixIcon: Icon(Icons.man),fieldBorderColor: Colors.grey,textStyle: TextStyle(fontSize: 12),),
            SizedBox(height: 10,),
            CustomTextField(
              controller: dropOffLocationController,
              onTap: (){
                Get.to(()=>SetLocation());
              },
                onChanged: (value) async {
                  if (value.isNotEmpty) {
                    final searchResult = await customMapController.fetchPlaceSuggestions(value);
                    customMapController.suggestions.value = searchResult;
                  } else {
                    customMapController.suggestions.clear();
                  }
                },
                hindText: "Destination Location",suffixIcon: Icon(Icons.search),fieldBorderRadius: 10,prefixIcon: Icon(Icons.location_pin),fieldBorderColor: Colors.grey,textStyle: TextStyle(fontSize: 12)),
            SizedBox(height: 20,),
            Obx(() => customMapController.suggestions.isNotEmpty
                ? Positioned(
              top: 200,
              left: 20,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 5),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: customMapController.suggestions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(customMapController.suggestions[index]),
                      onTap: () {
                        final selectedSuggestion = customMapController.suggestions[index];

                        FocusScope.of(context).unfocus();
                        customMapController.suggestions.clear();
                      },
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(height: 1),
                ),
              ),
            )
                : const SizedBox.shrink(),),
            // ListView.builder(
            //   shrinkWrap: true,
            //     physics: ScrollPhysics(),
            //     itemCount: 3,
            //     itemBuilder: (context,index){
            //   return Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Row(
            //         spacing: 10,
            //         children: [
            //           Icon(Icons.history),
            //           CommonText(text: "13th Street.47 W 13th St, New York",fontSize: 14,fontWeight: FontWeight.w400,),
            //         ],
            //       ),
            //       IconButton(onPressed: (){}, icon: Icon(Icons.close)),
            //     ],
            //   );
            // }),
            Divider(thickness: 1,color: Colors.brown,),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Get.to(SetLocationHome());
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200
                ),
                child:   Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 15,
                  children: [
                    Image.asset("assets/icons/homeicon.png",height: 30,width: 30,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        CommonText(text:AppString.home,fontSize: 14,fontWeight:FontWeight.w500),
                        CommonText(text: AppString.setAddress,fontSize: 12,fontWeight: FontWeight.w400,),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Get.to(SetLocationOffice());
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200
                ),
                child:   Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 15,
                  children: [
                    Image.asset("assets/icons/workicon.png",height: 30,width: 30,),
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
              ),
            ),

          ],
        ),
      ),
    );
  }
}
