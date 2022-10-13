import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/login/login_model.dart';
import 'package:monitoring_karyawan/app/modules/login/provider/login_provider.dart';
import 'package:monitoring_karyawan/app/routes/app_pages.dart';
import 'package:monitoring_karyawan/helper/shared_prefs.dart';
import 'package:monitoring_karyawan/widget/loading_dialog.dart';
import 'package:monitoring_karyawan/widget/messager_dialog.dart';

class LoginController extends GetxController with StateMixin<LoginModel> {
  final LoginProvider loginProvider;
  final nipTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final count = 0.obs;
  var isShowPassword = true.obs;
  LoginController(this.loginProvider);

  set showPassword(isShowPassword) {
    this.isShowPassword.value = isShowPassword;
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> login() async {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return LoadingDialog();
        });

    await loginProvider.postLogin({
      'nip': nipTextController.text,
      'password': passwordTextController.text
    }).then((value) async {
      print(value.bodyString);
      LoginModel loginModel = value.body;
      if (loginModel.success!) {
        await SharedPrefs.writePrefs(loginModel.data!)
            .whenComplete(() => Get.offAndToNamed(Routes.HOME_APP));
      } else {
        MessagerDialog.show(loginModel);
      }
      Get.back();
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
