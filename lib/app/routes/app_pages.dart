import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/admin/bindings/admin_binding.dart';
import 'package:monitoring_karyawan/app/modules/admin/views/admin_view.dart';
import 'package:monitoring_karyawan/app/modules/head_sales/views/home_view.dart';

import '../modules/detail_lead/bindings/detail_lead_binding.dart';
import '../modules/detail_lead/views/detail_lead_view.dart';
import '../modules/detail_product/bindings/detail_product_binding.dart';
import '../modules/detail_product/views/detail_product_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_app/bindings/home_app_binding.dart';
import '../modules/home_app/views/home_app_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/update_password/bindings/update_password_binding.dart';
import '../modules/update_password/views/update_password_view.dart';
import '../modules/update_profile/bindings/update_profile_binding.dart';
import '../modules/update_profile/views/update_profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME_APP,
      page: () => HomeAppView(),
      binding: HomeAppBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_LEAD,
      page: () => DetailLeadView(),
      binding: DetailLeadBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PRODUCT,
      page: () => DetailProductView(),
      binding: DetailProductBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_PROFILE,
      page: () => UpdateProfileView(),
      binding: UpdateProfileBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_PASSWORD,
      page: () => UpdatePasswordView(),
      binding: UpdatePasswordBinding(),
    ),
    GetPage(name: _Paths.HOME_ADMIN, page: () => HomeViewAdmin()),
    GetPage(
        name: _Paths.ADMIN_HOME,
        bindings: [HomeAppBinding(), AdminBinding()],
        page: () => AdminView())
  ];
}
