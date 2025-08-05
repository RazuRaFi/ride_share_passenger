
import 'package:get/get.dart';

import '../controller/AuthController/SignInController.dart';
import '../controller/AuthController/Sign_up_controller.dart';
import '../controller/MapController/map_controller.dart';
import '../controller/Profile/profile_controller.dart';
import '../controller/SettingController/change_password.dart';
import '../controller/splash_controller/splash_controller.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => SignInController(), fenix: true);
    Get.lazyPut(() => ChangePasswordController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => CustomMapController(), fenix: true);
    Get.lazyPut(() => SplashController(), fenix: true);
    // Get.lazyPut(() => SettingController(), fenix: true);
    // Get.lazyPut(() => PrivacyPolicy(), fenix: true);
    // Get.lazyPut(() => TermsOfServicesController(), fenix: true);
    // Get.lazyPut(() => HomeController(), fenix: true);
    // Get.lazyPut(() => FeedBackController(), fenix: true);
    // Get.lazyPut(() => MapController(), fenix: true);
  }
}
