import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabButton extends StatelessWidget {
  const TabButton(
      {Key? key,
      required this.color,
      required this.title,
      required this.textColor,
      this.callBack})
      : super(key: key);
  final Color color, textColor;
  final String title;
  final callBack;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: callBack,
        child:Container(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(20.w)),
            child: Text(
              title,
              style: TextStyle(
                  color: textColor, fontSize: 12.sp, letterSpacing: 1.w),
            ),
          ),
        );
  }
}
