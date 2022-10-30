import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/login/login_model.dart';
import 'package:monitoring_karyawan/app/modules/update_password/provider/update_password_provider.dart';
import 'package:monitoring_karyawan/app/modules/update_profile/provider/update_profile_provider.dart';
import 'package:monitoring_karyawan/helper/api_response.dart';
import 'package:monitoring_karyawan/helper/shared_prefs.dart';
import 'package:monitoring_karyawan/widget/messager_dialog.dart';

import '../../../../widget/loading_dialog.dart';

class UpdateProfileController extends GetxController {
  List<TextEditingController> inputController =
      List.generate(5, (i) => TextEditingController());
  final count = 0.obs;
  final UpdateProfileProvider _updateProfileProvider;

  UpdateProfileController(this._updateProfileProvider);
  @override
  void onInit() async {
    super.onInit();
    await SharedPrefs.readPrefs().then((value) => {
          inputController[0].text = value!.namaKaryawan!,
          inputController[1].text = value.tglLahir!,
          inputController[2].text = value.email!,
          inputController[3].text = value.telepon!,
          // inputController[4].text = value!,

        });
  }

  void updateProfile() async {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return LoadingDialog();
        });
    var data = await SharedPrefs.readPrefs();
    _updateProfileProvider.updateProfile(data!.id, {
      "nama_karyawan": inputController[0].text,
      "tgl_lahir": inputController[1].text,
      "email": inputController[2].text,
      "telepon": inputController[3].text,
      "_method": "put",
    }).then((value) async {
      print(value.bodyString);
      print(value.request!.url);
      ApiResponse apiResponse = value.body;
      LoginModel data = LoginModel.fromJson(apiResponse.data);
      await SharedPrefs.writePrefs(data);
      Get.back();
      MessagerDialog.show(value.body);
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
