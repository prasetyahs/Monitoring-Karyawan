import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MonitoringButton extends StatelessWidget {
  const MonitoringButton(
      {Key? key, this.callback, this.title, required this.border, this.color})
      : super(key: key);
  final callback, title,  color;
  final BoxBorder border;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 38.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color,
            border: border,
            borderRadius: BorderRadius.circular(50.w)),
        child: Text(
          title.toString().toUpperCase(),
          style: TextStyle(color: Colors.white,letterSpacing: 1.w),
        ),
      ),
    );
  }
}
