import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:monitoring_karyawan/helper/layout_helper.dart';
import 'package:monitoring_karyawan/widget/monitoring_button.dart';
import 'package:monitoring_karyawan/widget/monitoring_drop.dart';

class CustomerDetailTabView extends GetView {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return CardRow();
      },
      itemCount: 5,
    );
  }
}

class CardRow extends StatelessWidget {
  const CardRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: LayoutHelper.spaceHorizontal,
          vertical: LayoutHelper.spaceSizeBox),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: LayoutHelper.spaceHorizontal,
            vertical: LayoutHelper.spaceVertical),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  offset: Offset(0, 0),
                  blurRadius: 5,
                  spreadRadius: 1)
            ]),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Icon(
              CupertinoIcons.doc_on_clipboard_fill,
              color: LayoutHelper.primaryColor,
            ),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: Text(
                "Mandiri by Livin, Existing To Bank",
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: LayoutHelper.fontSmall,
                    letterSpacing: 0.5.w),
              ),
            ),
            Container(
                width: 120.w,
                height: 25.h,
                child: MonitoringButton(
                  border: Border.all(color: Colors.transparent),
                  title: "Response",
                  callback: () => showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Center(child: Text("Mandiri By Livin")),
                          content: MonitoringDrop(hint: "Pilih Response"),
                          actions: [
                            TextButton(
                                onPressed: () => Get.back(),
                                child: Text("Batal")),
                            TextButton(onPressed: () {}, child: Text("Simpan")),
                          ],
                        );
                      }),
                  fontSize: 12.sp,
                  color: LayoutHelper.primaryColor,
                ))
          ],
        ),
      ),
    );
  }
}
