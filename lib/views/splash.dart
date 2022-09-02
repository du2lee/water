import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:water/views/information.dart';

class MyHomePage extends GetView {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 100.sh,
      splash:
          Image.asset('assets/images/logo.png', width: 100.w, height: 100.h),
      nextScreen: DirtyWater(),
    );
  }
}