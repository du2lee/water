import 'package:get/get.dart';
import 'package:water/views/information.dart';
import 'package:water/views/splash.dart';

List<GetPage> getPages = [
  GetPage(name: '/', page: () => MyHomePage()),
  GetPage(name: '/information', page: () => DirtyWater()),
];
