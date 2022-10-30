import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/detail_lead/leads_product_model.dart'
    as mLeadProduct;
import 'package:monitoring_karyawan/app/modules/home_app/product_model.dart'
    as mProduct;
import 'package:monitoring_karyawan/helper/layout_helper.dart';
import 'package:monitoring_karyawan/widget/monitoring_button.dart';
import 'package:monitoring_karyawan/widget/monitoring_textfield.dart';
import 'package:monitoring_karyawan/widget/not_found.dart';

import '../controllers/detail_lead_controller.dart';

class CustomerDetailTabView extends GetView {
  final List<mLeadProduct.Data> leadsProduct;
  final isOffer;
  final List<mProduct.Data> products;
  final DetailLeadController controller;
  final int isHistory;

  CustomerDetailTabView(
    this.leadsProduct,
    this.products,
    this.controller, {
    this.isHistory = 0,
    this.isOffer = 0,
  });

  @override
  Widget build(BuildContext context) {
    return leadsProduct.isNotEmpty
        ? ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return CardRow(
                leadsProduct: leadsProduct[index],
                isOffer: this.isOffer,
                product: products,
                isHistory: isHistory,
                controller: controller,
              );
            },
            itemCount: leadsProduct.length,
          )
        : NotFound();
  }
}

class CardRow extends StatelessWidget {
  final mLeadProduct.Data leadsProduct;
  final List<mProduct.Data> product;
  final int isOffer;
  final int isHistory;

  final controller;
  const CardRow({
    Key? key,
    required this.leadsProduct,
    this.isOffer = 0,
    required this.product,
    this.controller,
    this.isHistory = 0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => this.isHistory == 1 || this.isHistory == 2
          ? showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Alasan"),
                  content: Text(this.leadsProduct.alasan!),
                );
              })
          : false,
      child: Padding(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      leadsProduct.program!,
                      style: TextStyle(
                          fontSize: LayoutHelper.fontSmall,
                          letterSpacing: 0.5.w),
                    ),
                    Text(
                      leadsProduct.date!,
                      style: TextStyle(
                          fontSize: LayoutHelper.fontSmall - 2,
                          color: Colors.grey.shade700),
                    )
                  ],
                ),
              ),
              this.isHistory == 1
                  ? Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                      child: Text(
                        "Menolak",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: LayoutHelper.fontSmall),
                      ),
                    )
                  : Container(),
              this.isOffer == 1
                  ? Container(
                      width: 120.w,
                      height: 25.h,
                      child: MonitoringButton(
                        border: Border.all(color: Colors.transparent),
                        title: "Response",
                        callback: () => showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Center(child: Text("Response")),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Obx(
                                          () => DropdownButton<int>(
                                              icon: const Icon(
                                                  Icons.arrow_drop_down),
                                              isExpanded: true,
                                              elevation: 16,
                                              hint: Text("Pilih Response"),
                                              style: const TextStyle(
                                                  color: Colors.deepPurple),
                                              underline: Container(
                                                  height: 1.0,
                                                  color: Colors.grey[500]),
                                              onChanged: (val) {
                                                controller
                                                    .setStatusResponse(val);
                                              },
                                              value: controller.statusResponse
                                                          .value ==
                                                      0
                                                  ? null
                                                  : controller
                                                      .statusResponse.value,
                                              items: [
                                                DropdownMenuItem(
                                                    value: 1,
                                                    child: Text("Berminat")),
                                                DropdownMenuItem(
                                                    value: 2,
                                                    child: Text("Follow Up")),
                                                DropdownMenuItem(
                                                    value: 3,
                                                    child: Text("Menolak")),
                                              ]),
                                        )),
                                    MonitoringTextField(
                                        labelText: "Alasan",
                                        icon: Icons.note,
                                        isObsecure: false,
                                        maxLine: 3,
                                        textInputType: TextInputType.multiline,
                                        controller: controller.notedResponse)
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () => Get.back(),
                                      child: Text("Batal")),
                                  TextButton(
                                      onPressed: () => controller
                                          .sendResponse(leadsProduct.id),
                                      child: Text("Simpan")),
                                ],
                              );
                            }),
                        fontSize: LayoutHelper.fontSmall,
                        color: LayoutHelper.primaryColor,
                      ))
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
