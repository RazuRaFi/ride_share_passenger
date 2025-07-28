

import 'dart:developer';

import 'package:get/get.dart';
import 'package:ride_share_flat/model/OrderTrackingModel/pending_details_model.dart' hide Ride;

import '../../helpers/pref_helper.dart';
import '../../model/OrderTrackingModel/Pending_ride_model.dart';
import '../../services/api_services.dart';
import '../../utils/app_urls.dart';

class PendingShowController extends GetxController{
  PendingShowModel pendingShowModel=PendingShowModel();
  PendingRideDetails pendingRideDetails=PendingRideDetails();
  RxBool isPending=false.obs;
  RxBool isPendingDetails=false.obs;
  RxList<Ride> pendingList=<Ride>[].obs;


  Future<PendingShowModel?> getPendingRide() async {
    isPending(true);

    try {
      Map<String, String> header = {
        "token": PrefsHelper.token,
      };

      var response = await ApiService.getApi(AppUrls.pendingRider, header: header);

      if (response.statusCode == 200) {
        final data = response.body['data'];
        final parsedModel = PendingShowModel.fromJson(data);

        pendingShowModel = parsedModel;
        pendingList.value = parsedModel.ride;
        return parsedModel;
      }
    } catch (e) {
      log("Error fetching pending rides >>> $e");
    } finally {
      isPending(false);
    }

    return null;
  }

  Future<PendingRideDetails?> getRiderDetails() async {
    isPendingDetails(true);

    try {
      Map<String, String> header = {
        "token": PrefsHelper.token,
      };

      var response = await ApiService.getApi(AppUrls.pendingRiderDetails, header: header);

      if (response.statusCode == 200) {
        final data = response.body['data'];
        pendingRideDetails=PendingRideDetails.fromJson(data);

      }
    } catch (e) {
      log("Error fetching pending rides >>> $e");
    } finally {
      isPendingDetails(false);
    }

    return null;
  }
}