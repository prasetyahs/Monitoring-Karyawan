import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/detail_lead/leads_product_model.dart';
import 'package:monitoring_karyawan/app/modules/detail_lead/program_model.dart';
import 'package:monitoring_karyawan/app/modules/detail_lead/provider/detail_lead_provider.dart';
import 'package:monitoring_karyawan/app/modules/detail_lead/provider/product_leads_provider.dart';
import 'package:monitoring_karyawan/app/modules/detail_lead/provider/program_lead_provider.dart';
import 'package:monitoring_karyawan/app/modules/home_app/product_model.dart';
import 'package:monitoring_karyawan/app/modules/home_app/providers/product_provider.dart';
// import 'package:monitoring_karyawan/app/modules/detail_lead/leads_product_model.dart';
import 'package:monitoring_karyawan/helper/layout_helper.dart';

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
  final program = ProgramModel.fromProgramModel().obs;
  final product = Product.fromProduct().obs;
  final indexTab = 0.obs;
  final DetailLeadProvider _detailLeadProvider;
  final ProgramLeadProvider _programLeadProvider;
  final ProductProvider _productProvider;
  final ProductLeadsProvider _productLeadsProvider;
  final idProgram = 0.obs;
  DetailLeadController(this._detailLeadProvider, this._programLeadProvider,
      this._productProvider, this._productLeadsProvider);

  @override
  void onInit() {
    super.onInit();
    detailLead.value = Get.arguments['lead'];
    listColor.value = [LayoutHelper.primaryColor, Colors.grey, Colors.grey];
    loadProductLeads();
    fetchProgram();
    fetchProduct();
  }

  void fetchProductLeads() async {
    await _productLeadsProvider
        .createProductLeads({"program": idProgram}, detailLead.value.id);
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

  void changeValue(val){
    
  }

  void storeProductLeads() async {
    await _detailLeadProvider.createProductLeads(
        {"id_program": idProgram}, detailLead.value.id).then((value) => null);
  }

  void loadProductLeads() async {
    await _detailLeadProvider
        .getProductLeads(0, detailLead.value.id)
        .then((value) {
      print(value.bodyString);
      productLeadsOffer.value = value.body;
    });

    await _detailLeadProvider
        .getProductLeads(1, detailLead.value.id)
        .then((value) {
      print(value.bodyString);
      productLeadsHistory.value = value.body;
    });

    await _detailLeadProvider
        .getProductLeads(3, detailLead.value.id)
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
