import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ride_share_flat/model/Rent_Car_Model/rent_car_details.dart';

import '../../helpers/pref_helper.dart';
import '../../model/Rent_Car_Model/rent_car_model.dart';
import '../../services/api_services.dart';
import '../../utils/app_urls.dart';

class RentCarController extends GetxController {
  RentCarModel rentCarModel = RentCarModel(
    vehicleData: [],
    meta: Meta(page: 1, limit: 10, total: 0, totalPage: 1),
  );
  RentCarDetails rentCarDetails=RentCarDetails.fromJson({});

  RxBool isLoading = false.obs;
  RxBool isDetails=false.obs;
  RxList<VehicleData> carList = <VehicleData>[].obs;

  Future<RentCarModel?> getRentCar() async {
    isLoading(true);

    try {
      Map<String, String> header = {
        "token": PrefsHelper.token,
      };

      var response = await ApiService.getApi(AppUrls.rentCar, header: header);

      if (response.statusCode == 200) {
        final data = response.body['data'];
        rentCarModel = RentCarModel.fromJson(data);
        carList.assignAll(rentCarModel.vehicleData);
        log(">>>>>>>>>>>>>>>>>>>${carList.length}");
      }
    } catch (e) {
      log("Error fetching rent car list >>> $e");
    } finally {
      isLoading(false);
    }
    return null;
  }

  Future<void> getRentDetails() async {
    isDetails(true);
    try {
      Map<String, String> header = {
        "token": PrefsHelper.token,
      };

      final response = await ApiService.getApi(AppUrls.rentCarDetails, header: header);

      if (response.statusCode == 200) {
        final data = response.body['data'];
        rentCarDetails=RentCarDetails.fromJson(data);
      } else {
        log('API Error: ${response.statusCode}');
      }
    } catch (e) {
      log('Exception during rent car fetch: $e');
    } finally {
      isDetails(false);
    }
  }

}
