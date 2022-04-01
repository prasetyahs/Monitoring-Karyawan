import 'package:get/get.dart';
import 'package:monitoring_karyawan/helper/value_helper.dart';

class HomeAppController extends GetxController {
  final count = 0.obs;
  final pageController = ValueHelper.pageController;
  final RxInt _indexMenu = 0.obs;

  set indexMenu(int v) {
    _indexMenu.value = v;
  }

  int get indexMenu => _indexMenu.value;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
