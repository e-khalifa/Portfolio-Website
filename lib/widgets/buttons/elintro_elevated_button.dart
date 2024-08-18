import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../pages/home_page.dart';
import '../../utils/color_utility.dart';

class IntroElevatedButton extends StatelessWidget {
  const IntroElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      },
      style: ElevatedButton.styleFrom(
          fixedSize: Size(double.maxFinite, 40.h),
          backgroundColor: Colors.transparent,
          side: BorderSide(color: ColorUtility.lightGrey, width: 1.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          padding: EdgeInsets.only(left: 30.w, right: 15.w)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Explore More Projects',
            style: TextStyle(
              fontSize: 18.sp,
              color: ColorUtility.lightGrey,
            ),
          ),
          const Icon(
            Icons.arrow_right_alt,
            color: ColorUtility.lightGrey,
          ),
        ],
      ),
    );
  }
}
