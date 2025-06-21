import 'package:get/get.dart';
import 'package:ride_share_flat/view/screen/common_screen/CreatePassword/create_new_password.dart';
import 'package:ride_share_flat/view/screen/common_screen/EmailVerification/email_verification.dart';
import 'package:ride_share_flat/view/screen/common_screen/ForgottenPassword/forgottern_password.dart';
import 'package:ride_share_flat/view/screen/common_screen/Onboarding/Onboarding_screen.dart';
import 'package:ride_share_flat/view/screen/common_screen/SignUp/SIgn_up_screen.dart';
import 'package:ride_share_flat/view/screen/common_screen/signIn/sign_in_screen.dart';
import 'package:ride_share_flat/view/screen/common_screen/splash/splash_screen.dart';
import 'package:ride_share_flat/view/test_screen.dart';




class AppRoutes {
  static const String test = "/test_screen.dart";
  static const String splash = "/splash_screen.dart";
  static const String passengerOnboarding = "/passenger_onboarding_screen.dart";
  static const String signUp = "/sign_up_screen.dart";
  static const String verifyUser = "/verify_user.dart";
  static const String signIn = "/sign_in_screen.dart";
  static const String forgotPassword = "/forgot_password.dart";
  static const String verifyEmail = "/verify_screen.dart";
  static const String createPassword = "/create_password.dart";
  static const String changePassword = "/change_password_screen.dart";
  static const String notifications = "/notifications_screen.dart";
  static const String profile = "/profile_screen.dart";
  static const String editProfile = "/edit_profile.dart";
  static const String privacyPolicy = "/privacy_policy_screen.dart";
  static const String termsOfServices = "/terms_of_services_screen.dart";
  static const String setting = "/setting_screen.dart";
  static const String navBarScreen = "/common_bottom_bar.dart";
  static const String homeScreen = "/home_screen.dart";
  static const String helpCenterScreen = "/help_center_screen.dart";
  static const String filterScreen = "/filter_screen.dart";
  static const String viewDetailsScreen = "/view_details_screen.dart";
  static const String insightsScreen = "/insights_screen.dart";
  static const String subscriptionScreen = "/subscription_screen.dart";
  static const String feedbackScreen = "/feedback_screen.dart";
  static const String featureRequestScreen = "/feature_request_screen.dart";


  static const String roleSelectionScreen = "/role_selection_screen.dart";
  static const String welcomeScreen = "/welcome_screen.dart";
  static const String offersScreen = "/offer_screen.dart";
  static const String tripDetailsScreen = "/trip_details_screen.dart";
  static const String paymentMethodScreen = "/payment_method_screen.dart";
  static const String historyScreen = "/history_screen.dart";
  static const String fAQScreen = "/faq_screen.dart";
  static const String orderTrackingScreen = "/order_tracking_screen.dart";
  static const String pendingTripDetailsScreen = "/pending_trip_details_screen.dart";
  static const String safetyScreen = "/safety_screen.dart";
  static const String customerServiceScreen = "/customer_service_screen.dart";
  static const String setLocationScreen = "/set_location_map_screen.dart";
  static const String scheduledTripScreen = "/scheduled_trip_screen.dart";
  static const String scheduleTripDetailsScreen = "/schedule_trip_detail_screen.dart";
  static const String mapScreen = "/map_screen.dart";
  static const String completeProfileScreen = "/complete_profile_screen.dart";
  static const String identityConfirmationScreen = "/indentity_confirmation.dart";
  static const String withdrawalInformationScreen = "/withdrawal_information.dart";
  static const String earningScreen = "/earning_screen.dart";
  static const String earningDetailsScreen = "/earning_details_screen.dart";
  static const String withdrawScreen = "/withdraw_screen.dart";
  static const String driverHomeScreen = "/driver_home_screen.dart";

  static List<GetPage> routes = [
    GetPage(
        name: test,
        page: () => const TestScreenPage(),
        transition: Transition.fade),
    GetPage(
        name: splash,
        page: () => const SplashScreen(),
        transition: Transition.fade),
    GetPage(
        name: passengerOnboarding,
        page: () => OnboardingScreen(),
        transition: Transition.fade),
    GetPage(
        name: signUp,
        page: () => SignUpScreen(),
        transition: Transition.fade),
    // GetPage(
    //     name: verifyUser,
    //     page: () => const EmailVerification(),
    //     transition: Transition.fade),
    GetPage(
        name: signIn,
        page: () => SignInScreen(),
        transition: Transition.fade),
    GetPage(
        name: forgotPassword,
        page: () => ForgottenPassword(),
        transition: Transition.fade),
    GetPage(
        name: verifyEmail,
        page: () => const EmailVerification(),
        transition: Transition.fade),
    GetPage(
        name: createPassword,
        page: () => CreateNewPassword(),
        transition: Transition.fade),
    // GetPage(
    //     name: changePassword,
    //     page: () => ChangePasswordScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: notifications,
    //     page: () => const NotificationScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: profile,
    //     page: () => const ProfileScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: editProfile,
    //     page: () => EditProfile(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: privacyPolicy,
    //     page: () => const PrivacyPolicyScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: termsOfServices,
    //     page: () => const TermsOfServicesScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: setting,
    //     page: () => const SettingScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: homeScreen,
    //     page: () => HomeScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: helpCenterScreen,
    //     page: () => HelpCenterScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: subscriptionScreen,
    //     page: () => SubscriptionScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: feedbackScreen,
    //     page: () => FeedbackScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: featureRequestScreen,
    //     page: () => FeatureRequestScreen(),
    //     transition: Transition.fade),
    //
    //
    // GetPage(
    //     name: roleSelectionScreen,
    //     page: () => const RoleSelectionScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: welcomeScreen,
    //     page: () => const WelcomeScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: offersScreen,
    //     page: () => OfferScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: navBarScreen,
    //     page: () => NavBarScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: tripDetailsScreen,
    //     page: () => const TripDetailsScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: paymentMethodScreen,
    //     page: () => PaymentMethodScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: historyScreen,
    //     page: () => HistoryScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: fAQScreen,
    //     page: () => FAQScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: orderTrackingScreen,
    //     page: () => OrderTrackingScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: pendingTripDetailsScreen,
    //     page: () => PendingTripDetailsScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: safetyScreen,
    //     page: () => SafetyScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: customerServiceScreen,
    //     page: () => CustomerServiceScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: setLocationScreen,
    //     page: () => SetLocationScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: scheduledTripScreen,
    //     page: () => ScheduledTripScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: scheduleTripDetailsScreen,
    //     page: () => ScheduleTripDetailsScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: mapScreen,
    //     page: () => MapScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: completeProfileScreen,
    //     page: () => CompleteProfileScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: identityConfirmationScreen,
    //     page: () => IdentityConfirmationScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: withdrawalInformationScreen,
    //     page: () => WithdrawalInformationScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: earningScreen,
    //     page: () => EarningScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: earningDetailsScreen,
    //     page: () => EarningDetailsScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: withdrawScreen,
    //     page: () => WithdrawScreen(),
    //     transition: Transition.fade),
    // GetPage(
    //     name: driverHomeScreen,
    //     page: () => DriverHomeScreen(),
    //     transition: Transition.fade),
  ];
}