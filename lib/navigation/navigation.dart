import 'package:get/get.dart';
import 'package:water/views/main.dart';
import 'package:water/views/splash.dart';

List<GetPage> getPages = [
  GetPage(name: '/', page: () => MyHomePage()),
  GetPage(name: '/main', page: () => DirtyWater()),
];
