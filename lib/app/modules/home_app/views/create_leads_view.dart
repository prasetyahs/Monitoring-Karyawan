import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/home_app/controllers/home_app_controller.dart';
import 'package:monitoring_karyawan/helper/layout_helper.dart';
import 'package:monitoring_karyawan/widget/monitoring_button.dart';
import 'package:monitoring_karyawan/widget/monitoring_textfield.dart';

class CreateLeadsView extends GetView<HomeAppController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Create Leads'.toUpperCase(),
            style: TextStyle(fontSize: 14.sp, letterSpacing: 0.5.w),
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: LayoutHelper.spaceHorizontal,
                vertical: LayoutHelper.spaceVertical),
            child: Obx(
              () => Column(
                children: [
                  MonitoringTextField(
                      labelText: "NIK",
                      icon: CupertinoIcons.number,
                      textInputType: TextInputType.number,
                      controller: this.controller.controllersLeads[0],
                      isObsecure: false),
                  SizedBox(
                    height: LayoutHelper.spaceVertical,
                  ),
                  MonitoringTextField(
                      labelText: "Nama Customer",
                      icon: CupertinoIcons.textformat_abc,
                      controller: this.controller.controllersLeads[1],
                      isObsecure: false),
                  SizedBox(
                    height: LayoutHelper.spaceVertical,
                  ),
                  MonitoringTextField(
                      controller: this.controller.controllersLeads[2],
                      textFieldTap: () => showDatePicker(
                              context: context,
                              initialDate: DateTime(1999),
                              lastDate: DateTime.now(),
                              firstDate: DateTime(1700))
                          .then((value) => this
                              .controller
                              .controllersLeads[2]
                              .text = value.toString().split(" ")[0]),
                      readOnly: true,
                      labelText: "Tanggal Lahir",
                      icon: Icons.date_range_rounded,
                      isObsecure: false),
                  SizedBox(
                    height: LayoutHelper.spaceVertical,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Jenis Kelamin"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Radio<String>(
                        value: "Laki-Laki",
                        groupValue: this.controller.gender.value,
                        onChanged: (v) => this.controller.setGender(v),
                      ),
                      Text("Laki-Laki"),
                      Radio<String>(
                        value: "Perempuan",
                        groupValue: this.controller.gender.value,
                        onChanged: (v) => this.controller.setGender(v),
                      ),
                      Text("Perempuan"),
                    ],
                  ),
                  MonitoringTextField(
                      readOnly: true,
                      labelText: "No Rekening",
                      icon: Icons.numbers,
                      controller: this.controller.controllersLeads[3],
                      textInputType: TextInputType.number,
                      isObsecure: false),
                  SizedBox(
                    height: LayoutHelper.spaceVertical,
                  ),
                  MonitoringTextField(
                      labelText: "Email",
                      controller: this.controller.controllersLeads[4],
                      icon: CupertinoIcons.textformat_abc,
                      isObsecure: false),
                  SizedBox(
                    height: LayoutHelper.spaceVertical,
                  ),
                  MonitoringTextField(
                      labelText: "Telepon",
                      controller: this.controller.controllersLeads[5],
                      textInputType: TextInputType.phone,
                      icon: CupertinoIcons.textformat_abc,
                      isObsecure: false),
                  SizedBox(
                    height: LayoutHelper.spaceVertical,
                  ),
                  MonitoringButton(
                    callback: () => this.controller.storeLeads(),
                    title: "Simpan",
                    color: Colors.amber,
                    border: Border.all(color: Colors.transparent),
                  ),
                ],
              ),
            )));
  }
}
