import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/home_app/product_model.dart';
import 'package:monitoring_karyawan/app/modules/home_app/providers/product_provider.dart';
import 'package:monitoring_karyawan/helper/value_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeAppController extends GetxController with StateMixin<Product> {
  final count = 0.obs;
  final pageController = ValueHelper.pageController;
  final RxInt _indexMenu = 0.obs;
  final ProductProvider productProvider;

  HomeAppController({required this.productProvider});

  void allProducts() {
    productProvider.allProduct().then((value) {
      Product? products = value.body;
      change(products, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  Future<void> intentExplicit(Uri schema) async {
    final Uri launchUri = schema;

    await launch(launchUri.toString());
  }

  set indexMenu(int v) {
    _indexMenu.value = v;
  }

  int get indexMenu => _indexMenu.value;

  @override
  void onInit() {
    allProducts();
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
