import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_utility.dart';

class TextStyleUtility {
  static TextStyle animatedText({
    required double fontSize,
    required Color color,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      decoration: TextDecoration.none,
      fontFamily: 'FiraCode',
      fontWeight: fontWeight,
    );
  }

  static TextStyle title = TextStyle(
    fontSize: 24.sp,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle subtitle = TextStyle(
    fontSize: 20.sp,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle heading1 = TextStyle(
    fontSize: 18.sp,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle heading2 = TextStyle(
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  static TextStyle body = TextStyle(
    fontSize: 14.sp,
    color: ColorUtility.lightGrey,
    fontWeight: FontWeight.normal,
  );
}
