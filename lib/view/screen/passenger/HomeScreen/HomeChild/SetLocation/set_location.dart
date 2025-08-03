import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ride_share_flat/utils/app_string.dart';

import '../../../../../../controller/Mapcontroller/create_load_controller.dart';
import '../../../../../../controller/Mapcontroller/map_controller.dart';
import '../../../../../../helpers/app_routes.dart';
import '../../../../../../utils/app_colors.dart';
import '../../../../../../utils/app_icons.dart';
import '../../../../../component/button/CommonButton.dart';
import '../../../../../component/image/common_image.dart';
import '../../../../../component/text_field/custom_textfield.dart';

class SetLocation extends StatefulWidget {
  const SetLocation({super.key});

  @override
  State<SetLocation> createState() => _SetLocationHomeState();
}

class _SetLocationHomeState extends State<SetLocation> {
  final MapController mapController = Get.put(MapController());
  final CreateLoadMapController createLoadMapController = Get.put(CreateLoadMapController());

  final String googleApiKey = "AIzaSyC0hhuHPap6Wk98dZIyQdvvpoE3p-LuXhU";
  final TextEditingController searchLocationController = TextEditingController();

  @override
  void dispose() {
    searchLocationController.dispose();
    Get.delete<MapController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Google Map
          Obx(() {
            return mapController.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: mapController.currentLocation.value,
                zoom: 16.0,
              ),
              onMapCreated: mapController.setGoogleMapController,
              myLocationEnabled: true,
              onTap: (argument) async {
                mapController.updateAddresses(argument.latitude, argument.longitude);
              },
              markers: Set<Marker>.of(mapController.markers),
              circles: mapController.driverCircles,
            );
          }),

          // Back button
          Positioned(
            top: 60,
            left: 20,
            child: circleIconButton(
              context,
              onTap: () {
                Map<String, String> data = {
                  "address": createLoadMapController.selectedAddress.value,
                  "city": createLoadMapController.city,
                  "state": createLoadMapController.state,
                  "zip": createLoadMapController.zip,
                };
                Navigator.pop(context, data);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),

          // Floating icons
          Positioned(
            bottom: 250,
            right: 16,
            child: circleIconButton(
              context,
              onTap: () {
                Get.toNamed(AppRoutes.safetyScreen);
              },
              icon: CommonImage(imageSrc: AppIcons.safety, size: 24),
            ),
          ),
          Positioned(
            bottom: 320,
            right: 16,
            child: circleIconButton(
              context,
              onTap: () {
                // Future use
              },
              icon: CommonImage(imageSrc: AppIcons.offersSolid, size: 24),
            ),
          ),

          // Bottom container
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 203,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 8),
                  Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    hindText: "13th Street.47 W 13th St, New York",
                    suffixIcon: const Icon(Icons.search),
                    fieldBorderRadius: 10,
                    prefixIcon: const Icon(Icons.location_pin),
                    fieldBorderColor: Colors.grey,
                    textStyle: const TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 16),
                  CommonButton(
                    titleText: AppString.setLocation,
                    backgroundColor: Colors.black,
                    titleColor: Colors.white,
                    buttonHeight: 56,
                    buttonWidth: double.infinity,
                    titleSize: 16,
                    titleWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget circleIconButton(BuildContext context, {required VoidCallback onTap, required Widget icon}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: icon,
      ),
    );
  }
}
