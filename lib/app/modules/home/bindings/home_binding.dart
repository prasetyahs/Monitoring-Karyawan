import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/home_app/controllers/home_app_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
