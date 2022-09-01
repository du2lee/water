import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water/components/customHomeAppbar.dart';
import 'package:water/controllers/app_controller.dart';


class DirtyWater extends GetView<AppController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(child: customHomeAppBar('Dangerous', 'Water')),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.folder_special_rounded,
                    size: 35.0, color: Colors.blueAccent),
                onPressed: () {
                  // Get.toNamed('/favorites');
                  controller.scrapyManufacturer();
                })
          ]),
      extendBodyBehindAppBar: true,
    );
  }
}