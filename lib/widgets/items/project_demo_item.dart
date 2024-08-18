import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectDemoItem extends StatefulWidget {
  final String gifPath;
  final String projectName;
  final String projectBrief;

  const ProjectDemoItem({
    Key? key,
    required this.gifPath,
    required this.projectName,
    required this.projectBrief,
  }) : super(key: key);

  @override
  _ProjectDemoItemState createState() => _ProjectDemoItemState();
}

class _ProjectDemoItemState extends State<ProjectDemoItem> {
  bool isTapped = false;

  //Hovering using mouseRegion (enter,exit) to show overlaying project info was glitching
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isTapped = !isTapped;
            });
          },
          child: PhysicalModel(
            color: Colors.transparent,
            elevation: 8.0,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20.r),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.asset(
                widget.gifPath,
                height: 402.h,
                width: 854.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        if (isTapped) buildProjectInfo(),
      ],
    );
  }

  Widget buildProjectInfo() {
    return Container(
      height: 402.h,
      width: 854.w,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.projectName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            Text(
              widget.projectBrief,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  decoration: TextDecoration.none),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
