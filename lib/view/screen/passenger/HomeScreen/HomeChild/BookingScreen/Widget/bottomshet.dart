
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share_flat/controller/MapControllers/custom_map_controller.dart';
import 'package:ride_share_flat/helpers/my_extension.dart';
import 'package:ride_share_flat/view/component/button/CommonButton.dart';
import 'package:ride_share_flat/view/component/other_widgets/common_loader.dart';

import '../../../../../../component/CommonText.dart';
import '../FindingRides/finding_rides.dart';

class RideBottomSheet extends StatelessWidget {
  RideBottomSheet({super.key});

  CustomMapController customMapController = Get.find<CustomMapController>();
  String seatCount = '';

  @override
  Widget build(BuildContext context) {

    return DraggableScrollableSheet(
      initialChildSize: 0.3, // default height (0.0 to 1.0)
      minChildSize: 0.2,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              16.height,
              Obx(() {
                return Expanded(
                  child: customMapController.isPriceCalculate.value? CommonLoader() :
                  customMapController.rideList.isEmpty? Center(child: CommonText(text: "No rides available"))
                      : MediaQuery.removePadding(
                    context: context,
                        removeTop: true,
                        child: ListView.builder(
                                            controller: scrollController,
                                            itemCount: customMapController.rideList.length,
                                            itemBuilder: (context, index) {
                        var rideItem = customMapController.rideList[index];
                        if(CustomMapController.instance.vehicleType.value == rideItem['vehicleType']){
                          seatCount = rideItem['seatCount'];
                        }
                        return InkWell(
                          onTap: () {
                            if(CustomMapController.instance.vehicleType.value != rideItem['vehicleType']){

                              CustomMapController.instance.vehicleType.value = rideItem['vehicleType'];
                              CustomMapController.instance.fetchNearbyDrivers(
                                  vehicleType: CustomMapController.instance.vehicleType.value,
                                  pickedAddress: customMapController.pickedLocationController.text,
                                  dropOffAddress: customMapController.dropOffLocationController.text
                              );
                            }
                          },
                          child: Obx(() => Container(
                            margin:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: CustomMapController.instance.vehicleType.value == rideItem['vehicleType']? Colors.red : Colors.black12),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  rideItem['image'],
                                  height: 50,
                                  width: 60,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CommonText(
                                            text: rideItem['title'],
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          const SizedBox(width: 5),
                                          const Icon(Icons.person, size: 18),
                                          CommonText(
                                            text: rideItem['seatCount'],
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      CommonText(
                                        textAlign: TextAlign.start,
                                        text: rideItem['subtitle'],
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey.shade600,
                                      ),
                                    ],
                                  ),
                                ),
                                CommonText(
                                  text: rideItem['Price'],
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )
                              ],
                            ),
                          ),),
                        );
                                            },
                                          ),
                      ),
                );
              },),
              Obx(() {
                return customMapController.rideList.isEmpty? SizedBox.shrink()
                    :Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CommonButton(
                    isLoading: customMapController.rideRequestSending.value,
                    titleText: "Choose ${CustomMapController.instance.vehicleType.value}",
                    buttonHeight: 56,
                    buttonWidth: 361,
                    backgroundColor: Colors.black,
                    titleColor: Colors.white,
                    titleSize: 16,
                    onTap: (){
                      customMapController.rideRequestRepo(vehicleType: CustomMapController.instance.vehicleType.value, seatCount: seatCount);
                      // Get.to(()=>FindingRides());
                    },
                  ),
                );
              },)
            ],
          ),
        );
      },
    );
  }
}
