import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:water/bindings/init_binding.dart';
import 'package:water/navigation/navigation.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => GetMaterialApp(
        title: 'water',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialBinding: InitBinding(),
        initialRoute: '/',
        getPages: getPages,
      ),
    );
  }
}