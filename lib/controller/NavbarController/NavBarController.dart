

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ride_share_flat/view/screen/passenger/HistoryScreen/history_screen.dart';
import 'package:ride_share_flat/view/screen/passenger/HomeScreen/home_screen.dart';
import 'package:ride_share_flat/view/screen/passenger/OfferScreen/offer_screen.dart';
import 'package:ride_share_flat/view/screen/passenger/ProfileScreen/profile_screen.dart';

class NavController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> pages = [
    HomeScreen(),
    OffeScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];
}