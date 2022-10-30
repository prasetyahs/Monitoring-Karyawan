import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/detail_lead/provider/detail_lead_provider.dart';
import 'package:monitoring_karyawan/app/modules/detail_lead/provider/product_leads_provider.dart';
import 'package:monitoring_karyawan/app/modules/detail_lead/provider/program_lead_provider.dart';
import 'package:monitoring_karyawan/app/modules/home_app/controllers/home_app_controller.dart';
import 'package:monitoring_karyawan/app/modules/home_app/providers/product_provider.dart';

import '../controllers/detail_lead_controller.dart';

class DetailLeadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailLeadProvider());
    Get.lazyPut(() => ProgramLeadProvider());
    Get.lazyPut(() => ProductProvider());
    Get.lazyPut(() => ProductLeadsProvider());
    Get.lazyPut(() => Get.find());
    Get.put(DetailLeadController(
        Get.find(), Get.find(), Get.find(), Get.find(), Get.find()));
  }
}
