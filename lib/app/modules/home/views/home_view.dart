import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:monitoring_karyawan/helper/layout_helper.dart';
import 'package:monitoring_karyawan/widget/main_layout.dart';
import 'package:monitoring_karyawan/widget/monitoring_button.dart';
import '../controllers/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      autoLeading: true,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/anim/anim_landing.svg",
                  width: 250.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(
                    "Monitoring Karyawan",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        letterSpacing: 1.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                    child: Text(
                  "Montoring Karyawan secara realtime dan manajemen Karyawan via aplikasi ini !",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[300]),
                ))
              ],
            ),
            MonitoringButton(
              callback: ()=>Get.toNamed("/login"),
              title: "Login",
              color: Colors.transparent,
              border: Border.all(color: Colors.white,width: 1.0 ),
            ),
          ],
        ),
      ),
      appbarColor: LayoutHelper.primaryColor,
      title: 'Monitoring',
      centerTitle: true,
      scaffoldBackground: LayoutHelper.primaryColor, foregroundColor: Colors.white,
    );
  }
}
