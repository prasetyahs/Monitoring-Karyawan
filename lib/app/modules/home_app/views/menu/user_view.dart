import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/routes/app_pages.dart';
import 'package:monitoring_karyawan/helper/layout_helper.dart';
import 'package:monitoring_karyawan/widget/text_border.dart';

class UserView extends GetView {
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
              Text(
                "Prasetya Hadi Saputra",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: LayoutHelper.fontLarge,
                ),
              )
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
          callback: () {},
          title: "Keluar",
          icon: Icons.door_back_door_outlined,
        )
      ],
    );
  }
}
