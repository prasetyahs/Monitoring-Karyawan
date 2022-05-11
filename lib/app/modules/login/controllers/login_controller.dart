import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/login/login_model.dart';
import 'package:monitoring_karyawan/app/modules/login/provider/login_provider.dart';
import 'package:monitoring_karyawan/app/routes/app_pages.dart';
import 'package:monitoring_karyawan/helper/shared_prefs.dart';
import 'package:monitoring_karyawan/widget/loading_dialog.dart';

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

  void login() {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return LoadingDialog();
        });
    loginProvider.postLogin({
      'nip': nipTextController.text,
      'password': passwordTextController.text
    }).then((value) async {
      LoginModel? result = value.body;
      if (result?.success == true) {
        await SharedPrefs
            .writePrefs(result!.data!)
            .then((value) => Get.offAndToNamed(Routes.HOME_APP));
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
          content: Text(
            result!.message.toString(),
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
        ));
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
