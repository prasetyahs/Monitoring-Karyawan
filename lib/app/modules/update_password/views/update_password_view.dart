import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:monitoring_karyawan/helper/layout_helper.dart';
import 'package:monitoring_karyawan/widget/main_layout.dart';
import 'package:monitoring_karyawan/widget/monitoring_button.dart';
import 'package:monitoring_karyawan/widget/monitoring_textfield.dart';

import '../controllers/update_password_controller.dart';

class UpdatePasswordView extends GetView<UpdatePasswordController> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: "Ubah Password",
        appbarColor: LayoutHelper.primaryColor,
        scaffoldBackground: Colors.white,
        foregroundColor: Colors.white,
        autoLeading: true,
        body: Container(
            padding: EdgeInsets.symmetric(
                horizontal: LayoutHelper.spaceHorizontal,
                vertical: LayoutHelper.spaceVertical),
            child: Column(
              children: [
                MonitoringTextField(
                    labelText: "Password Lama",
                    icon: Icons.password,
                    controller: controller.textEditingController[0],
                    isObsecure: true),
                SizedBox(
                  height: LayoutHelper.spaceSizeBox,
                ),
                MonitoringTextField(
                    labelText: "Password Baru",
                    icon: Icons.lock,
                    controller: controller.textEditingController[1],
                    isObsecure: true),
                SizedBox(
                  height: LayoutHelper.spaceSizeBox,
                ),
                MonitoringTextField(
                    labelText: "Konfirmasi Password",
                    icon: Icons.lock_open_outlined,
                    controller: controller.textEditingController[2],
                    isObsecure: true),
                SizedBox(
                  height: LayoutHelper.spaceVertical,
                ),
                MonitoringButton(
                  callback: () => controller.updatePassword(),
                  title: "Simpan",
                  color: Colors.orange[600],
                  border: Border.all(color: Colors.transparent),
                ),
              ],
            )));
  }
}
