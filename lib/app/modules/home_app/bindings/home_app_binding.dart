import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/home_app/providers/product_provider.dart';

import '../controllers/home_app_controller.dart';

class HomeAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductProvider());
    Get.put(HomeAppController(productProvider: Get.find()));
  }
}
