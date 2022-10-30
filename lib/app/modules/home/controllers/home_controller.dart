import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/routes/app_pages.dart';
import 'package:monitoring_karyawan/helper/shared_prefs.dart';

class HomeController extends GetxController {
  @override
  void onInit() async {
    await SharedPrefs.readPrefs().then((value) async {
      if (value?.nik != null) {
        return value?.role == "1"
            ? Get.offAndToNamed(Routes.ADMIN_HOME)
            : Get.offAndToNamed(Routes.HOME_APP);
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
