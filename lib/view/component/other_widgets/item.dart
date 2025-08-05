import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_share_flat/helpers/my_extension.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../CommonText.dart';
import '../image/common_image.dart';


class Item extends StatelessWidget {
  const Item(
      {super.key,
      this.icon,
      required this.title,
      this.image = "",
      this.disableDivider = false,
      this.onTap,
      this.color = AppColors.black,
      this.vertical = 4,
      this.horizontal = 24,
      this.disableIcon = false});

  final IconData? icon;
  final String title;
  final String image;
  final bool disableDivider;
  final bool disableIcon;
  final VoidCallback? onTap;
  final Color color;
  final double vertical;
  final double horizontal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: horizontal.w, vertical: vertical.h),
        child: Column(
          children: [
            Row(
              children: [
                icon != null
                    ? Icon(
                        icon,
                        color: color,
                      )
                    : image == AppIcons.featureRequestIcon? CommonImage(imageSrc: image, size: 28, imageColor: AppColors.deepBlue,) : CommonImage(imageSrc: image, imageColor: AppColors.deepBlue,),
                CommonText(
                  text: title,
                  color: color,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  left: 16,
                ),
                const Spacer(),
                disableIcon
                    ? const SizedBox()
                    : Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20.sp,
                      )
              ],
            ),
            8.height,
            disableDivider ? const SizedBox() : const Divider(color: AppColors.borderColor,)
          ],
        ),
      ),
    );
  }
}
