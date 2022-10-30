import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/update_password/provider/update_password_provider.dart';

import '../controllers/update_password_controller.dart';

class UpdatePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdatePasswordProvider());
    Get.put(UpdatePasswordController(Get.find()));
  }
}
