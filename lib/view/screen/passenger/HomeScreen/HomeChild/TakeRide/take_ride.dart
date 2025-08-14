
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share_flat/helpers/debouncer.dart';
import 'package:ride_share_flat/utils/app_string.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';
import 'package:ride_share_flat/view/component/button/CommonButton.dart';
import 'package:ride_share_flat/view/component/text_field/custom_textfield.dart';

import '../../../../../../controller/MapControllers/custom_map_controller.dart';
import '../ConfirmLocationHome/confirm_location.dart';
import '../ConfirmLocationOffice/confirm_location.dart';

class TakeRideSet extends StatefulWidget {
  TakeRideSet({super.key});

  @override
  State<TakeRideSet> createState() => _TakeRideSetState();
}

class _TakeRideSetState extends State<TakeRideSet> {

  
  bool isPickAddress = false;
  bool isDropOffAddress = false;
  RxBool showGoToMapButton = false.obs;
  final CustomDeBouncer _deBouncer = CustomDeBouncer(delay: Duration(milliseconds: 500));
  CustomMapController customMapController = Get.find<CustomMapController>();

  @override
  void initState() {
    customMapController.pickedLocationController.addListener(checkFields);
    customMapController.dropOffLocationController.addListener(checkFields);
    super.initState();
  }

  void checkFields(){
    showGoToMapButton.value = customMapController.pickedLocationController.text.isNotEmpty && customMapController.dropOffLocationController.text.isNotEmpty;
  }

  @override
  void dispose() {
    // customMapController.pickedLocationController.dispose();
    // customMapController.dropOffLocationController.dispose();
    CustomMapController.instance.suggestions.clear();
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CustomTextField(
              controller: customMapController.pickedLocationController,
              onChanged: (value) {
                _deBouncer.run(() async {
                  if (value.isNotEmpty) {
                    final searchResult = await CustomMapController.instance.fetchPlaceSuggestions(value);
                    CustomMapController.instance.suggestions.value = searchResult;
                  } else {
                    CustomMapController.instance.suggestions.clear();
                  }
                });
                  isPickAddress = true;
                  isDropOffAddress = false;
              },
              hindText: "Picked Location",
              suffixIcon: InkWell(
                  onTap: () {
                    customMapController.pickedLocationController.clear();
                  },
                  child: Icon(Icons.close)),
              fieldBorderRadius: 10,prefixIcon: Icon(Icons.man),
              fieldBorderColor: Colors.grey,
              textStyle: TextStyle(fontSize: 12),),
            SizedBox(height: 10,),
            CustomTextField(
              controller: customMapController.dropOffLocationController,
                onChanged: (value) async {
                  _deBouncer.run(() async {
                    if (value.isNotEmpty) {
                      final searchResult = await CustomMapController.instance.fetchPlaceSuggestions(value);
                      CustomMapController.instance.suggestions.value = searchResult;
                    } else {
                      CustomMapController.instance.suggestions.clear();
                    }
                  });

                  // These should still be set immediately
                  isPickAddress = false;
                  isDropOffAddress = true;
                },
                hindText: "Destination Location",
                suffixIcon: InkWell(
                  onTap: () {
                    customMapController.dropOffLocationController.clear();
                  },
                    child: Icon(Icons.close)),
                fieldBorderRadius: 10,
                prefixIcon: Icon(Icons.location_pin),
                fieldBorderColor: Colors.grey,
                textStyle: TextStyle(fontSize: 12)
            ),
            SizedBox(height: 20,),
            Obx(() => CustomMapController.instance.suggestions.isNotEmpty
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
                    itemCount: CustomMapController.instance.suggestions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(CustomMapController.instance.suggestions[index]),
                        onTap: () {
                          final selectedSuggestion = CustomMapController.instance.suggestions[index];
                          if(isPickAddress){
                            customMapController.pickedLocationController.text = selectedSuggestion;
                          }else if(isDropOffAddress){
                            customMapController.dropOffLocationController.text = selectedSuggestion;
                          }
                          FocusScope.of(context).unfocus();
                          CustomMapController.instance.suggestions.clear();
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(height: 1),
                  ),
                )
                : const SizedBox.shrink(),),
            Obx(() => showGoToMapButton.value?
            CommonButton(
              isLoading: CustomMapController.instance.nearbyDriverLoading.value,
              onTap: () {
                CustomMapController.instance.fetchNearbyDrivers(
                    vehicleType: CustomMapController.instance.vehicleType.value,
                    pickedAddress: customMapController.pickedLocationController.text,
                    dropOffAddress: customMapController.dropOffLocationController.text
                );
              },
                titleText: "Go to map"
            ) : SizedBox.shrink(),),
            Divider(thickness: 1,color: Colors.brown,),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Get.to(()=> SetLocationHome());
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
