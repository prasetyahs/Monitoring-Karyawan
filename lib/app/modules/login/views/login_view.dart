import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:monitoring_karyawan/helper/layout_helper.dart';
import 'package:monitoring_karyawan/widget/main_layout.dart';
import 'package:monitoring_karyawan/widget/monitoring_button.dart';
import 'package:monitoring_karyawan/widget/monitoring_textfield.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
        autoLeading: true,
        foregroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200.h,
              decoration: BoxDecoration(
                color: LayoutHelper.primaryColor,
              ),
              child: SvgPicture.asset(
                "assets/anim/login-bg.svg",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: LayoutHelper.spaceHorizontal,
              ),
              child: Column(
                children: [
                  MonitoringTextField(
                    labelText: "NIP",
                    isObsecure: false,
                    icon: Icons.person,
                    controller: controller.nipTextController,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Obx(() => MonitoringTextField(
                        labelText: "Password",
                        isObsecure: controller.isShowPassword.value,
                        iconTap: () {
                          controller.showPassword =
                              controller.isShowPassword.isTrue ? false : true;
                        },
                        icon: controller.isShowPassword.isFalse
                            ? Icons.remove_red_eye_rounded
                            : Icons.visibility_off,
                        controller: controller.passwordTextController,
                      )),
                  SizedBox(
                    height: 30.h,
                  ),
                  MonitoringButton(
                    callback: () => controller.login(),
                    title: "Masuk",
                    color: Colors.orange[600],
                    border: Border.all(color: Colors.transparent),
                  ),
                ],
              ),
            ),
          ],
        ),
        title: "LOGIN",
        centerTitle: false,
        appbarColor: LayoutHelper.primaryColor,
        scaffoldBackground: Colors.white);
  }
}
