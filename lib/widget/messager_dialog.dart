import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoring_karyawan/helper/layout_helper.dart';

class MessagerDialog {
  static ScaffoldFeatureController show(model) =>
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text(
          model.message.toString(),
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: model.success! ? LayoutHelper.primaryColor : Colors.red,
      ));
}
