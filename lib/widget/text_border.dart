import 'package:flutter/material.dart';
import 'package:monitoring_karyawan/helper/layout_helper.dart';
import 'package:monitoring_karyawan/widget/icon_title.dart';

class TextBorder extends StatelessWidget {
  const TextBorder({Key? key, required this.title, required this.icon, this.callback})
      : super(key: key);
  final String title;
  final callback;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: LayoutHelper.spaceVertical,
              vertical: LayoutHelper.spaceVertical),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey.withOpacity(0.5)))),
          child: IconTitle(
              title: title, icon: icon, fontSize: LayoutHelper.fontMedium)),
    );
  }
}
