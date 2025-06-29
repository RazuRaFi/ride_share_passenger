


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share_flat/helpers/my_extension.dart';
import 'package:ride_share_flat/view/screen/common_screen/FAQ/faq_screen.dart';
import 'package:ride_share_flat/view/screen/common_screen/SafetyScreen/safety_screen.dart';
import 'package:ride_share_flat/view/screen/common_screen/Terms&Services/terms_services.dart';
import 'package:ride_share_flat/view/screen/common_screen/together_screen/together_screen.dart';
import 'package:ride_share_flat/view/screen/passenger/HomeScreen/HomeChild/SetLocation/set_location.dart';
import 'package:ride_share_flat/view/screen/passenger/ProfileScreen/OrderTracking/order_tracking.dart';
import 'package:ride_share_flat/view/screen/passenger/ProfileScreen/SettingsPage/settings_page.dart';

import '../../../../../../utils/app_colors.dart';
import '../../../../../../utils/app_icons.dart';
import '../../../../../helpers/app_routes.dart';
import '../../../../../utils/app_image.dart';
import '../../../../component/CommonText.dart';
import '../../../../component/image/common_image.dart';
import '../../HistoryScreen/history_screen.dart';
import '../HomeChild/TakeRide/take_ride.dart';
import 'drawer_items.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer Header (Empty space as per design)
          60.height,
          Row(
            spacing: 15,
            children: [
            8.width,
            // CircleAvatar(
            //   radius: 30,
            //   backgroundColor: AppColors.background2,
            //   child: Center(
            //     child: CommonImage(
            //       imageSrc: "https://shorturl.at/LIblR",
            //       imageType: ImageType.network,
            //       defaultImage: AppImages.profile,
            //       borderRadius: 100,
            //       height: 50,
            //       width: 50,
            //     ),
            //   ),
            // ),
            Container(
              height: 49,
              width: 49,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey
              ),
              child: ClipOval(
                child: Image.asset("assets/images/editimage.jpg",fit: BoxFit.cover,),
              ),
            ),
            CommonText(text: "Arlene McCoy",fontSize: 16,fontWeight: FontWeight.w500,),
          ],),
          20.height,
        Divider(thickness: 1,color: Colors.brown ,),
          // Drawer Items
          DrawerItem(
            title: "Your Location",
            iconColor: Colors.black,
           icon:"assets/icons/pin.png",
            onTap: () {
              Get.to(()=>SetLocation());
            },
          ),
          DrawerItem(
            title: "Order Tracking",
            icon:"assets/icons/order.png",
            onTap: () {
              Get.to(OrderTracking());
            },
          ),
          DrawerItem(
            title: "Request History",
            icon:"assets/icons/request.png",
            onTap: () {
              // HistoryScreen.isFromDrawer = true;
              Get.to(HistoryScreen());
            },
          ),
          DrawerItem(
            title: "Safety",
            icon:"assets/icons/safety.png",
            onTap: () {
              Get.to(SafetyScreen());
            },
          ),
          DrawerItem(
            title: "Settings",
            icon:"assets/icons/settings.png",
            onTap: () {
              Get.to(SettingsPage());
            },
          ),
          DrawerItem(
            title: "Terms & Policies",
            icon:"assets/icons/terms.png",
            onTap: () {
              Get.to(TermsServices());
            },
          ),
          DrawerItem(
            title: "FAQ",
            icon:"assets/icons/faq2.png",
            onTap: () {
              Get.to(FAQScreen());
            },
          ),
          100.height,
          DrawerItem(
            title: "Log out",
            icon:"assets/icons/logout.png",
            textColor: Color(0xff990000),
            iconColor: Color(0xff990000),
            onTap: () {
              Get.offAll(TogetherScreen());
            },
          ),
        ],
      ),
    );
  }
}