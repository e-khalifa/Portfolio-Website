import 'dart:ui';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/pages/intro_page.dart';

import 'utils/color_utility.dart';

void main() => runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(510, 750),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Esraa Khalifa - Portfolio',
            theme: ThemeData(
              fontFamily: "PlusJakartaSans",
              primaryColor: ColorUtility.main,
              appBarTheme: const AppBarTheme(
                  backgroundColor: ColorUtility.background,
                  foregroundColor: ColorUtility.main),
              colorScheme: ColorScheme.fromSwatch(
                  backgroundColor: ColorUtility.background),
            ),
            home: const IntroPage(),
          );
        });
  }
}

class AppScrollBehaviour extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
