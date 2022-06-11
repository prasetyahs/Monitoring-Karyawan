import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoring_karyawan/helper/shared_prefs.dart';

class UpdateProfileController extends GetxController {
  List<TextEditingController> inputController =
      List.generate(5, (i) => TextEditingController());
  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await SharedPrefs.readPrefs().then((value) => {
          inputController[0].text = value!.namaKaryawan!,
          inputController[1].text = value.tglLahir!,
          inputController[2].text = value.email!,
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
