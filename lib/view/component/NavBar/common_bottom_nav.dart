

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/NavbarController/NavBarController.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavController navController = Get.put(NavController());
     return Obx(() => Scaffold(
       backgroundColor: Colors.white,
       body: navController.pages[navController.selectedIndex.value],
       bottomNavigationBar: Padding(
         padding: const EdgeInsets.symmetric(vertical: 15),
         child: SizedBox(
           child: BottomNavigationBar(
             backgroundColor: Colors.white,
             elevation: 10,
             currentIndex: navController.selectedIndex.value,
             onTap: navController.changeTab,
             selectedItemColor: Colors.black,
             unselectedItemColor: Colors.black45,
             selectedFontSize: 15,
             unselectedFontSize: 14,
             type: BottomNavigationBarType.fixed,
             items: const [
               BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
               BottomNavigationBarItem(icon: Icon(Icons.percent), label: "Offers"),
               BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
               BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
             ],
           ),
         ),
       ),


     ));;
  }
}
