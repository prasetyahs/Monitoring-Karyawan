import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/login/provider/login_provider.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginProvider());
    Get.put(LoginController(Get.find()));
  }
}
