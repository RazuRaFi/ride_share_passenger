
import 'package:get/get.dart';
import 'package:ride_share_flat/utils/app_string.dart';

class HomeController extends GetxController{

  int selectedIndex = 0;

  void select(int index) {
    selectedIndex = index;
  }



  List serviceList=[
    {'image':"assets/images/service1.png", "title":AppString.motoBike},
    {'image':"assets/images/service2.png", "title":AppString.car},
    {'image':"assets/images/service3.png", "title":AppString.rentCar},
    {'image':"assets/images/service4.png", "title":AppString.schedule},
  ];
  List scopeList=[
    {'image':"assets/icons/scope1.png", "title":AppString.passengerSafety,"details":AppString.onTripIssues},
    {'image':"assets/icons/scope1.png", "title":AppString.firstClassRide,"details":AppString.topRated},
  ];
}