import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/color_utility.dart';

class AboutMeItem extends StatelessWidget {
  final Widget? child;
  const AboutMeItem({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0.w),
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: ColorUtility.darkGrey),
        color: ColorUtility.grey,
      ),
      child: child,
    );
  }
}
