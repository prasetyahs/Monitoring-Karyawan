import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/home_app/controllers/leads_controller.dart';
import 'package:monitoring_karyawan/app/modules/home_app/providers/dashboard_provider.dart';
import 'package:monitoring_karyawan/app/modules/home_app/providers/leads_provider.dart';
import 'package:monitoring_karyawan/app/modules/home_app/providers/product_provider.dart';

import '../controllers/home_app_controller.dart';

class HomeAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductProvider());
    Get.lazyPut(() => DashboardProvider());
    Get.lazyPut(() => LeadsProvider());
    Get.lazyPut(() => LeadsController(Get.find()));
    Get.put(HomeAppController(
        productProvider: Get.find(),
        dashboardProvider: Get.find(),
        leadsProvider: Get.find(),
        leadsController: Get.find()));
  }
}
