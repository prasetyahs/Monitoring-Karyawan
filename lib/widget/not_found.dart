import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monitoring_karyawan/helper/layout_helper.dart';

class NotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260.h,
      alignment: Alignment.center, // <---- The magic
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/anim/not_found.svg",
            height: 160.h,
            // width: 150.h,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Data Tidak Tersedia",
            style: TextStyle(fontSize: LayoutHelper.fontLarge, fontStyle: FontStyle.normal),
          )
        ],
      ),
    );
  }
}
