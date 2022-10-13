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
import 'package:monitoring_karyawan/widget/monitoring_drop.dart';

import '../controllers/detail_lead_controller.dart';

class CustomerDetailTabView extends GetView {
  final List<mLeadProduct.Data> leadsProduct;
  final isOffer;
  final List<mProduct.Data> products;
  final DetailLeadController controller;
  CustomerDetailTabView(this.leadsProduct, this.products, this.controller,
      {this.isOffer = 0});

  @override
  Widget build(BuildContext context) {
    return leadsProduct != null
        ? ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return CardRow(
                leadsProduct: leadsProduct[index],
                isOffer: this.isOffer,
                product: products,
                controller: controller,
              );
            },
            itemCount: leadsProduct.length,
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}

class CardRow extends StatelessWidget {
  final mLeadProduct.Data leadsProduct;
  final List<mProduct.Data> product;
  final int isOffer;
  final controller;
  const CardRow(
      {Key? key,
      required this.leadsProduct,
      this.isOffer = 0,
      required this.product,
      this.controller})
      : super(key: key);
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
                leadsProduct.product!,
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: LayoutHelper.fontSmall,
                    letterSpacing: 0.5.w),
              ),
            ),
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
                              title: Center(
                                  child: Text(
                                      leadsProduct.product!.toUpperCase())),
                              content: MonitoringDrop(
                                hint: "Pilih Produk",
                                data: product, controller: this.controller,
                                value: '',
                                // controller:
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () => Get.back(),
                                    child: Text("Batal")),
                                TextButton(
                                    onPressed: () {}, child: Text("Simpan")),
                              ],
                            );
                          }),
                      fontSize: 12.sp,
                      color: LayoutHelper.primaryColor,
                    ))
                : Container()
          ],
        ),
      ),
    );
  }
}
