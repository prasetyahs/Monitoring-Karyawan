import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/home_app/controllers/home_app_controller.dart';
import 'package:monitoring_karyawan/app/modules/home_app/views/menu/leads_view.dart';
import 'package:monitoring_karyawan/helper/layout_helper.dart';
import 'package:monitoring_karyawan/widget/main_layout.dart';

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
                  lastDate: DateTime.now()),
              icon: Icon(CupertinoIcons.calendar_today))
        ],
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
                padding:
                    EdgeInsets.symmetric(vertical: LayoutHelper.spaceSizeBox),
                child: RowLeads(
                    controller: controller,
                    data: controller.leads.value.data![index]));
          },
          itemCount: controller.leads.value.data!.length,
        ));
  }
}
