import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/home_app/controllers/home_app_controller.dart';
import 'package:monitoring_karyawan/app/modules/home_app/product_model.dart';
import 'package:monitoring_karyawan/helper/layout_helper.dart';
import 'package:monitoring_karyawan/widget/main_layout.dart';
import 'package:monitoring_karyawan/widget/not_found.dart';

class ProductView extends GetView<HomeAppController> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: controller.obx((state) => state!.data.isNotEmpty
          ? ListView.builder(
              itemBuilder: (c, i) {
                return RowProduct(
                  index: i,
                  callback: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text("Persyaratan"),
                            content: Text(state.data[i].persyaratan.toString()),
                          )),
                  product: state,
                );
              },
              itemCount: state.data.length,
            )
          : Center(child: NotFound())),
      appbarColor: LayoutHelper.primaryColor,
      autoLeading: false,
      foregroundColor: Colors.white,
      scaffoldBackground: Colors.white,
      title: 'Product & Promo',
    );
  }
}

class RowProduct extends StatelessWidget {
  const RowProduct(
      {Key? key, this.callback, required this.product, required this.index})
      : super(key: key);
  final Product product;
  final int index;
  final callback;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: 5.h, horizontal: LayoutHelper.spaceHorizontal),
        padding: EdgeInsets.symmetric(
            horizontal: LayoutHelper.spaceHorizontal,
            vertical: LayoutHelper.spaceVertical),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  offset: Offset(0, 0),
                  blurRadius: 5,
                  spreadRadius: 1),
            ],
            borderRadius: BorderRadius.circular(5.w)),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: LayoutHelper.spaceSizeBoxHorizontal,
                  vertical: LayoutHelper.spaceSizeBox),
              decoration: BoxDecoration(
                  color: LayoutHelper.primaryColor,
                  borderRadius: BorderRadius.circular(5.w)),
              child: Icon(
                Icons.apps_outlined,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: LayoutHelper.spaceHorizontal,
            ),
            Container(
              child: Text(
                product.data[index].product.toString(),
                style: TextStyle(
                    color: Colors.grey, fontSize: 15.sp, letterSpacing: 0.2.w),
              ),
            )
          ],
        ),
      ),
    );
  }
}
