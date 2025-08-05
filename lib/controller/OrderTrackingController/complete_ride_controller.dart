import 'dart:developer';
import 'package:get/get.dart';
import 'package:ride_share_flat/model/OrderTrackingModel/complete_details_model.dart';

import '../../helpers/pref_helper.dart';
import '../../model/OrderTrackingModel/complete_ride_model.dart';
import '../../services/api_services.dart';
import '../../utils/app_urls.dart';

class CompleteShowController extends GetxController {
  CompleteRideModel completeRideModel = CompleteRideModel();
  CompleteDetailsModel completeDetailsModel=CompleteDetailsModel();
  RxBool isComplete = false.obs;
  RxBool isCompleteDetails = false.obs;
  RxList<Ride> completeList = <Ride>[].obs;

  Future<void> getCompleteRide() async {
    isComplete.value = true;

    try {
      Map<String, String> header = {
        "token": PrefsHelper.token,
      };

      final response = await ApiService.getApi(AppUrls.completeRide, header: header);

      if (response.statusCode == 200) {
        final data = response.body['data'];
        final parsedModel = CompleteRideModel.fromJson(data);

        completeRideModel = parsedModel;
        completeList.value = parsedModel.ride;
      } else {
        log("Unexpected response: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      log("Error fetching complete rides >>> $e");
    } finally {
      isComplete.value = false;
    }
  }

  Future<CompleteDetailsModel?> getCompleteDetails({required String id}) async {
    isCompleteDetails(true);

    try {
      Map<String, String> header = {
        "token": PrefsHelper.token,
      };

      var response = await ApiService.getApi(AppUrls.completeRideDetails(id), header: header);

      if (response.statusCode == 200) {
        final data = response.body['data'];
        completeDetailsModel=CompleteDetailsModel.fromJson(data);

      }
    } catch (e) {
      log("Error fetching pending rides >>> $e");
    } finally {
      isCompleteDetails(false);
    }

    return null;
  }
}
