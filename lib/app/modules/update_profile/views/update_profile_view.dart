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
                labelText: "Nama Lengkap",
                icon: Icons.person_pin_rounded,
                controller: controller.inputController[0],
                isObsecure: false),
            SizedBox(
              height: LayoutHelper.spaceSizeBox,
            ),
            MonitoringTextField(
                textFieldTap: () => showDatePicker(
                        context: context,
                        initialDate: DateTime(1999),
                        lastDate: DateTime.now(),
                        firstDate: DateTime(1700))
                    .then((value) => print(value.toString().split(" ")[0])),
                controller: controller.inputController[1],
                readOnly: true,
                labelText: "Tanggal Lahir",
                icon: Icons.date_range_rounded,
                isObsecure: false),
            MonitoringTextField(
                controller: controller.inputController[2],
                labelText: "Email",
                icon: Icons.mail,
                isObsecure: false),
            SizedBox(
              height: LayoutHelper.spaceSizeBox,
            ),
            SizedBox(
              height: LayoutHelper.spaceSizeBox,
            ),
            MonitoringTextField(
                controller: controller.inputController[3],
                labelText: "Nomor Telepon",
                icon: Icons.phone,
                isObsecure: false),
            SizedBox(
              height: LayoutHelper.spaceSizeBox,
            ),
            SizedBox(
              height: LayoutHelper.spaceSizeBox,
            ),
            MonitoringTextField(
                controller: controller.inputController[4],
                labelText: "Alamat",
                icon: Icons.location_on,
                isObsecure: false),
            SizedBox(
              height: LayoutHelper.spaceVertical,
            ),
            SizedBox(
              height: LayoutHelper.spaceSizeBox,
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
