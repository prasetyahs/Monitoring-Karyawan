import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/admin/data/category_model.dart';
import 'package:monitoring_karyawan/app/modules/admin/data/jabatan_model.dart';
import 'package:monitoring_karyawan/app/modules/admin/data/program_model.dart';
import 'package:monitoring_karyawan/app/modules/admin/data/user_model.dart';
import 'package:monitoring_karyawan/app/modules/home_app/product_model.dart'
    as Prod;
import 'package:monitoring_karyawan/widget/monitoring_textfield.dart';

import '../../../../helper/layout_helper.dart';
import '../../../../widget/main_layout.dart';
import '../../../routes/app_pages.dart';
import '../../home_app/product_model.dart';
import '../../home_app/views/menu/product_view.dart';
import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   "Welcome Admin Dashboard",
              //   style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800),
              // ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Data Produk",
                style: TextStyle(
                    fontSize: LayoutHelper.fontMedium,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MenuItem("Produk", "assets/anim/product.svg", () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Close'),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ],
                            content: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton.icon(
                                      onPressed: () => showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              actions: [
                                                TextButton(
                                                    onPressed: () => Get.back(),
                                                    child: Text("Close")),
                                                TextButton(
                                                    onPressed: () => controller
                                                        .storeProduct(),
                                                    child: Text("Save")),
                                              ],
                                              title: Text("Tambah Produk"),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  MonitoringTextField(
                                                      labelText: "Nama Produk",
                                                      icon: Icons
                                                          .production_quantity_limits,
                                                      isObsecure: false,
                                                      controller: controller
                                                          .editingControllerProduct),
                                                  // MonitoringTextField(
                                                  //     labelText:
                                                  //         "Kategori Produk",
                                                  //     icon: Icons.category,
                                                  //     isObsecure: false,
                                                  //     controller:
                                                  //         TextEditingController()),

                                                  // DropdownButton<Category>(
                                                  //     items: controller
                                                  //         .listCategory
                                                  //         .map((element) =>
                                                  //             DropdownMenuItem(
                                                  //                 child: child))
                                                  //         .toList(),
                                                  //     onChanged: (v) {})
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Obx(() => DropdownButton<Category>(
                                                        icon: const Icon(Icons
                                                            .arrow_drop_down),
                                                        isExpanded: true,
                                                        elevation: 16,
                                                        hint: Text(
                                                            "Pilih Kategori"),
                                                        underline: Container(
                                                            height: 1.0,
                                                            color: Colors
                                                                .grey[500]),
                                                        value: controller
                                                                    .selectCategory
                                                                    .value
                                                                    .category !=
                                                                null
                                                            ? controller
                                                                .selectCategory
                                                                .value
                                                            : null,
                                                        items: controller
                                                            .listCategory
                                                            .map((element) =>
                                                                DropdownMenuItem<Category>(value: element, child: Text(element.category!)))
                                                            .toList(),
                                                        onChanged: (v) => controller.onSelectCategory(v!))),
                                                  ),
                                                  MonitoringTextField(
                                                      labelText: "Persyaratan",
                                                      icon: Icons.description,
                                                      maxLine: 5,
                                                      isObsecure: false,
                                                      controller: controller
                                                          .editingControllerPersyaratan)
                                                ],
                                              ),
                                            );
                                          }),
                                      icon: Icon(Icons.add),
                                      label: Text("Tambah")),
                                  ElevatedButton.icon(
                                      onPressed: () => showDialog(
                                          context: context,
                                          builder: (context) => MainLayout(
                                                body:
                                                    GetBuilder<AdminController>(
                                                        builder: (controller) {
                                                  return controller.product
                                                          .value.data.isNotEmpty
                                                      ? ListView.builder(
                                                          itemCount: controller
                                                              .product
                                                              .value
                                                              .data
                                                              .length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int i) {
                                                            return RowProduct(
                                                              index: i,
                                                              callback: () =>
                                                                  showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) =>
                                                                              AlertDialog(
                                                                                title: Text("Persyaratan"),
                                                                                content: Text(this.controller.product.value.data[i].persyaratan),
                                                                              )),
                                                              product: this
                                                                  .controller
                                                                  .product
                                                                  .value,
                                                            );
                                                          },
                                                        )
                                                      : Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        );
                                                }),
                                                appbarColor:
                                                    LayoutHelper.primaryColor,
                                                autoLeading: true,
                                                foregroundColor: Colors.white,
                                                scaffoldBackground:
                                                    Colors.white,
                                                title: 'Data Produk',
                                              )),
                                      icon: Icon(Icons.list),
                                      label: Text("Lihat")),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }),
                  MenuItem(
                      "Program",
                      "assets/anim/program.svg",
                      () => showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              actions: [
                                TextButton(
                                    onPressed: () => Get.back(),
                                    child: Text("Close")),
                              ],
                              content: Row(
                                children: [
                                  ElevatedButton.icon(
                                      onPressed: () => showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              actions: [
                                                TextButton(
                                                    onPressed: () => Get.back(),
                                                    child: Text("Close")),
                                                TextButton(
                                                    onPressed: () => controller
                                                        .storeProgram(),
                                                    child: Text("Save")),
                                              ],
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  MonitoringTextField(
                                                      labelText: "Nama Program",
                                                      icon: Icons.category,
                                                      isObsecure: false,
                                                      controller:
                                                          TextEditingController()),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: Obx(() => DropdownButton<Prod.Data>(
                                                          icon: const Icon(Icons
                                                              .arrow_drop_down),
                                                          isExpanded: true,
                                                          elevation: 16,
                                                          hint: Text(
                                                              "Pilih Produk"),
                                                          underline: Container(
                                                              height: 1.0,
                                                              color: Colors
                                                                  .grey[500]),
                                                          value: this
                                                                  .controller
                                                                  .isPickProduct
                                                                  .value
                                                              ? this
                                                                  .controller
                                                                  .prodData
                                                                  .value
                                                              : null,
                                                          items: controller
                                                              .product
                                                              .value
                                                              .data
                                                              .map(
                                                                  (element) => DropdownMenuItem<Prod.Data>(value: element, child: Text(element.product)))
                                                              .toList(),
                                                          onChanged: (v) => controller.onSelectProduct(v!)))),
                                                ],
                                              ),
                                            );
                                          }),
                                      icon: Icon(Icons.add),
                                      label: Text("Tambah")),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  ElevatedButton.icon(
                                      onPressed: () => showDialog(
                                          context: context,
                                          builder: (context) => MainLayout(
                                                body:
                                                    GetBuilder<AdminController>(
                                                  builder: (controller) {
                                                    return ListView.builder(
                                                        itemCount: controller
                                                            .listProgram.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          Program program =
                                                              controller
                                                                  .listProgram
                                                                  .value[index];
                                                          return Container(
                                                            child: Column(
                                                                children: [
                                                                  ListTile(
                                                                    title: Text(
                                                                        program
                                                                            .program!),
                                                                    subtitle: Text(
                                                                        program
                                                                            .product!),
                                                                  )
                                                                ]),
                                                          );
                                                        });
                                                  },
                                                ),
                                                // GetBuilder<AdminController>(
                                                //     builder: (controller) {
                                                // return controller.listProgram
                                                // return controller.product
                                                //         .value.data.isNotEmpty
                                                //     ? ListView.builder(
                                                //         itemCount: controller
                                                //             .product
                                                //             .value
                                                //             .data
                                                //             .length,
                                                //         itemBuilder:
                                                //             (BuildContext
                                                //                     context,
                                                //                 int i) {
                                                //           return RowProduct(
                                                //             index: i,
                                                //             callback: () =>
                                                //                 showDialog(
                                                //                     context:
                                                //                         context,
                                                //                     builder:
                                                //                         (context) =>
                                                //                             AlertDialog(
                                                //                               title: Text("Persyaratan"),
                                                //                               content: Text(this.controller.product.value.data[i].persyaratan),
                                                //                             )),
                                                //             product: this
                                                //                 .controller
                                                //                 .product
                                                //                 .value,
                                                //           );
                                                //         },
                                                //       )
                                                //     : Center(
                                                //         child:
                                                //             CircularProgressIndicator(),
                                                //       );
                                                // }),
                                                appbarColor:
                                                    LayoutHelper.primaryColor,
                                                autoLeading: true,
                                                foregroundColor: Colors.white,
                                                scaffoldBackground:
                                                    Colors.white,
                                                title: 'Data Program',
                                              )),
                                      icon: Icon(Icons.list),
                                      label: Text("List"))
                                ],
                              ),
                            );
                          })),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  MenuItem(
                      "Kategori Produk",
                      "assets/anim/product.svg",
                      () => showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              actions: [
                                TextButton(
                                  child: const Text('Close'),
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                              ],
                              content: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton.icon(
                                    icon: Icon(Icons.add),
                                    label: Text("Tambah"),
                                    onPressed: () => showDialog(
                                        context: context,
                                        builder: (ctx) {
                                          return AlertDialog(
                                            actions: [
                                              TextButton(
                                                child: const Text('Close'),
                                                onPressed: () {
                                                  Get.back();
                                                },
                                              ),
                                              TextButton(
                                                child: const Text('Save'),
                                                onPressed: () => this
                                                    .controller
                                                    .storeCategory(),
                                              ),
                                            ],
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                MonitoringTextField(
                                                    labelText: "Nama Kategori",
                                                    icon: Icons
                                                        .production_quantity_limits,
                                                    isObsecure: false,
                                                    controller: controller
                                                        .editingControllerCategory),
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                                  ElevatedButton.icon(
                                      icon: Icon(Icons.list),
                                      label: Text("Lihat"),
                                      onPressed: () => showDialog(
                                          context: context,
                                          builder: (ctx) {
                                            return MainLayout(
                                                body:
                                                    GetBuilder<AdminController>(
                                                        builder: (controller) {
                                                  return ListView.builder(
                                                      itemCount: this
                                                          .controller
                                                          .listCategory
                                                          .length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        Category category =
                                                            controller
                                                                .listCategory
                                                                .value[index];
                                                        return ListTile(
                                                          title: Text(category
                                                              .category!),
                                                        );
                                                      });
                                                }),
                                                title: "Data Kategori",
                                                appbarColor:
                                                    LayoutHelper.primaryColor,
                                                scaffoldBackground:
                                                    Colors.white,
                                                foregroundColor: Colors.white,
                                                autoLeading: true);
                                          })),
                                ],
                              ),
                            );
                          }))
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Data Pegawai",
                style: TextStyle(
                    fontSize: LayoutHelper.fontMedium,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  MenuItem("Pegawai", "assets/anim/person.svg", () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            actions: [
                              TextButton(
                                  onPressed: () => Get.back(),
                                  child: Text("close"))
                            ],
                            content: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton.icon(
                                    onPressed: () => showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            actions: [
                                              TextButton(
                                                  onPressed: () => Get.back(),
                                                  child: Text("Close")),
                                              TextButton(
                                                  onPressed: () =>
                                                      controller.storeUser(),
                                                  child: Text("Save")),
                                            ],
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                MonitoringTextField(
                                                    labelText: "Nik",
                                                    icon: Icons.numbers,
                                                    isObsecure: false,
                                                    controller: controller
                                                        .inputController[0]),
                                                MonitoringTextField(
                                                    labelText: "Nama Karyawan",
                                                    icon: Icons.person,
                                                    isObsecure: false,
                                                    controller: controller
                                                        .inputController[1]),
                                                MonitoringTextField(
                                                    labelText: "Email",
                                                    icon: Icons.email,
                                                    isObsecure: false,
                                                    controller: controller
                                                        .inputController[2]),
                                                MonitoringTextField(
                                                    textFieldTap: () => showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime(1999),
                                                            lastDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(1700))
                                                        .then((value) => this
                                                                .controller
                                                                .inputController[3]
                                                                .text =
                                                            value
                                                                .toString()
                                                                .split(" ")[0]),
                                                    controller: controller
                                                        .inputController[3],
                                                    readOnly: true,
                                                    labelText: "Tanggal Lahir",
                                                    icon: Icons
                                                        .date_range_rounded,
                                                    isObsecure: false),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                DropdownButton<int>(
                                                    icon: const Icon(
                                                        Icons.arrow_drop_down),
                                                    isExpanded: true,
                                                    elevation: 16,
                                                    hint: Text("Pilih Role"),
                                                    style: const TextStyle(
                                                        color:
                                                            Colors.deepPurple),
                                                    underline: Container(
                                                        height: 1.0,
                                                        color:
                                                            Colors.grey[500]),
                                                    onChanged: (val) {},
                                                    value: null,
                                                    items: [
                                                      DropdownMenuItem(
                                                          value: 1,
                                                          child: Text("Admin")),
                                                      DropdownMenuItem(
                                                          value: 0,
                                                          child: Text("Sales")),
                                                    ]),
                                                // DropdownButton(items: , onChanged: onChanged),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Obx(() => DropdownButton(
                                                    isExpanded: true,
                                                    elevation: 16,
                                                    style: const TextStyle(
                                                        color:
                                                            Colors.deepPurple),
                                                    underline: Container(
                                                        height: 1.0,
                                                        color:
                                                            Colors.grey[500]),
                                                    hint: Text("Pilih Jabatan"),
                                                    value: this
                                                            .controller
                                                            .isPickJabatan
                                                            .value
                                                        ? this
                                                            .controller
                                                            .selectJabatan
                                                        : null,
                                                    items: controller
                                                        .listJabatan
                                                        .map((e) =>
                                                            DropdownMenuItem(
                                                                value: e.id,
                                                                child: Text(
                                                                    e.jabatan)))
                                                        .toList(),
                                                    onChanged: (v) => this
                                                        .controller
                                                        .onSelectJabatan(v!))),
                                                MonitoringTextField(
                                                    labelText: "Telepon",
                                                    icon: Icons.phone,
                                                    isObsecure: false,
                                                    controller: controller
                                                        .inputController[4]),
                                              ],
                                            ),
                                          );
                                        }),
                                    icon: Icon(Icons.add),
                                    label: Text("Tambah")),
                                ElevatedButton.icon(
                                    onPressed: () => showDialog(
                                        context: context,
                                        builder: (c) {
                                          return MainLayout(
                                              body: GetBuilder<AdminController>(
                                                  builder: (ctx) {
                                                return ListView.builder(
                                                    itemCount: controller
                                                        .listUser.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      User user = this
                                                          .controller
                                                          .listUser[index];
                                                      return ListTile(
                                                        title: Text(
                                                            user.namaKaryawan!),
                                                        subtitle:
                                                            Text(user.jabatan!),
                                                      );
                                                    });
                                              }),
                                              title: "Data User",
                                              appbarColor:
                                                  LayoutHelper.primaryColor,
                                              scaffoldBackground: Colors.white,
                                              foregroundColor: Colors.white,
                                              autoLeading: true);
                                        }),
                                    icon: Icon(Icons.list),
                                    label: Text("Lihat")),
                              ],
                            ),
                          );
                        });
                  }),
                  MenuItem("Jabatan", "assets/anim/jabatan.svg", () {
                    showDialog(
                        context: context,
                        builder: (c) {
                          return AlertDialog(
                              actions: [
                                TextButton(
                                    onPressed: () => Get.back(),
                                    child: Text("Close"))
                              ],
                              content: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ElevatedButton.icon(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (ctx) {
                                              return AlertDialog(
                                                actions: [
                                                  TextButton(
                                                      onPressed: () =>
                                                          Get.back(),
                                                      child: Text("close")),
                                                  TextButton(
                                                      onPressed: () => this
                                                          .controller
                                                          .storeJabatan(),
                                                      child: Text("Save"))
                                                ],
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    MonitoringTextField(
                                                        labelText:
                                                            "Nama Jabatan",
                                                        icon: Icons.near_me,
                                                        isObsecure: false,
                                                        controller: this
                                                            .controller
                                                            .editingControllerJabatan)
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                      icon: Icon(Icons.add),
                                      label: Text("Tambah")),
                                  ElevatedButton.icon(
                                      onPressed: () => showDialog(
                                          context: context,
                                          builder: (ctx) {
                                            return MainLayout(
                                                body:
                                                    GetBuilder<AdminController>(
                                                  builder: (ctx) {
                                                    return ListView.builder(
                                                        itemCount: this
                                                            .controller
                                                            .listJabatan
                                                            .length,
                                                        itemBuilder:
                                                            (ctx, index) {
                                                          Jabatan jabatan = this
                                                                  .controller
                                                                  .listJabatan[
                                                              index];
                                                          return ListTile(
                                                            title: Text(jabatan
                                                                .jabatan!),
                                                            subtitle: Text(
                                                                jabatan
                                                                    .singkatan!),
                                                          );
                                                        });
                                                  },
                                                ),
                                                title: "Data Jabatan",
                                                appbarColor:
                                                    LayoutHelper.primaryColor,
                                                scaffoldBackground:
                                                    Colors.white,
                                                foregroundColor: Colors.white,
                                                autoLeading: true);
                                          }),
                                      icon: Icon(Icons.list),
                                      label: Text("Lihat")),
                                ],
                              ));
                        });
                  }),
                ],
              )
            ],
          ),
        ),
        centerTitle: true,
        title: "Home Admin",
        appbarColor: LayoutHelper.primaryColor,
        scaffoldBackground: Colors.white,
        foregroundColor: Colors.white,
        autoLeading: false);
  }
}

class MenuItem extends GetView {
  final String title, icon;
  final callback;
  MenuItem(this.title, this.icon, this.callback);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        width: MediaQuery.of(context).size.width / 2 - 25.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: 60.w,
              height: 60.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: LayoutHelper.fontMedium,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  offset: Offset(0.5, 1),
                  blurRadius: 2.0)
            ]),
      ),
    );
  }
}
