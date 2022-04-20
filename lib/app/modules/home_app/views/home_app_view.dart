import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:monitoring_karyawan/helper/layout_helper.dart';
import 'package:monitoring_karyawan/helper/value_helper.dart';

import '../controllers/home_app_controller.dart';

class HomeAppView extends GetView<HomeAppController> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              backgroundColor: Colors.white,
              elevation: 5.0,
              onTap: (i) => controller.indexMenu = i,
              currentIndex: controller.indexMenu,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: LayoutHelper.primaryColor,
              unselectedItemColor: Colors.grey,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.house,
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.folder_fill_badge_person_crop,
                    ),
                    label: "Leads"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.badge,
                    ),
                    label: "Product"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.report,
                    ),
                    label: "Report"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                    ),
                    label: "User"),
              ],
            )),
        body: Obx(
            () => SafeArea(child: ValueHelper.menuPage[controller.indexMenu])));
  }
}
