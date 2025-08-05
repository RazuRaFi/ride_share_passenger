

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/controller/Mapcontroller/map_controller.dart';
import 'package:ride_share_flat/utils/app_string.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';
import 'package:ride_share_flat/view/component/button/CommonButton.dart';
import 'package:ride_share_flat/view/component/text_field/custom_textfield.dart';

import '../ConfirmLocationHome/confirm_location.dart';
import '../ConfirmLocationOffice/confirm_location.dart';

class TakeRideSet extends StatefulWidget {
  TakeRideSet({super.key});

  @override
  State<TakeRideSet> createState() => _TakeRideSetState();
}

class _TakeRideSetState extends State<TakeRideSet> {
  CustomMapController customMapController = Get.find<CustomMapController>();

  TextEditingController pickedLocationController = TextEditingController();

  TextEditingController dropOffLocationController = TextEditingController();

  bool isPickAddress = false;

  bool isDropOffAddress = false;

  RxBool showGoToMapButton = false.obs;

  @override
  void initState() {
    // TODO: implement initState
    pickedLocationController.addListener(checkFields);
    dropOffLocationController.addListener(checkFields);
    super.initState();
  }

  void checkFields(){
    showGoToMapButton.value = pickedLocationController.text.isNotEmpty && dropOffLocationController.text.isNotEmpty;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pickedLocationController.dispose();
    dropOffLocationController.dispose();
    super.dispose();
  }

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
              onChanged: (value) async {
                if (value.isNotEmpty) {
                  final searchResult = await customMapController.fetchPlaceSuggestions(value);
                  customMapController.suggestions.value = searchResult;
                  isPickAddress = true;
                  isDropOffAddress = false;
                } else {
                  customMapController.suggestions.clear();
                }
              },
              hindText: "Picked Location",suffixIcon: Icon(Icons.close),fieldBorderRadius: 10,prefixIcon: Icon(Icons.man),fieldBorderColor: Colors.grey,textStyle: TextStyle(fontSize: 12),),
            SizedBox(height: 10,),
            CustomTextField(
              controller: dropOffLocationController,
                onChanged: (value) async {
                  if (value.isNotEmpty) {
                    final searchResult = await customMapController.fetchPlaceSuggestions(value);
                    customMapController.suggestions.value = searchResult;
                    isPickAddress = false;
                    isDropOffAddress = true;
                  } else {
                    customMapController.suggestions.clear();
                  }
                },
                hindText: "Destination Location",suffixIcon: Icon(Icons.search),fieldBorderRadius: 10,prefixIcon: Icon(Icons.location_pin),fieldBorderColor: Colors.grey,textStyle: TextStyle(fontSize: 12)),
            SizedBox(height: 20,),
            Obx(() => customMapController.suggestions.isNotEmpty
                ? Container(
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
                          if(isPickAddress){
                            pickedLocationController.text = selectedSuggestion;
                          }else if(isDropOffAddress){
                            dropOffLocationController.text = selectedSuggestion;
                          }
                          FocusScope.of(context).unfocus();
                          customMapController.suggestions.clear();
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(height: 1),
                  ),
                )
                : const SizedBox.shrink(),),
            Obx(() => showGoToMapButton.value?
            CommonButton(
              onTap: () {

              },
                titleText: "Go to map"
            ) : SizedBox.shrink(),),
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
                Get.to(()=> SetLocationOffice());
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
