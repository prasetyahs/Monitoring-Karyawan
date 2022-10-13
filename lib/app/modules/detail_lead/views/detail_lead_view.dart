import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/detail_lead/views/customer_detail_tab_view.dart';

import 'package:monitoring_karyawan/helper/layout_helper.dart';
import 'package:monitoring_karyawan/widget/icon_title.dart';
import 'package:monitoring_karyawan/widget/main_layout.dart';
import 'package:monitoring_karyawan/widget/monitoring_button.dart';

import '../../../../widget/monitoring_drop.dart';
import '../../../../widget/tab_button.dart';
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
                        title: controller.detailLead.value.nik!,
                        fontSize: 12.sp,
                        icon: CupertinoIcons.number),
                    SizedBox(
                      height: LayoutHelper.spaceSizeBox,
                    ),
                    IconTitle(
                        title: controller.detailLead.value.namaCustomer!,
                        fontSize: 12.sp,
                        icon: CupertinoIcons.person_alt),
                    SizedBox(
                      height: LayoutHelper.spaceSizeBox,
                    ),
                    IconTitle(
                        title: controller.detailLead.value.noRek!,
                        fontSize: 12.sp,
                        icon: CupertinoIcons.creditcard_fill),
                    SizedBox(
                      height: LayoutHelper.spaceSizeBox,
                    ),
                    IconTitle(
                        title: controller.detailLead.value.telepon!,
                        fontSize: 12.sp,
                        icon: CupertinoIcons.phone_fill),
                    SizedBox(
                      height: LayoutHelper.spaceSizeBox,
                    ),
                    IconTitle(
                        title: controller.detailLead.value.email!,
                        fontSize: 12.sp,
                        icon: CupertinoIcons.mail_solid),
                  ],
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: LayoutHelper.spaceHorizontal,
                ),
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TabButton(
                        color: this.controller.listColor.value[0],
                        title: "Penawaran",
                        textColor: Colors.white,
                        callBack: () {
                          List<Color> colors = [
                            LayoutHelper.primaryColor,
                            Colors.grey,
                            Colors.grey,
                          ];
                          this.controller.listColor.value = colors;
                          this.controller.pageController.animateToPage(0,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease);
                        },
                      ),
                      TabButton(
                        color: this.controller.listColor.value[1],
                        title: "Riwayat",
                        textColor: Colors.white,
                        callBack: () {
                          List<Color> colors = [
                            Colors.grey,
                            LayoutHelper.primaryColor,
                            Colors.grey
                          ];
                          this.controller.listColor.value = colors;
                          this.controller.pageController.animateToPage(1,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease);
                        },
                      ),
                      TabButton(
                        color: this.controller.listColor.value[2],
                        title: "Portofolio",
                        textColor: Colors.white,
                        callBack: () {
                          List<Color> colors = [
                            Colors.grey,
                            Colors.grey,
                            LayoutHelper.primaryColor,
                          ];
                          this.controller.listColor.value = colors;
                          this.controller.pageController.animateToPage(2,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease);
                        },
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: LayoutHelper.spaceVertical,
            ),
            Obx(
              () => this.controller.indexTab.value == 0
                  ? Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: LayoutHelper.spaceHorizontal),
                          height: 25.h,
                          child: MonitoringButton(
                            border: Border.all(color: Colors.transparent),
                            color: LayoutHelper.primaryColor,
                            title: "Create Product Leads",
                            fontSize: 9.sp,
                            callback: () => showDialog(
                                context: context,
                                builder: (context) {
                                  return this.controller.program.value.data !=
                                          null
                                      ? AlertDialog(
                                          title: Center(
                                              child: Text("Create Leads")),
                                          content: MonitoringDrop(
                                              value: this
                                                  .controller
                                                  .idProgram
                                                  .value
                                                  .toString(),
                                              hint: "Pilih Program",
                                              data: this
                                                  .controller
                                                  .program
                                                  .value
                                                  .data!,
                                              controller: this.controller),
                                          actions: [
                                            TextButton(
                                                onPressed: () => Get.back(),
                                                child: Text("Batal")),
                                            TextButton(
                                                onPressed: () {},
                                                child: Text("Simpan")),
                                          ],
                                        )
                                      : Center(
                                          child: CircularProgressIndicator(),
                                        );
                                }),
                          ),
                        ),
                        SizedBox(
                          height: LayoutHelper.spaceVertical,
                        ),
                      ],
                    )
                  : Container(),
            ),
            Obx(
              () => Expanded(
                  child: PageView(
                onPageChanged: (index) {
                  this.controller.indexTab.value = index;
                },
                controller: this.controller.pageController,
                children: [
                  this.controller.productLeadsOffer.value.data != null
                      ? CustomerDetailTabView(
                          this.controller.productLeadsOffer.value.data!,
                          this.controller.product.value.data,
                          this.controller,
                          isOffer: 1,
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
                  this.controller.productLeadsHistory.value.data != null
                      ? CustomerDetailTabView(
                          this.controller.productLeadsHistory.value.data!,
                          [],
                          this.controller,
                        )
                      : Center(child: CircularProgressIndicator()),
                  this.controller.productLeadsPortofolio.value.data != null
                      ? CustomerDetailTabView(
                          this.controller.productLeadsPortofolio.value.data!,
                          [],
                          this.controller,
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        )
                ],
              )),
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
