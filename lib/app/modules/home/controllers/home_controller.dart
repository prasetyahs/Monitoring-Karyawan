import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/routes/app_pages.dart';
import 'package:monitoring_karyawan/helper/shared_prefs.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  @override
  void onInit() async {
    await SharedPrefs.readPrefs().then((value) {
      if (value?.nik != null) {
        Get.offAndToNamed(Routes.HOME_APP);
      }
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
