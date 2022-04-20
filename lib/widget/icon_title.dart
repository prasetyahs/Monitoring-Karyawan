import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconTitle extends StatelessWidget {
  const IconTitle(
      {Key? key,
      required this.title,
      required this.icon,
      required this.fontSize})
      : super(key: key);
  final String title;
  final IconData icon;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15.h,
          color: Colors.grey[600],
        ),
        SizedBox(
          width: 5.w,
        ),
        Expanded(
          child: Text(
            title,
            style: TextStyle(color: Colors.grey[600], fontSize: fontSize),
          ),
        )
      ],
    );
  }
}
