import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_image.dart';
import '../../../utils/app_string.dart';
import '../CommonText.dart';
import '../image/common_image.dart';


class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonImage(
            imageSrc: AppImages.noData,
            imageType: ImageType.png,
            height: 70.sp,
            width: 70.sp,
          ),
          CommonText(
            text: AppString.noData,
            fontSize: 16,
            top: 8,
          )
        ],
      ),
    );
  }
}
