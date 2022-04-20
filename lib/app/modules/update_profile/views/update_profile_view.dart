import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:monitoring_karyawan/helper/layout_helper.dart';
import 'package:monitoring_karyawan/widget/main_layout.dart';
import 'package:monitoring_karyawan/widget/monitoring_button.dart';
import 'package:monitoring_karyawan/widget/monitoring_textfield.dart';
import '../controllers/update_profile_controller.dart';

class UpdateProfileView extends GetView<UpdateProfileController> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Ubah Profile",
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
                labelText: "Nama depan",
                icon: Icons.person_pin_rounded,
                isObsecure: false),
            SizedBox(
              height: LayoutHelper.spaceSizeBox,
            ),
            MonitoringTextField(
                labelText: "Nama Belakang",
                icon: Icons.person_pin,
                isObsecure: false),
            SizedBox(
              height: LayoutHelper.spaceSizeBox,
            ),
            MonitoringTextField(
                labelText: "Nomor Telepon",
                icon: Icons.phone,
                isObsecure: false),
            SizedBox(
              height: LayoutHelper.spaceSizeBox,
            ),
            MonitoringTextField(
                labelText: "Alamat",
                icon: Icons.location_on,
                isObsecure: false),
            SizedBox(
              height: LayoutHelper.spaceVertical,
            ),
            MonitoringButton(
              callback: () {},
              title: "Simpan",
              color: Colors.orange[600],
              border: Border.all(color: Colors.transparent),
            ),
          ],
        ),
      ),
    );
  }
}
