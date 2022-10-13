import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/home_app/controllers/home_app_controller.dart';
import 'package:monitoring_karyawan/app/routes/app_pages.dart';
import 'package:monitoring_karyawan/helper/layout_helper.dart';
import 'package:monitoring_karyawan/helper/shared_prefs.dart';
import 'package:monitoring_karyawan/widget/text_border.dart';

class UserView extends GetView<HomeAppController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: LayoutHelper.primaryColor,
          padding: EdgeInsets.symmetric(
              horizontal: LayoutHelper.spaceHorizontal,
              vertical: LayoutHelper.spaceVertical),
          child: Row(
            children: [
              Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/component/example.jpeg"),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle,
                    color: Colors.amber),
              ),
              SizedBox(width: LayoutHelper.spaceHorizontal),
              Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.dataLogin.value.namaKaryawan.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: LayoutHelper.fontLarge,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        controller.dataLogin.value.jabatan.toString(),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: LayoutHelper.fontSmall,
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
        TextBorder(
          callback: () => Get.toNamed(Routes.UPDATE_PROFILE),
          title: "Ubah Informasi Akun",
          icon: CupertinoIcons.profile_circled,
        ),
        TextBorder(
          callback: () => Get.toNamed(Routes.UPDATE_PASSWORD),
          title: "Ubah Password",
          icon: CupertinoIcons.lock_circle_fill,
        ),
        TextBorder(
          callback: () {
            SharedPrefs.removePrefs();
            Get.offAndToNamed(Routes.LOGIN);
          },
          title: "Keluar",
          icon: Icons.door_back_door_outlined,
        )
      ],
    );
  }
}
