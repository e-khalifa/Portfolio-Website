import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/utils/color_utility.dart';
import 'package:portfolio/utils/image_utility.dart';
import 'package:portfolio/widgets/animated_text.dart';
import 'package:portfolio/widgets/buttons/elintro_elevated_button.dart';
import 'package:portfolio/widgets/items/project_demo_item.dart';

import '../utils/text_style_utility.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController pageController = PageController();
  bool isVertical = true;
  int currentPage = 0;
  Map<String, bool> delayedWidgetVisibility = {
    'page0_text': false,
    'page1_text1': false,
    'page1_text2': false,
    'page1_text3': false,
    'page2_projects_container': false,
    'page2_projects_button': false,
  };

  @override
  void initState() {
    super.initState();
    startAutoSliding();
  }

  void startAutoSliding() {
    Future.microtask(() async {
      while (mounted && currentPage < 2) {
        switch (currentPage) {
          case 0:
            delayedWidget('page0_text', 300);
            await Future.delayed(const Duration(milliseconds: 2000));
            pageController.animateToPage(1,
                duration: const Duration(milliseconds: 700),
                curve: Curves.fastOutSlowIn);
            delayedWidget('page1_text1', 900);
            break;
          case 1:
            delayedWidget('page1_text2', 600);
            delayedWidget('page1_text3', 1400);
            setState(() {
              isVertical = false;
            });
            await Future.delayed(const Duration(milliseconds: 2750));
            pageController.animateToPage(
              2,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
            delayedWidget('page2_projects_container', 800);
            delayedWidget('page2_projects_button', 1700);
        }
      }
    });
  }

  void delayedWidget(String textId, int delayMs) {
    Future.delayed(Duration(milliseconds: delayMs), () {
      if (mounted) {
        setState(() {
          delayedWidgetVisibility[textId] = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtility.background,
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: PageView(
          controller: pageController,
          scrollDirection: isVertical ? Axis.vertical : Axis.horizontal,
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
          children: [
            buildPage0(),
            buildPage1(),
            buildPage2(),
          ],
        ),
      ),
    );
  }

  Widget buildPage0() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedText(
          text: 'Hello..',
          style: TextStyleUtility.animatedText(
            fontSize: 40.sp,
            color: ColorUtility.lightGrey,
            fontWeight: FontWeight.w500,
          ),
        ),
        delayedWidgetVisibility['page0_text'] == true
            ? AnimatedText(
                text: '         World?',
                style: TextStyleUtility.animatedText(
                  fontSize: 40.sp,
                  color: ColorUtility.lightblue,
                  fontWeight: FontWeight.w500,
                ),
                letterSpeed: const Duration(milliseconds: 60),
              )
            : SizedBox(
                height: 47.h,
              )
      ],
    );
  }

  Widget buildPage1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedText(
          text: "I'm Esraa!",
          style: TextStyleUtility.animatedText(
            fontSize: 25.sp,
            color: ColorUtility.lightYellow,
            fontWeight: FontWeight.w400,
          ),
          letterSpeed: const Duration(milliseconds: 80),
        ),
        delayedWidgetVisibility['page1_text1'] == true
            ? AnimatedText(
                text:
                    "I Like to create things with\n[Words,\nNumbers,\nSymbols,",
                style: TextStyleUtility.animatedText(
                  fontSize: 25.sp,
                  color: ColorUtility.orange,
                  fontWeight: FontWeight.w400,
                ),
                letterSpeed: const Duration(milliseconds: 30),
              )
            : const SizedBox(),
        delayedWidgetVisibility['page1_text2'] == true
            ? AnimatedText(
                text: "//and sometimes..",
                style: TextStyleUtility.animatedText(
                  fontSize: 25.sp,
                  color: ColorUtility.lightGreen,
                  fontWeight: FontWeight.w300,
                ),
                letterSpeed: const Duration(milliseconds: 30),
              )
            : const SizedBox(),
        delayedWidgetVisibility['page1_text3'] == true
            ? AnimatedText(
                text: "Spells!]",
                style: TextStyleUtility.animatedText(
                  fontSize: 30.sp,
                  color: ColorUtility.orange,
                  fontWeight: FontWeight.w500,
                ),
                letterSpeed: const Duration(milliseconds: 85),
              )
            : const SizedBox(),
      ],
    );
  }

  Widget buildPage2() {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 900),
          curve: Curves.easeInOut,
          top: delayedWidgetVisibility['page2_projects_container'] == true
              ? ScreenUtil().setHeight(50)
              : ScreenUtil().setHeight(280),
          left: 0,
          right: 0,
          child: Text(
            "Check out some of the projects I’ve been working on this year!",
            style: TextStyleUtility.animatedText(
              fontSize: 24.sp,
              color: ColorUtility.lightblue,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 900),
          curve: Curves.easeInOut,
          top: delayedWidgetVisibility['page2_projects_container'] == true
              ? ScreenUtil().setHeight(150)
              : ScreenUtil().setHeight(900),
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
                color: ColorUtility.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: ColorUtility.grey,
                )),
            height: ScreenUtil().setHeight(500),
            width: double.infinity,
            child: GridView.count(
              crossAxisSpacing: 8.w,
              crossAxisCount: 2,
              childAspectRatio: 0.5,
              children: const [
                ProjectDemoItem(
                  gifPath: ImageUtility.easyPos,
                  projectName: 'Easy Pos',
                  projectBrief: 'A user-friendly point-of-sale app',
                ),
                ProjectDemoItem(
                  gifPath: ImageUtility.eduVista,
                  projectName: 'Edu-Vista',
                  projectBrief:
                      'An educational app designed to enhance learning',
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 20.h,
          left: 0,
          right: 0,
          child: AnimatedOpacity(
            opacity: delayedWidgetVisibility['page2_projects_button'] == true
                ? 1.0
                : 0.0,
            duration: const Duration(milliseconds: 500),
            child: const Align(
              alignment: Alignment.center,
              child: IntroElevatedButton(),
            ),
          ),
        ),
      ],
    );
  }
}
