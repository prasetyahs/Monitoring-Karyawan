import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/home_app/controllers/home_app_controller.dart';
import 'package:monitoring_karyawan/app/modules/home_app/views/menu/leads_view.dart';
import 'package:monitoring_karyawan/helper/layout_helper.dart';
import 'package:monitoring_karyawan/widget/main_layout.dart';
import 'package:intl/intl.dart';

import '../../../../../widget/not_found.dart';

class ReportView extends GetView<HomeAppController> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appbarColor: LayoutHelper.primaryColor,
      autoLeading: false,
      foregroundColor: Colors.white,
      scaffoldBackground: Colors.white,
      title: 'Report',
      listAction: [
        IconButton(
            onPressed: () => showDateRangePicker(
                        context: context,
                        firstDate: DateTime(1999),
                        lastDate: DateTime.now())
                    .then((value) {
                  controller.loadReportLeads(
                      startDate: DateFormat('yyyy-MM-dd').format(value!.start),
                      endDate: DateFormat('yyyy-MM-dd').format(value.end));
                      Get.back();
                }),
            icon: Icon(CupertinoIcons.calendar_today))
      ],
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Obx(() {
            if (!controller.loadSuccess()) {
              return Center(child: CircularProgressIndicator());
            }
            if (controller.leads.value.data!.length == 0) {
              return Center(
                child: NotFound(),
              );
            }
            return ListView.builder(
                itemCount: controller.reportLeads.value.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: LayoutHelper.spaceSizeBox),
                    child: RowLeads(
                      controller: controller,
                      data: controller.leads.value.data![index],
                    ),
                  );
                });
          })),
    );
  }
}
