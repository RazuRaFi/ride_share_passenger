

import 'package:flutter/material.dart';

import '../../../../utils/app_icons.dart';
import '../../../component/CommonText.dart';
import '../../../component/image/common_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // _scaffoldKey.currentState?.openDrawer();
                    },
                    child: CommonImage(
                      imageSrc: AppIcons.drawermenu,
                      imageType: ImageType.png,
                      size: 24,
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none_outlined))
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
