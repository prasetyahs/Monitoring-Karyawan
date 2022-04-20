import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/detail_lead/views/customer_detail_tab_view.dart';

import 'package:monitoring_karyawan/helper/layout_helper.dart';
import 'package:monitoring_karyawan/widget/icon_title.dart';
import 'package:monitoring_karyawan/widget/main_layout.dart';

import '../controllers/detail_lead_controller.dart';

class DetailLeadView extends GetView<DetailLeadController> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: LayoutHelper.spaceHorizontal,
                  vertical: LayoutHelper.spaceVertical),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: LayoutHelper.spaceHorizontal,
                    vertical: LayoutHelper.spaceVertical),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      offset: Offset(0, 0),
                      blurRadius: 5,
                      spreadRadius: 1)
                ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconTitle(
                        title: "Prasetya Hadi Saputra",
                        fontSize: 15.sp,
                        icon: CupertinoIcons.person_alt),
                    SizedBox(
                      height: LayoutHelper.spaceSizeBox,
                    ),
                    IconTitle(
                        title: "31750006",
                        fontSize: 15.sp,
                        icon: CupertinoIcons.creditcard_fill),
                    SizedBox(
                      height: LayoutHelper.spaceSizeBox,
                    ),
                    IconTitle(
                        title: "089506277284",
                        fontSize: 15.sp,
                        icon: CupertinoIcons.phone_fill),
                    SizedBox(
                      height: LayoutHelper.spaceSizeBox,
                    ),
                    IconTitle(
                        title:
                            "Jalan Kesadara RT 04 RW 01 Larangan Larangan Banjanegara 53455",
                        fontSize: 15.sp,
                        icon: CupertinoIcons.location_fill),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: LayoutHelper.spaceHorizontal,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: controller.tabCustomerDetail,
              ),
            ),
            SizedBox(
              height: LayoutHelper.spaceVertical,
            ),
            Expanded(
              child: PageView(
                children: [
                  CustomerDetailTabView(),
                  CustomerDetailTabView(),
                  CustomerDetailTabView(),
                ],
              ),
            )
          ],
        ),
        title: "Customer Detail",
        appbarColor: LayoutHelper.primaryColor,
        scaffoldBackground: Colors.white,
        foregroundColor: Colors.white,
        autoLeading: true);
  }
}
