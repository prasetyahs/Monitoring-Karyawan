import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/detail_lead/leads_product_model.dart';
import 'package:monitoring_karyawan/app/modules/detail_lead/program_model.dart'
    as programEx;
import 'package:monitoring_karyawan/app/modules/detail_lead/provider/detail_lead_provider.dart';
import 'package:monitoring_karyawan/app/modules/detail_lead/provider/product_leads_provider.dart';
import 'package:monitoring_karyawan/app/modules/detail_lead/provider/program_lead_provider.dart';
import 'package:monitoring_karyawan/app/modules/home_app/controllers/home_app_controller.dart';
import 'package:monitoring_karyawan/app/modules/home_app/product_model.dart';
import 'package:monitoring_karyawan/app/modules/home_app/providers/product_provider.dart';
import 'package:monitoring_karyawan/helper/api_response.dart';
// import 'package:monitoring_karyawan/app/modules/detail_lead/leads_product_model.dart';
import 'package:monitoring_karyawan/helper/layout_helper.dart';

import '../../../../widget/loading_dialog.dart';
import '../../../../widget/messager_dialog.dart';
import '../../home_app/leads_model.dart' as leads;

class DetailLeadController extends GetxController {
  final listColor = [].obs;

  List<Widget> tabCustomerDetail = [];
  final pageController = PageController();
  final detailLead = leads.Data().obs;
  final count = 0.obs;
  final productLeadsOffer = LeadsProduct.fromLeadsProduct().obs;
  final productLeadsHistory = LeadsProduct.fromLeadsProduct().obs;
  final productLeadsPortofolio = LeadsProduct.fromLeadsProduct().obs;
  final program = programEx.ProgramModel.fromProgramModel().obs;
  final HomeAppController _homeAppController;
  final product = Product.fromProduct().obs;
  final indexTab = 0.obs;
  final DetailLeadProvider _detailLeadProvider;
  final ProgramLeadProvider _programLeadProvider;
  final ProductProvider _productProvider;
  final ProductLeadsProvider _productLeadsProvider;
  final idProgram = 0.obs;
  final programData = programEx.Data().obs;
  final statusResponse = 0.obs;
  final TextEditingController notedResponse = TextEditingController();
  DetailLeadController(
      this._detailLeadProvider,
      this._programLeadProvider,
      this._productProvider,
      this._productLeadsProvider,
      this._homeAppController);

  @override
  void onInit() {
    super.onInit();
    detailLead.value = Get.arguments['lead'];
    listColor.value = [LayoutHelper.primaryColor, Colors.grey, Colors.grey];
    loadProductLeads();
    fetchProgram();
    fetchProduct();
    programData.value = programEx.Data();
  }

  void fetchProgram() async {
    await _programLeadProvider.fetchProgram().then((value) {
      print("Fetch Program ${value.bodyString}");
      print(value.body.runtimeType);
      program.value = value.body;
    });
  }

  void fetchProduct() async {
    await _productProvider.allProduct().then((value) {
      print("Fetch Produk ${value.bodyString}");
      product.value = value.body;
    });
  }

  void changeValue(programEx.Data val) {
    programData.value = val;
    idProgram.value = int.parse(programData.value.id!);
  }

  void sendResponse(id) async {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return LoadingDialog();
        });
    await _productLeadsProvider.sendResponse(
        {"status": statusResponse.value, "alasan": notedResponse.text},
        id).then((value) async {
      Get.back();
      Get.back();
      _homeAppController.init();
      ApiResponse apiResponse = value.body;
      MessagerDialog.show(apiResponse);
      await _homeAppController.loadDashboard(id);
      loadProductLeads();
    });
  }

  void storeProductLeads() async {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return LoadingDialog();
        });
    await _productLeadsProvider.createProductLeads(
        {"id_program": idProgram.value}, detailLead.value.id).then((value) {
      Get.back();
      Get.back();
      loadProductLeads();
      ApiResponse apiResponse = value.body;
      MessagerDialog.show(apiResponse);
    });
  }

  void setStatusResponse(val) {
    this.statusResponse.value = val;
  }

  void loadProductLeads() async {
    await _detailLeadProvider
        .getProductLeads(0, detailLead.value.id)
        .then((value) {
      print(value.bodyString);
      productLeadsOffer.value = value.body;
    });

    await _detailLeadProvider
        .getProductLeads(2, detailLead.value.id)
        .then((value) {
      print(value.bodyString);
      productLeadsHistory.value = value.body;
    });

    await _detailLeadProvider
        .getProductLeads(1, detailLead.value.id)
        .then((value) {
      print(value.bodyString);
      productLeadsPortofolio.value = value.body;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}

class TabSelect {
  late final Color color;

  TabSelect(this.color);
}
