import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../helpers/pref_helper.dart';
import '../../model/Faq_Model/faq_model.dart';
import '../../services/api_services.dart';
import '../../utils/app_urls.dart';

class FaqController extends GetxController {
  RxBool isLoading = false.obs;
  RxList faqList = [].obs;

  Future<void> getFaq() async {
    isLoading.value = true;
    try {
      final headers = {"token": PrefsHelper.token};
      final response = await ApiService.getApi(AppUrls.faq, header: headers);

      final List<FaqModel> fetchedFaqs = (response.body['data'] as List)
          .map((e) => FaqModel.fromJson(e))
          .toList();

      faqList.value = fetchedFaqs;
    } catch (e) {
      faqList.clear();
    } finally {
      isLoading.value = false;
    }
  }
}