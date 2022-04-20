import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monitoring_karyawan/helper/layout_helper.dart';

class MonitoringTextField extends StatelessWidget {
  const MonitoringTextField(
      {Key? key,
      required this.labelText,
      required this.icon,
      required this.isObsecure, this.controller})
      : super(key: key);
  final String labelText;
  final IconData icon;
  final bool isObsecure;
  final controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText,
          border: UnderlineInputBorder(borderSide: BorderSide(width: 0.1)),
          focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(width: 0.5, color: LayoutHelper.primaryColor)),
          labelStyle: TextStyle(fontSize: 12.sp),
          suffixIcon: Icon(
            icon,
            color: Colors.grey[350],
          )),
      obscureText: isObsecure,
    );
  }
}
