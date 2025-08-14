import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:ride_share_flat/helpers/app_routes.dart';
import 'package:ride_share_flat/model/EstimatePricingModel/estimate_pricing_model.dart';
import 'package:ride_share_flat/model/NearbyDriverModel/nearby_driver_model.dart';
import 'package:ride_share_flat/utils/app_utils.dart';

import '../../helpers/pref_helper.dart';
import '../../services/api_services.dart';
import '../../utils/api_key.dart';
import '../../utils/app_icons.dart';
import '../../utils/app_urls.dart';

class CustomMapController extends GetxController {
  static CustomMapController get instance => Get.put(CustomMapController());

  // Current location of the user
  var currentLocation = const LatLng(0, 0).obs;
  RxString currentAddress = "".obs;

  // Selected location (where the user taps on the map)
  var selectedLocation = const LatLng(0.0, 0.0).obs;

  // Source and destination for the route (demo data)
  var sourceLocation = const LatLng(0, 0).obs; // Dhaka, Bangladesh (demo source)
  var destinationLocation = const LatLng(0, 0).obs; // Slightly offset (demo destination)

  // Selected address as a string
  var selectedAddress = ''.obs;

  // List of markers (selected location, nearby drivers, source, destination)
  var markers = <Marker>[].obs;

  var setMarkers = <Marker>[].obs;

  var driverHomeMarker = <Marker>[].obs;
  final Set<Circle> driverCircles = {};

  // PolyLines for the route
  var polyLines = <Polyline>[].obs;

  // Google Map Controller
  GoogleMapController? mapController;

  // Marker icons
  BitmapDescriptor? locationMarkerIcon; // For current/selected location
  // BitmapDescriptor? electricBikeIcon; // For nearby drivers
  BitmapDescriptor? motorbikeIcon; // For nearby drivers
  BitmapDescriptor? autoRickshawIcon; // For nearby drivers
  BitmapDescriptor? privateCarIcon; // For nearby drivers
  BitmapDescriptor? coveredVanIcon; // For nearby drivers
  BitmapDescriptor? sourceIcon; // For source marker
  BitmapDescriptor? destinationIcon; // For destination marker

  BitmapDescriptor? vehicleMarkerIcon; // For destination marker

  // Duration and payment method
  var duration = 0.obs; // Duration in seconds
  var selectedPaymentMethod = 'Digital Payment'.obs; // Default payment method
  RxBool isLoading = false.obs;
  RxString vehicleType = "".obs;
  RxBool suggestionLoading = false.obs;
  RxList<String> suggestions = <String>[].obs;
  LatLng pickedLatLng = LatLng(0, 0);
  LatLng dropOffLatLng = LatLng(0, 0);

  TextEditingController pickedLocationController = TextEditingController();
  TextEditingController dropOffLocationController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    duration.value = 20; // Set duration to 20 seconds
    // getCurrentLocation();
    _loadMarkerIcons();
    _setDemoRoute();
  }

  @override
  void onClose() {
    // Dispose of the GoogleMapController when the controller is closed
    mapController?.dispose();
    mapController = null;
    super.onClose();
  }

  /// Convert Address to Lat/Lng
  Future<LatLng> convertAddressToLatLng(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address.trim());

      if (locations.isNotEmpty) {
        return LatLng(locations.first.latitude, locations.first.longitude);
      } else {
        throw Exception("No location found for: $address");
      }
    } catch (e) {
      log('Error converting address: $e');
      return CustomMapController.instance.currentLocation.value;
    }
  }

  /// Nearby Driver Found
  RxBool nearbyDriverLoading = false.obs;
  NearbyDriversModel nearbyDriversModel = NearbyDriversModel();
  List<NearbyDriversModel> nearbyDrivers = [];

  Future<void> fetchNearbyDrivers({vehicleType, pickedAddress, dropOffAddress}) async {
    nearbyDriverLoading(true);
    nearbyDrivers.clear();
    setMarkers.clear();
    this.vehicleType.value = vehicleType;
    pickedLatLng = await convertAddressToLatLng(pickedAddress);
    dropOffLatLng = await convertAddressToLatLng(dropOffAddress);
    try {
      Map<String, String> header = {"token": PrefsHelper.token};

      var response = await ApiService.getApi(
        AppUrls.nearbyVehicle(
          vehicleType: vehicleType,
          lat: pickedLatLng.latitude,
          long: pickedLatLng.longitude,
        ),
        header: header,
      );

      if (response.statusCode == 200) {
        final data = response.body['data'];
        nearbyDrivers = (data as List)
            .map((e) => NearbyDriversModel.fromJson(e))
            .toList();
        await _loadMarkerIcons(vehicleType: vehicleType);
        initialMarker(vehicleType: vehicleType);
        await estimatePriceCalculation();
        Get.toNamed(AppRoutes.bookingScreen);
      }
    } catch (e, s) {
      log("Error fetching pending rides >>> $e");
      log("Error lines >>> $s");
    } finally {
      nearbyDriverLoading(false);
    }
  }

  /// Distance Estimate price calculation
  RxBool isPriceCalculate = false.obs;
  RxList<Map<String, dynamic>> rideList = <Map<String, dynamic>>[].obs;
  EstimatePricingModel estimatePricingModel = EstimatePricingModel();

  Future<void> estimatePriceCalculation({seatCount}) async {
    isPriceCalculate(true);
    rideList.clear();
    try {
      Map<String, dynamic> body =
        {
          // "totalSit": seatCount,
          "pickupLocation": {
            "address": pickedLocationController.text,
            "location": {
              "type": "Point",
              "coordinates": [
                pickedLatLng.longitude,
                pickedLatLng.latitude
              ]
            }
          },
          "dropofLocation": {
            "address": dropOffLocationController.text,
            "location": {
              "type": "Point",
              "coordinates": [
                dropOffLatLng.longitude,
                dropOffLatLng.latitude
              ]
            }
          }
        };

      Map<String, String> header = {
        "token": PrefsHelper.token,
        "Content-Type": "application/json"
      };

      var response = await ApiService.postApi(
        AppUrls.estimatePrice,
        jsonEncode(body),
        header: header,
      );

      if (response.statusCode == 200) {
        final data = response.body['data'];
        log("estimate price: $data");
        estimatePricingModel = EstimatePricingModel.fromJson(data);

        for(EstimateDetail element in estimatePricingModel.estimates){
          log("Estimate element:$element");
          if(element.vehicleType == "bike"){
            rideList.add({
              "image": 'assets/images/bike.png',
              "title": "Bike",
              "subtitle": "Quick and affordable ride",
              "Price": element.price.toString(),
              "seatCount" : element.totalSit.toString(),
              "vehicleType" : element.vehicleType
            });
          }else{
            rideList.add({
              "image": 'assets/icons/carIcon.png',
              "title": "Car",
              "subtitle": "Quick and affordable ride",
              "Price": element.price.toString(),
              "seatCount" : element.totalSit.toString(),
              "vehicleType" : element.vehicleType
            });
          }
        }
        log("rideList $rideList");
      }
    } catch (e, s) {
      log("Error fetching >>> $e");
      log("Error lines >>> $s");
    } finally {
      isPriceCalculate(false);
    }
  }

  /// Address Suggestion api
  Future<List<String>> fetchPlaceSuggestions(String input) async {
    suggestionLoading(true);
    String apiKey = AppApiKeys.mapApiKey; // Replace with your actual key
    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$apiKey&components=country:bd', // You can change the country code
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final predictions = data['predictions'] as List;
      log("Suggestion Text- $input: $predictions");
      suggestionLoading(false);
      return predictions.map((e) => e['description'] as String).toList();
    } else {
      suggestionLoading(false);
      throw Exception('Failed to fetch suggestions');
    }
  }

  /// initial markers
  initialMarker({vehicleType}) {
    setMarkers.add(
      Marker(
        markerId: const MarkerId('source'),
        position: pickedLatLng,
        icon: sourceIcon ?? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    );
    if(nearbyDrivers.isNotEmpty){
      for (int i = 0; i < nearbyDrivers.length; i++) {
        final driver = nearbyDrivers[i];
        log(
          "🟢 VehicleMarker data for driver_$i: lat=${driver.latitude}, long=${driver.longitude}",
        );

        if (driver.latitude == 0.0 && driver.longitude == 0.0) {
          log("⚠️ Warning: driver_$i has default coordinates.");
        }

        log("selected vehicle type: $vehicleType");
        log("driver vehicle type: ${driver.vehicleType}");
        try {
          if(vehicleType == driver.vehicleType){
            setMarkers.add(
              Marker(
                markerId: MarkerId('driver_$i'),
                position: LatLng(driver.latitude, driver.longitude),
                icon: vehicleMarkerIcon ??
                    BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
              ),
            );
          }
        } catch (e) {
          log("❌ Error while adding marker for driver_$i: $e");
        }
      }
    }else{
      Utils.snackBarMessage("No nearby drivers found", "");
    }
  }

  /// Load marker icons
  Future<void> _loadMarkerIcons({vehicleType}) async {
    // Load location marker icon (AppIcons.locationMarker)
    sourceIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(devicePixelRatio: 2.5),
      AppIcons.sourceIcon, // Reuse locationMarker for source
      height: 50,
      width: 60,
    );

    destinationIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(devicePixelRatio: 2.5),
      AppIcons.destinationIcon, // Reuse locationMarker for destination
      height: 50,
      width: 60,
    );

    // Load electric bike icon for nearby drivers (AppIcons.electricBikeMapIcon)
    if (vehicleType == 'car') {
      vehicleMarkerIcon = await BitmapDescriptor.asset(
        const ImageConfiguration(devicePixelRatio: 2.5),
        AppIcons.carIcon,
        height: 30,
        width: 40,
      );
    } else if (vehicleType == 'bike') {
      vehicleMarkerIcon = await BitmapDescriptor.asset(
        const ImageConfiguration(devicePixelRatio: 2.5),
        AppIcons.bikeIcon,
        height: 30,
        width: 40,
      );
    } else {
      vehicleMarkerIcon = await BitmapDescriptor.asset(
        const ImageConfiguration(devicePixelRatio: 2.5),
        AppIcons.carIcon,
        height: 30,
        width: 40,
      );
    }

    // // Load source icon (using a generic marker for demo)
    // sourceIcon = await BitmapDescriptor.asset(
    //   const ImageConfiguration(devicePixelRatio: 2.5),
    //   AppIcons.sourceIcon, // Reuse locationMarker for source
    //   height: 50,
    //   width: 40,
    // );
    //
    // // Load destination icon (using a generic marker for demo)
    // destinationIcon = await BitmapDescriptor.asset(
    //   const ImageConfiguration(devicePixelRatio: 2.5),
    //   AppIcons.destinationIcon, // Reuse locationMarker for destination
    //   height: 50,
    //   width: 40,
    // );

    // Update markers after icons are loaded
    // _addNearbyDrivers();
    // _addSourceDestinationMarkers();
  }

  /// Get the user's current location
  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar('Error', 'Location services are disabled.');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Error', 'Location permissions are denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('Error', 'Location permissions are permanently denied.');
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    currentLocation.value = LatLng(position.latitude, position.longitude);
    currentAddress.value = await getAddressFromLatLng(position.latitude, position.longitude);
    selectedLocation.value = currentLocation.value;
    sourceLocation.value = currentLocation.value; // Set source as current location
    updateAddresses(position.latitude, position.longitude);

    if (mapController != null) {
      mapController!.animateCamera(
        CameraUpdate.newLatLng(currentLocation.value),
      );
    }
  }

  /// Address from lat lng
  Future<String> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        return "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
      }
      return "Address not found";
    } catch (e) {
      return "Error: $e";
    }
  }

  /// Ride Request Send Repo
  RxBool rideRequestSending = false.obs;
  Future<void> rideRequestRepo({vehicleType, seatCount, paymentMethod = "cash_payment"}) async {
    rideRequestSending(true);
    try {

      Map<String, dynamic> body = {
        "vehicle_type": vehicleType,
        "totalSit": seatCount,
        "ride_payment_method": paymentMethod,
        "pickupLocation": {
          "address": pickedLocationController.text,
          "location": {
            "type": "Point",
            "coordinates": [
              pickedLatLng.longitude.toStringAsFixed(6),
              pickedLatLng.latitude.toStringAsFixed(6)
            ]
          }
        },
        "dropofLocation": {
          "address": dropOffLocationController.text,
          "location": {
            "type": "Point",
            "coordinates": [
              dropOffLatLng.longitude.toStringAsFixed(6),
              dropOffLatLng.latitude.toStringAsFixed(6)
            ]
          }
        }
      };

      Map<String, String> header = {
        "token": PrefsHelper.token,
        "Content-Type": "application/json"
      };

      var response = await ApiService.postApi(
        AppUrls.rideRequest,
        jsonEncode(body),
        header: header,
      );

      if (response.statusCode == 200) {
        log(response.message);
      }
    } catch (e, s) {
      log("Error fetching pending rides >>> $e");
      log("Error lines >>> $s");
    } finally {
      rideRequestSending(false);
    }
  }

  // Add source and destination markers
  // void _addSourceDestinationMarkers() {
  //   if (sourceIcon == null || destinationIcon == null) return;
  //
  //   markers.removeWhere((marker) => marker.markerId.value == 'source' || marker.markerId.value == 'destination');
  //
  //   markers.add(
  //     Marker(
  //       markerId: const MarkerId('source'),
  //       position: sourceLocation.value,
  //       icon: sourceIcon!,
  //     ),
  //   );
  //
  //   markers.add(
  //     Marker(
  //       markerId: const MarkerId('destination'),
  //       position: destinationLocation.value,
  //       icon: destinationIcon!,
  //     ),
  //   );
  // }

  // Add nearby drivers (mock data with electric bike icons)
  void _addNearbyDrivers() {
    if (vehicleMarkerIcon == null) return;

    // Clear previous driver markers
    markers.removeWhere(
      (marker) => marker.markerId.value.startsWith('driver_'),
    );

    // Mock nearby driver locations (relative to selected location)
    List<LatLng> nearbyLocations = [
      LatLng(
        selectedLocation.value.latitude + 0.001,
        selectedLocation.value.longitude + 0.001,
      ),
      LatLng(
        selectedLocation.value.latitude - 0.001,
        selectedLocation.value.longitude - 0.001,
      ),
      LatLng(
        selectedLocation.value.latitude + 0.002,
        selectedLocation.value.longitude - 0.002,
      ),
      LatLng(
        selectedLocation.value.latitude - 0.002,
        selectedLocation.value.longitude + 0.002,
      ),
    ];

    for (int i = 0; i < nearbyLocations.length; i++) {
      log("VehicleMarker: $vehicleMarkerIcon");
      markers.add(
        Marker(
          markerId: MarkerId('driver_$i'),
          position: nearbyLocations[i],
          icon: vehicleMarkerIcon!,
        ),
      );
    }
  }

  // Set a demo route (mock polyline)
  void _setDemoRoute() {
    // Mock polyline points between source and destination
    List<LatLng> polylinePoints = [
      sourceLocation.value,
      LatLng(
        sourceLocation.value.latitude +
            (destinationLocation.value.latitude -
                    sourceLocation.value.latitude) /
                2,
        sourceLocation.value.longitude +
            (destinationLocation.value.longitude -
                    sourceLocation.value.longitude) /
                2,
      ),
      destinationLocation.value,
    ];

    polyLines.add(
      Polyline(
        polylineId: const PolylineId('route'),
        points: polylinePoints,
        color: Colors.red,
        width: 5,
      ),
    );
  }

  // Update the selected address based on latitude and longitude
  Future<void> updateAddresses(double latitude, double longitude) async {
    selectedLocation.value = LatLng(latitude, longitude);
    destinationLocation.value =
        selectedLocation.value; // Update destination on tap

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        selectedAddress.value =
            '${placemark.street}, ${placemark.locality}, ${placemark.country}';
      } else {
        selectedAddress.value = 'Unknown location';
      }
    } catch (e) {
      selectedAddress.value = 'Error fetching address';
      debugPrint("Error fetching address: $e");
    }

    // Update selected location marker
    markers.removeWhere(
      (marker) => marker.markerId.value == 'selected_location',
    );
    markers.add(
      Marker(
        markerId: const MarkerId('selected_location'),
        position: selectedLocation.value,
        icon:
            locationMarkerIcon ??
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    );

    // Update nearby drivers
    _addNearbyDrivers();
    // Update source and destination markers
    // _addSourceDestinationMarkers();
    // Update polyline
    _setDemoRoute();

    if (mapController != null) {
      mapController!.animateCamera(
        CameraUpdate.newLatLng(selectedLocation.value),
      );
    }
  }

  // Set the Google Map Controller
  void setGoogleMapController(GoogleMapController controller) {
    mapController = controller;
  }

  // Handle setting the location as Home or Work
  void setAsHome() {
    Get.snackbar('Success', 'Location set as Home: ${selectedAddress.value}');
    Get.back(result: {'address': selectedAddress.value, 'type': 'Home'});
  }

  void setAsWork() {
    Get.snackbar('Success', 'Location set as Work: ${selectedAddress.value}');
    Get.back(result: {'address': selectedAddress.value, 'type': 'Work'});
  }
}

// var currentLocation = const LatLng(23.759139, 90.429084).obs;
