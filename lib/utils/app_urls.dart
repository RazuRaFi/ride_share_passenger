class AppUrls {
  static const baseUrl = "http://10.10.10.31:7010/api/v1";
  // static const baseUrl = "https://ride-sharing-flad.onrender.com/api/v1";
  static const imageUrl = "http://10.10.10.31:7010";
  // static const imageUrl = "https://ride-sharing-flad.onrender.com";
  // static const socketUrl = "https://ride-sharing-flad.onrender.com";
  static const socketUrl = "ws://10.10.10.31:7010";


  static const signUp = "$baseUrl/users/create-passenger";
  static const verifyEmail = "$baseUrl/users/create-user-verify-otp";
  static const signIn = "$baseUrl/auth/login";
  static const forgotPassword = "$baseUrl/auth/forgot-password-otpByEmail";
  static const verifyOtp = "$baseUrl/auth/forgot-password-otp-match";
  static const resetPassword = "$baseUrl/auth/forgot-password-reset";
  static const changePassword = "$baseUrl/auth/change-password";
  static const user = "$baseUrl/users";
  static const privacyPolicies = "$baseUrl/privacy-policies";
  static const termsOfServices = "$baseUrl/terms-and-conditions";
  static const chats = "$baseUrl/chats";
  static const messages = "$baseUrl/messages";
  static const myProfile = "$baseUrl/passenger/get-profile";
  static const updateProfile = "$baseUrl/users/update-my-profile";
  static const safety = "$baseUrl/safety";
  static const faq = "$baseUrl/settings/all-faq";
  static const policy = "$baseUrl/policy";
  static const wallet = "$baseUrl/wallet/get-balance";
  static const offer = "$baseUrl/offer";
  static const notification = "$baseUrl/notifications/my-notifications";
  static const customerService = "$baseUrl/customer";
  static const delete = "$baseUrl/users/delete-my-account";
  static const completeProfile = "$baseUrl/users/complete";
  static const pendingRider = "$baseUrl/passenger/get-pending-rides";
  static String pendingRiderDetails(String id) => "$baseUrl/passenger/get-pending-rides/$id";
  static const completeRide = "$baseUrl/passenger/get-complete-rides";
  static String completeRideDetails(String id) => "$baseUrl/passenger/get-complete-rides/$id";
  static const history = "$baseUrl/passenger/history";
  static String historyDetails(String id) => "$baseUrl/passenger/history/$id";
  static const message = "$baseUrl/ride/ride-status/688eda909863807a05ffa11f";
  static const rentCar = "$baseUrl/rent-car/get-all-not-assigned-rent-cars?latitude=28.6333&longitude=77.2167&radius=10000";
  static String rentCarDetails(String id) => "$baseUrl/rent-car/get-all-not-assigned-rent-cars/$id";
  static String nearbyVehicle({vehicleType, lat, long}) => "$baseUrl/driver/nearby?VehicleType=$vehicleType&longitude=$long&latitude=$lat";
  static const estimatePrice = "$baseUrl/driver/ride-price-estimate";
  static const rideRequest = "$baseUrl/ride/request";
  static const rideStatusCheck = "$baseUrl/ride/passenger-ride-status";
}



