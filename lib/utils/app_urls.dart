class AppUrls {
  static const baseUrl = "http://10.10.10.31:7010/api/v1";
  static const imageUrl = "http://10.10.10.31:7010";
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
  static const pendingRiderDetails = "$baseUrl/passenger/get-pending-rides/688304d1cd8c0a6ddf20a68e";
  static const completeRide = "$baseUrl/passenger/get-complete-rides";
  static const completeRideDetails = "$baseUrl/passenger/get-complete-rides/6883026e7af508d422208587";
  static const history = "$baseUrl/passenger/history";
  static const historyDetails = "$baseUrl/passenger/history/6883026e7af508d422208587";
  static const message = "$baseUrl/ride/ride-status/688eda909863807a05ffa11f";
  static const rentCar = "$baseUrl/rent-car/get-all-not-assigned-rent-cars?latitude=28.6333&longitude=77.2167&radius=10000";
  static const rentCarDetails = "$baseUrl/rent-car/get-all-not-assigned-rent-cars/688ee40e819d16daac39fba1";
}



