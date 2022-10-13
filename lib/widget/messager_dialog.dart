import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/login/login_model.dart';

class MessagerDialog {
  static ScaffoldFeatureController show(model) =>
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text(
          model.message.toString(),
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: model.success! ? Colors.greenAccent : Colors.red,
      ));
}
