import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/home_app/controllers/leads_controller.dart';
import 'package:monitoring_karyawan/app/modules/home_app/dashboard_model.dart';
import 'package:monitoring_karyawan/app/modules/home_app/data/DataLeads.dart';
import 'package:monitoring_karyawan/app/modules/home_app/leads_model.dart';
import 'package:monitoring_karyawan/app/modules/home_app/product_model.dart';
import 'package:monitoring_karyawan/app/modules/home_app/providers/dashboard_provider.dart';
import 'package:monitoring_karyawan/app/modules/home_app/providers/leads_provider.dart';
import 'package:monitoring_karyawan/app/modules/detail_lead/provider/product_leads_provider.dart';
import 'package:monitoring_karyawan/app/modules/home_app/providers/product_provider.dart';
import 'package:monitoring_karyawan/app/modules/login/login_model.dart'
    as login;

import 'package:monitoring_karyawan/helper/shared_prefs.dart';
import 'package:monitoring_karyawan/helper/value_helper.dart';
import 'package:monitoring_karyawan/widget/loading_dialog.dart';
import 'package:monitoring_karyawan/widget/messager_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeAppController extends GetxController with StateMixin<Product> {
  final count = 0.obs;
  final pageController = ValueHelper.pageController;
  final RxInt _indexMenu = 0.obs;
  final ProductProvider productProvider;
  final DashboardProvider dashboardProvider;
  final LeadsProvider leadsProvider;
  final Rx<login.Data> dataLogin = login.Data().obs;
  final leads = Leads().obs;
  final dashboard = Dashboard.fromDashboard().obs;
  final titleCard = ["Sudah Kotak", "Belum Kontak"].obs;
  final List<TextEditingController> controllersLeads = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ].obs;

  final _loadSuccess = false.obs;
  final Map<String, double> dataChart = {};

  HomeAppController(
      {required this.dashboardProvider,
      required this.productProvider,
      required this.leadsProvider,
      });
  Future<Leads> loadLeads(id) async => await leadsProvider.getLeads(id);

  final gender = "".obs;
  void setGender(value) {
    gender.value = value;
  }

  void createProductLeads() {}

  Future<void> storeLeads() async {
    var data = await SharedPrefs.readPrefs();
    DataLeads inputLeads = DataLeads(
        nik: controllersLeads[0].text,
        namaCustomer: controllersLeads[1].text,
        tglLahir: controllersLeads[2].text,
        noRek: controllersLeads[3].text,
        jenisKelamin: gender.value,
        email: controllersLeads[4].text.toString(),
        telepon: controllersLeads[5].text);
    showDialog(
        context: Get.context!,
        builder: (context) {
          return LoadingDialog();
        });

    await leadsProvider.postLeads({
      'nik': inputLeads.nik,
      'nama_customer': inputLeads.namaCustomer,
      'tgl_lahir': inputLeads.tglLahir,
      'no_rek': inputLeads.noRek,
      'jenis_kelamin': inputLeads.jenisKelamin,
      'telepon': inputLeads.telepon,
      'email': inputLeads.email
    }, data?.id).then((value) {
      Leads leads = value.body;
      print(value.bodyString);
      Get.back();
      MessagerDialog.show(leads);
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  Future<void> init() async {
    productProvider.allProduct().then((value) {
      Product? products = value.body;
      change(products, status: RxStatus.success());
    });
    var data = await SharedPrefs.readPrefs();
    this.dataLogin.value = data!;
    this.leads.value = (await leadsProvider.getLeads(data.id));
    this.dashboard.value =
        await this.dashboardProvider.getDashboard(data.id.toString());
    _loadSuccess.value = true;
    this.dataChart.addAll({
      "Follow Up":
          double.parse(this.dashboard.value.data.followUpPercent.toString()),
      "Berminat":
          double.parse(this.dashboard.value.data.interestedPercent.toString()),
      "Menolak":
          double.parse(this.dashboard.value.data.refusePercent.toString()),
    });
    update();
  }

  Future<bool> intentExplicit(Uri schema) async {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return LoadingDialog();
        });
    final Uri launchUri = schema;
    return await launch(launchUri.toString()).whenComplete(() => Get.back());
  }

  set indexMenu(int v) {
    _indexMenu.value = v;
  }

  bool loadSuccess() => _loadSuccess.value;

  int get indexMenu => _indexMenu.value;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  @override
  Future<void> onReady() async {
    // chartData = [
    // ChartData(
    //     "Follow Up",
    //     this.dashboard.value.data.followUpPercent == 0
    //         ? 20
    //         : int.parse(this.dashboard.value.data.followUpPercent.toString()),
    //     Colors.blue),
    // ChartData(
    //     "Berminat",
    //     this.dashboard.value.data.interestedPercent == 0
    //         ? 20
    //         : int.parse(
    //             this.dashboard.value.data.interestedPercent.toString()),
    //     Colors.blueGrey),
    // ChartData(
    //     "Menolak",
    //     this.dashboard.value.data.refusePercent == 0
    //         ? 15
    //         : int.parse(this.dashboard.value.data.refusePercent.toString()),
    //     Colors.amber)
    // ];
    // dataLogin.value = value!;
    // print(dataLogin.value.id);
    // await leadsController
    //     .loadLeads(1)
    //     .then((value) => leads.value = value!);
    // await dashboardProvider
    //     .getDashboard(1)
    //     .then((value) {
    //   dashboard.value = value.data;
    // _loadSuccess.value = true;
    //   chartData = [
    //     ChartData(
    //         "Follow Up",
    //         int.parse(dashboard.value!.followUpPercent.toString()),
    //         Colors.blue),
    //     ChartData(
    //         "Berminat",
    //         int.parse(dashboard.value!.interestedPercent.toString()),
    //         Colors.blueGrey),
    //     ChartData(
    //         "Menolak",
    //         int.parse(dashboard.value!.refusePercent.toString()),
    //         Colors.amber)
    //   ];
    // });

    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
