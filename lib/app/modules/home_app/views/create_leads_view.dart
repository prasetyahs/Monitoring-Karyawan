import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:monitoring_karyawan/helper/layout_helper.dart';
import 'package:monitoring_karyawan/widget/monitoring_button.dart';
import 'package:monitoring_karyawan/widget/monitoring_textfield.dart';

class CreateLeadsView extends GetView {
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
          child: Column(
            children: [
              MonitoringTextField(
                  labelText: "NIK",
                  icon: CupertinoIcons.number,
                  isObsecure: false),
              SizedBox(
                height: LayoutHelper.spaceVertical,
              ),
              MonitoringTextField(
                  labelText: "Nama Customer",
                  icon: CupertinoIcons.textformat_abc,
                  isObsecure: false),
              SizedBox(
                height: LayoutHelper.spaceVertical,
              ),
              MonitoringTextField(
                  textFieldTap: () => showDatePicker(
                          context: context,
                          initialDate: DateTime(1999),
                          lastDate: DateTime.now(),
                          firstDate: DateTime(1700))
                      .then((value) => print(value.toString().split(" ")[0])),
                  readOnly: true,
                  labelText: "Tanggal Lahir",
                  icon: Icons.date_range_rounded,
                  isObsecure: false),
              SizedBox(
                height: LayoutHelper.spaceVertical,
              ),
              MonitoringTextField(
                  readOnly: true,
                  labelText: "No Rekening",
                  icon: Icons.numbers,
                  textInputType: TextInputType.number,
                  isObsecure: false),
              SizedBox(
                height: LayoutHelper.spaceVertical,
              ),
              MonitoringTextField(
                  labelText: "Nama Customer",
                  icon: CupertinoIcons.textformat_abc,
                  isObsecure: false),
              SizedBox(
                height: LayoutHelper.spaceVertical,
              ),
              MonitoringButton(
                callback: () => {},
                title: "Simpan",
                color: Colors.amber,
                border: Border.all(color: Colors.transparent),
              ),
            ],
          ),
        ));
  }
}
