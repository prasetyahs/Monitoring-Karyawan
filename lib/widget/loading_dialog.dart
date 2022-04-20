import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(
            width: 20.w,
          ),
          Text(
            "Sedang Memuat....",
            style: TextStyle(color: Colors.black, fontSize: 15.sp),
          )
        ],
      ),
    );
  }
}
