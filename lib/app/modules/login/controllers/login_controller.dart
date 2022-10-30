import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/login/login_model.dart';
import 'package:monitoring_karyawan/app/modules/login/provider/login_provider.dart';
import 'package:monitoring_karyawan/app/routes/app_pages.dart';
import 'package:monitoring_karyawan/helper/api_response.dart';
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
      ApiResponse apiResponse = value.body;
      LoginModel data = apiResponse.data != null
          ? LoginModel.fromJson(apiResponse.data)
          : LoginModel();
      if (apiResponse.success) {
        
        await SharedPrefs.writePrefs(data).whenComplete(() => data.role == "1"
            ? Get.offAndToNamed(Routes.ADMIN_HOME)
            : Get.offAndToNamed(Routes.HOME_APP));
      } else {
        MessagerDialog.show(apiResponse);
      }
      Get.back();
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
