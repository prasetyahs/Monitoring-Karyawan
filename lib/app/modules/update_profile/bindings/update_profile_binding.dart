import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/update_profile/provider/update_profile_provider.dart';

import '../controllers/update_profile_controller.dart';

class UpdateProfileBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<UpdateProfileController>(
    //   () => UpdateProfileController(),
    // );
    Get.lazyPut(() => UpdateProfileProvider());
    Get.put(UpdateProfileController(Get.find()));
  }
}
