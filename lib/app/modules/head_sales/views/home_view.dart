import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/routes/app_pages.dart';
import 'package:monitoring_karyawan/helper/layout_helper.dart';
import 'package:monitoring_karyawan/widget/main_layout.dart';

class HomeViewAdmin extends GetView {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   "Welcome Admin Dashboard",
              //   style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800),
              // ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Data Produk",
                style: TextStyle(
                    fontSize: LayoutHelper.fontMedium,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MenuItem("Produk", "assets/anim/product.svg", () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Close'),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ],
                            content: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton.icon(
                                      onPressed: () {},
                                      icon: Icon(Icons.add),
                                      label: Text("Tambah")),
                                  ElevatedButton.icon(
                                      onPressed: () => Get.toNamed(Routes.PRODUCT_ADMIN),
                                      icon: Icon(Icons.list),
                                      label: Text("Lihat")),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }),
                  MenuItem("Program", "assets/anim/program.svg", () {}),
                ],
              ),
              // SizedBox(
              //   height: 20.h,
              // ),
              // Text(
              //   "Data Karyawan",
              //   style: TextStyle(
              //       fontSize: LayoutHelper.fontMedium,
              //       fontWeight: FontWeight.w500),
              // ),
              // SizedBox(
              //   height: 5.h,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     MenuItem("Karyawan", "assets/anim/person.svg",
              //         Routes.DETAIL_PRODUCT),
              //     MenuItem("Jabatan", "assets/anim/jabatan.svg",
              //         Routes.DETAIL_PRODUCT),
              //   ],
              // ),
              // SizedBox(
              //   height: 10.h,
              // ),
              // Text(
              //   "Data Leads",
              //   style: TextStyle(
              //       fontSize: LayoutHelper.fontMedium,
              //       fontWeight: FontWeight.w500),
              // ),
              // SizedBox(
              //   height: 5.h,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     MenuItem(
              //         "Leads", "assets/anim/leads.svg", Routes.DETAIL_PRODUCT),
              //     MenuItem("Alasan", "assets/anim/jabatan.svg",
              //         Routes.DETAIL_PRODUCT),
              //   ],
              // ),
            ],
          ),
        ),
        centerTitle: true,
        title: "Home Admin",
        appbarColor: LayoutHelper.primaryColor,
        scaffoldBackground: Colors.white,
        foregroundColor: Colors.white,
        autoLeading: false);
  }
}

class MenuItem extends GetView {
  final String title, icon;
  final callback;
  MenuItem(this.title, this.icon, this.callback);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        width: MediaQuery.of(context).size.width / 2 - 25.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: 60.w,
              height: 60.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: LayoutHelper.fontMedium,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  offset: Offset(0.5, 1),
                  blurRadius: 2.0)
            ]),
      ),
    );
  }
}
