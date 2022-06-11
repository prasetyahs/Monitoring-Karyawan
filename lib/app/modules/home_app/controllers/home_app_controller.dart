import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/home_app/controllers/leads_controller.dart';
import 'package:monitoring_karyawan/app/modules/home_app/dashboard_model.dart';
import 'package:monitoring_karyawan/app/modules/home_app/leads_model.dart';
import 'package:monitoring_karyawan/app/modules/home_app/product_model.dart';
import 'package:monitoring_karyawan/app/modules/home_app/providers/dashboard_provider.dart';
import 'package:monitoring_karyawan/app/modules/home_app/providers/leads_provider.dart';
import 'package:monitoring_karyawan/app/modules/home_app/providers/product_provider.dart';
import 'package:monitoring_karyawan/app/modules/login/login_model.dart'
    as login;
import 'package:monitoring_karyawan/helper/shared_prefs.dart';
import 'package:monitoring_karyawan/helper/value_helper.dart';
import 'package:url_launcher/url_launcher.dart';

import '../chart_model.dart';

class HomeAppController extends GetxController with StateMixin<Product> {
  final count = 0.obs;
  final pageController = ValueHelper.pageController;
  final RxInt _indexMenu = 0.obs;
  final ProductProvider productProvider;
  final DashboardProvider dashboardProvider;
  final LeadsProvider leadsProvider;
  final LeadsController leadsController;
  final Rx<login.Data> dataLogin = login.Data().obs;
  final leads = Leads().obs;
  final dashboard = Dashboard().data.obs;
  final titleCard = ["Sudah Kotak", "Belum Kontak"].obs;
  List<ChartData> chartData = [];

  final _loadSuccess = false.obs;

  HomeAppController( {
    required this.leadsController,
    required this.dashboardProvider,
    required this.productProvider,
    required this.leadsProvider,
  });

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

  bool loadSuccess() => _loadSuccess.value;

  int get indexMenu => _indexMenu.value;

  @override
  void onInit() {
    allProducts();
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await SharedPrefs.readPrefs().then((value) async {
      dataLogin.value = value!;
      await leadsController
          .loadLeads(dataLogin.value.id!)
          .then((value) => leads.value = value!);
      await dashboardProvider.getDashboard(dataLogin.value.id!).then((value) {
        dashboard.value = value!.data;
        _loadSuccess.value = true;
        chartData = [
          ChartData(
              "Follow Up",
              int.parse(dashboard.value!.followUpPercent.toString()),
              Colors.blue),
          ChartData(
              "Berminat",
              int.parse(dashboard.value!.interestedPercent.toString()),
              Colors.blueGrey),
          ChartData(
              "Menolak",
              int.parse(dashboard.value!.refusePercent.toString()),
              Colors.amber)
        ];
      });
    });

    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
