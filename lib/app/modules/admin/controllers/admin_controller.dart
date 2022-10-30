import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/admin/data/category_model.dart';
import 'package:monitoring_karyawan/app/modules/admin/data/program_model.dart';
import 'package:monitoring_karyawan/app/modules/admin/data/user_model.dart';
import 'package:monitoring_karyawan/app/modules/admin/provider/admin_provider.dart';
import 'package:monitoring_karyawan/app/modules/home_app/product_model.dart';
import 'package:monitoring_karyawan/app/modules/home_app/product_model.dart'
    as Prod;
import 'package:monitoring_karyawan/app/modules/home_app/providers/product_provider.dart';
import 'package:monitoring_karyawan/widget/messager_dialog.dart';

import '../../../../helper/api_response.dart';
import '../../../../widget/loading_dialog.dart';
import '../data/jabatan_model.dart';

class AdminController extends GetxController {
  final AdminProvider adminProvider;
  final ProductProvider productProvider;
  final count = 0.obs;
  final listCategory = [].obs;
  final Rx<Category> selectCategory = Category().obs;
  final selectJabatan = Jabatan().obs;
  final product = Product.fromProduct().obs;
  final listJabatan = [].obs;
  final prodData = Prod.Data.fromData().obs;
  final listUser = [].obs;
  final listProgram = [].obs;
  final isPickProduct = false.obs;
  final isPickJabatan = false.obs;
  final TextEditingController editingControllerProduct =
      TextEditingController();
  final TextEditingController editingControllerPersyaratan =
      TextEditingController();
  final TextEditingController editingControllerCategory =
      TextEditingController();
  final TextEditingController editingControllerJabatan =
      TextEditingController();
  AdminController(this.adminProvider, this.productProvider);

  List<TextEditingController> inputController =
      List.generate(5, (i) => TextEditingController());

  @override
  void onInit() {
    fetchCategory();
    fetchProduct();
    fetchProgram();
    fetchUser();
    fetchJabatan();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onSelectCategory(Category v) {
    this.selectCategory.value = v;
    update();
  }

  void onSelectJabatan(jabatan) {
    this.selectJabatan.value = jabatan;
    isPickJabatan.value = true;
  }

  void onSelectProduct(Prod.Data v) {
    this.prodData.value = v;
    isPickProduct.value = true;
    update();
  }

  void fetchJabatan() async {
    await this.adminProvider.fetchJabatan().then((value) {
      ApiResponse apiResponse = value.body;
      apiResponse.data.forEach((v) {
        Jabatan jabatan = Jabatan.fromJson(v);
        listJabatan.add(jabatan);
      });
    });
  }

  void fetchCategory() async {
    await this.adminProvider.getCategory().then((value) {
      print("FETCH CATEGORY ${value.bodyString}");
      ApiResponse apiResponse = value.body;
      apiResponse.data.forEach((v) {
        Category category = Category.fromJson(v);
        listCategory.add(category);
      });
    });
  }

  void fetchProduct() async {
    await this.productProvider.allProduct().then((value) {
      print(value.bodyString);
      product.value = value.body;
    });
  }

  void fetchProgram() async {
    await this.adminProvider.fetchProgram().then((value) {
      ApiResponse apiResponse = value.body;
      apiResponse.data.forEach((v) {
        Program program = Program.fromJson(v);
        listProgram.add(program);
      });
    });
  }

  void fetchUser() async {
    await this.adminProvider.fetchUser().then((value) {
      ApiResponse apiResponse = value.body;
      apiResponse.data.forEach((v) {
        User user = User.fromJson(v);
        listUser.add(user);
      });
    });
  }

  void storeJabatan() async {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return LoadingDialog();
        });
    await this
        .adminProvider
        .storeJabatan({"jabatan": editingControllerJabatan.text}).then((value) {
      Get.back();
      Get.back();
      Get.back();
      Get.back();
      print(value.bodyString);
      MessagerDialog.show(value.body);
      fetchJabatan();
    });
  }

  void storeUser() async {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return LoadingDialog();
        });
    await this.adminProvider.storeUser({
      "nik": this.inputController[0].text,
      "nama_karyawan": this.inputController[1].text,
      "email": this.inputController[2].text,
      "tgl_lahir": this.inputController[3].text,
      "id_jabatan": "1",
      "role": "0",
      "telepon": this.inputController[4].text
    }).then((value) {
      Get.back();
      Get.back();
      Get.back();
      Get.back();
      print(value.bodyString);
      MessagerDialog.show(value.body);
      fetchUser();
    });
  }

  void storeProgram() async {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return LoadingDialog();
        });
    await this.adminProvider.storeProgram({
      'program': "test",
      'id_product': this.prodData.value.id,
    }).then((value) {
      Get.back();
      Get.back();
      Get.back();
      Get.back();
      print(value.bodyString);
      MessagerDialog.show(value.body);
      fetchProgram();
    });
  }

  void storeCategory() async {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return LoadingDialog();
        });
    await this.adminProvider.storeCategory(
        {"category": this.editingControllerCategory.text}).then((value) {
      Get.back();
      Get.back();
      Get.back();
      Get.back();
      print(value.bodyString);
      MessagerDialog.show(value.body);
      fetchCategory();
    });
  }

  void storeProduct() async {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return LoadingDialog();
        });
    await this.adminProvider.storeProduct({
      'product': editingControllerProduct.text,
      'category': selectCategory.value.id,
      'persyaratan': editingControllerPersyaratan.text
    }).then((value) {
      Get.back();
      Get.back();
      Get.back();
      Get.back();
      print(value.bodyString);
      MessagerDialog.show(value.body);
      fetchProduct();
    });
  }
}
