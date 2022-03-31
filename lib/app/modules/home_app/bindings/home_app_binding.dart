import 'package:get/get.dart';

import '../controllers/home_app_controller.dart';

class HomeAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeAppController>(
      () => HomeAppController(),
    );
  }
}
