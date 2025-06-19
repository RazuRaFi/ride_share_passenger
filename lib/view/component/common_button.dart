

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common_text.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key, required this.ttile, this.height, this.width, this.color, this.textcolor,
  });
  final String ttile;
  final double ? height;
  final double ? width;
  final Color ? color;
  final Color ? textcolor;



  @override
  Widget build(BuildContext context) {
    return Container(
      height:height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color:Colors.black),
        color: color,
      ),
      child: Center(child: CommontText(text: ttile, fSize:16, fweight:FontWeight.w500,color:textcolor,),),

    );
  }
}