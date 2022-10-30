import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/admin/provider/admin_provider.dart';
import 'package:monitoring_karyawan/app/modules/home_app/providers/product_provider.dart';

import '../controllers/admin_controller.dart';

class AdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminProvider());
    Get.lazyPut(() => ProductProvider());
    Get.put(AdminController(Get.find(),Get.find()));
  }
}
