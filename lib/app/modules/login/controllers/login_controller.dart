import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/login/login_model.dart';
import 'package:monitoring_karyawan/app/modules/login/provider/login_provider.dart';
import 'package:monitoring_karyawan/app/routes/app_pages.dart';
import 'package:monitoring_karyawan/widget/loading_dialog.dart';

class LoginController extends GetxController with StateMixin<LoginModel> {
  final LoginProvider loginProvider;
  final nipTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final count = 0.obs;

  LoginController(this.loginProvider);

  void login() {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return LoadingDialog();
        });
    loginProvider.postLogin({
      'nip': nipTextController.text,
      'password': passwordTextController.text
    }).then((value) {
      LoginModel? result = value.body;
      Get.back();
      if (result?.success == true) {
        Get.offAndToNamed(Routes.HOME_APP);
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
          content: Text(
            result!.message.toString(),
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
        ));
      }
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
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
