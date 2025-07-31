import 'dart:developer';
import 'package:get/get.dart';
import '../../helpers/pref_helper.dart';
import '../../model/NotificationModel/notification_model.dart';
import '../../services/api_services.dart';
import '../../utils/app_urls.dart';

class NotificationController extends GetxController {
  NotificationModel notificationModel = NotificationModel();
  RxBool isLoading = false.obs;
  RxList<NotificationModel> notifyList = <NotificationModel>[].obs;

  int page = 1;
  final int limit = 20;

  RxBool hasMore = true.obs;
  RxBool isPaginating = false.obs;

  Future<void> getNotification({bool isFirstLoad = false}) async {
    if (isFirstLoad) {
      isLoading(true);
      page = 1;
      hasMore(true);
      notifyList.clear();
    } else {
      if (isPaginating.value || !hasMore.value) return;
      isPaginating(true);
    }

    try {
      Map<String, String> header = {
        "token": PrefsHelper.token,
      };

      final url = "${AppUrls.notification}?page=$page&limit=$limit";
      final response = await ApiService.getApi(url, header: header);

      if (response.statusCode == 200) {
        final data = response.body['data'];
        final List notifications = data['notification'];

        final List<NotificationModel> fetched = notifications
            .map((e) => NotificationModel.fromJson(e))
            .toList();

        if (fetched.length < limit) {
          hasMore(false);
        }

        notifyList.addAll(fetched);
        page++;
      }
    } catch (e) {
      log("Error: $e");
    } finally {
      isLoading(false);
      isPaginating(false);
    }
  }
}
