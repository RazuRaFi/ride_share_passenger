

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';

class CallController extends GetxController {
  var phoneNumber = ''.obs;

  Future<void> makeCall() async {
    final number = phoneNumber.value.trim();
    if (number.isEmpty) {
      Get.snackbar('Error', 'Please enter a phone number');
      return;
    }

    // Optionally request CALL_PHONE permission (mostly needed for direct call)
    var status = await Permission.phone.status;
    if (!status.isGranted) {
      status = await Permission.phone.request();
      if (!status.isGranted) {
        Get.snackbar('Permission denied', 'Please allow phone permission');
        return;
      }
    }

    final Uri launchUri = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      Get.snackbar('Error', 'Cannot place call to $number');
    }
  }
}
