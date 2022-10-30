import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/update_password/provider/update_password_provider.dart';
import 'package:monitoring_karyawan/helper/api_response.dart';
import 'package:monitoring_karyawan/widget/messager_dialog.dart';

import '../../../../helper/shared_prefs.dart';
import '../../../../widget/loading_dialog.dart';

class UpdatePasswordController extends GetxController {
  final count = 0.obs;
  final UpdatePasswordProvider _updatePasswordProvider;
  final List<TextEditingController> textEditingController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  UpdatePasswordController(this._updatePasswordProvider);
  
  @override
  void onInit() {
    super.onInit();
  }

  void updatePassword() async {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return LoadingDialog();
        });
    var data = await SharedPrefs.readPrefs();
    _updatePasswordProvider.updatePassword(data?.id, {
      "old_password": textEditingController[0].text,
      "new_password": textEditingController[1].text,
      "confirm_password": textEditingController[2].text
    }).then((value) {
      print(value.bodyString);
      Get.back();
      ApiResponse apiResponse = value.body;
      MessagerDialog.show(apiResponse);
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
