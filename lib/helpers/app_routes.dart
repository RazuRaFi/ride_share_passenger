import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:ride_share_flat/view/screen/common_screen/Onboarding/Onboarding_screen.dart';
import 'package:ride_share_flat/view/screen/common_screen/splash/splash_screen.dart';
import 'package:ride_share_flat/view/test_screen.dart';

class AppRoutes{

  static const String test = "/test_screen.dart";
  static const String splash = "/splash_screen.dart";
  static const String onboarding = "/onboarding_screen.dart";


  static List<GetPage> routes=[

    GetPage(
        name:test,
        page:()=> const TestScreenPage(),
      transition:Transition.fade),
    GetPage(
        name:splash,
        page:()=> const SplashScreen(),
      transition:Transition.fade
    ),
    GetPage(
        name:onboarding,
        page:()=> OnboardingScreen(),
      transition:Transition.fade
    ),

  ];
}