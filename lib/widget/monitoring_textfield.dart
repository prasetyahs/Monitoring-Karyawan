import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monitoring_karyawan/helper/layout_helper.dart';

class MonitoringTextField extends StatelessWidget {
  const MonitoringTextField(
      {Key? key,
      required this.labelText,
      required this.icon,
      required this.isObsecure,
      this.controller,
      this.iconTap,
      this.textFieldTap,
      this.readOnly,
      this.textInputType})
      : super(key: key);
  final String labelText;
  final IconData icon;
  final bool isObsecure;
  final controller;
  final iconTap, textFieldTap, readOnly;
  final textInputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTap: textFieldTap,
      keyboardType: textInputType ?? TextInputType.text,
      decoration: InputDecoration(
          labelText: labelText,
          border: UnderlineInputBorder(borderSide: BorderSide(width: 0.1)),
          focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(width: 0.5, color: LayoutHelper.primaryColor)),
          labelStyle: TextStyle(fontSize: 12.sp),
          suffixIcon: InkWell(
            onTap: iconTap,
            child: Icon(
              icon,
              color: Colors.grey[350],
            ),
          )),
      obscureText: isObsecure,
    );
  }
}
