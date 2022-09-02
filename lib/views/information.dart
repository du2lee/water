import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          // actions: <Widget>[
          //   IconButton(
          //       icon: const Icon(Icons.folder_special_rounded,
          //           size: 35.0, color: Colors.blueAccent),
          //       onPressed: () {
          //         controller.scrapyBrand();
          //       })]
          ),  
      extendBodyBehindAppBar: true,
      body: Obx((() {
        if (controller.getManufacturers.isEmpty)
          return Center(child: 
            Image.asset('assets/images/safeWater.png', width: 200.w, height: 200.h),);
        else
          return ListView.separated(
            itemCount: controller.getResult.length,
            itemBuilder: (context, index) {
              return _ItemWidget(index, controller.getResult);
            },
            separatorBuilder: ((context, index) {
              return const Divider();
            }),
          );
      })),
    );
  }

  Widget _ItemWidget(int index, List<List> result){
    return ListTile(
      leading: const Icon(Icons.location_city),
      title: Text(result[index][1]),
      subtitle: Text(result[index][0])
    );
  }
}