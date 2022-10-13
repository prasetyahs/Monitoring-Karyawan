import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/home_app/controllers/home_app_controller.dart';
import 'package:monitoring_karyawan/app/modules/home_app/leads_model.dart'
    as leads;
import 'package:monitoring_karyawan/app/modules/home_app/views/create_leads_view.dart';
import 'package:monitoring_karyawan/app/routes/app_pages.dart';
import 'package:monitoring_karyawan/helper/layout_helper.dart';
import 'package:monitoring_karyawan/widget/main_layout.dart';

class LeadsView extends GetView<HomeAppController> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      autoLeading: false,
      appbarColor: Colors.transparent,
      foregroundColor: Colors.white,
      scaffoldBackground: LayoutHelper.primaryColor,
      title: 'Leads',
      floatingButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return CreateLeadsView();
            }),
        child: Icon(CupertinoIcons.add),
        backgroundColor: Colors.amber,
      ),
      listAction: [
        IconButton(
            onPressed: () => showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1969, 1, 1),
                lastDate: DateTime.now()),
            icon: Icon(CupertinoIcons.calendar_today))
      ],
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: controller.leads.value.data != null
            ? ListView.builder(
                itemCount: controller.leads.value.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: LayoutHelper.spaceSizeBox),
                    child: GestureDetector(
                      onTap: () => Get.toNamed(Routes.DETAIL_LEAD, arguments: {
                        "lead": controller.leads.value.data![index]
                      }),
                      child: Obx(() => RowLeads(
                            controller: controller,
                            data: controller.leads.value.data![index],
                          )),
                    ),
                  );
                })
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class RowLeads extends StatelessWidget {
  RowLeads({Key? key, required this.controller, required this.data})
      : super(key: key);
  final HomeAppController controller;
  final leads.Data data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: LayoutHelper.spaceHorizontal),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: LayoutHelper.spaceHorizontal,
            vertical: LayoutHelper.spaceVertical),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  offset: Offset(0, 0),
                  blurRadius: 5,
                  spreadRadius: 1)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${data.namaCustomer}",
                      style: TextStyle(fontSize: LayoutHelper.fontMedium),
                    ),
                    SizedBox(
                      height: LayoutHelper.spaceSizeBox,
                    ),
                    Text("${data.email}",
                        style: TextStyle(
                          fontSize: LayoutHelper.fontSmall,
                          color: Colors.grey[600],
                        )),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () => controller.intentExplicit(
                            Uri(scheme: "tel", path: "${data.telepon}")),
                        child: Icon(
                          CupertinoIcons.phone_fill,
                          color: LayoutHelper.primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: LayoutHelper.spaceHorizontal,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () => controller.intentExplicit(Uri(
                            scheme: "sms",
                            path: "${data.telepon}",
                            query: "body=hello")),
                        child: Icon(
                          Icons.message,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: LayoutHelper.spaceVertical,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 15.h,
                      color: Colors.grey[600],
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "${data.telepon}",
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    )
                  ],
                ),
                Text("${data.telepon}",
                    style: TextStyle(
                      fontSize: LayoutHelper.fontSmall,
                      color: Colors.grey[600],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
