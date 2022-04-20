import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoring_karyawan/helper/layout_helper.dart';
import 'package:monitoring_karyawan/widget/tab_button.dart';

class DetailLeadController extends GetxController {
  List<TabSelect> listColor = [
    TabSelect(LayoutHelper.primaryColor),
    TabSelect(Colors.grey),
    TabSelect(Colors.grey),
  ].obs;

  List<Widget> tabCustomerDetail = [];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tabCustomerDetail = [
      TabButton(
        color: listColor[0].color,
        title: "Penawaran",
        textColor: Colors.white,
        callBack: () {
          print("List 1");
          listColor[0].color = LayoutHelper.primaryColor;
          listColor[1].color = Colors.grey;
          listColor[2].color = Colors.grey;
        },
      ),
      TabButton(
        color: listColor[1].color,
        title: "Riwayat",
        textColor: Colors.white,
        callBack: () {
          print("List 2");
          listColor[0].color = Colors.grey;
          listColor[1].color = LayoutHelper.primaryColor;
          listColor[2].color = Colors.grey;
        },
      ),
      TabButton(
        color: listColor[2].color,
        title: "Portofolio",
        textColor: Colors.white,
        callBack: () {
          print("List 3");
          listColor[0].color = Colors.grey;
          listColor[1].color = Colors.grey;
          listColor[2].color = LayoutHelper.primaryColor;
        },
      ),
    ].obs;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}

class TabSelect {
  late final Color color;

  TabSelect(this.color);
}
