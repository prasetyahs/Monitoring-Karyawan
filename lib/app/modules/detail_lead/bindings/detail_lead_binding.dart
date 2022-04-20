import 'package:get/get.dart';

import '../controllers/detail_lead_controller.dart';

class DetailLeadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailLeadController>(
      () => DetailLeadController(),
    );
  }
}
