import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/home_app/chart_model.dart';
import 'package:monitoring_karyawan/app/modules/home_app/controllers/home_app_controller.dart';
import 'package:monitoring_karyawan/helper/layout_helper.dart';
import 'package:pie_chart/pie_chart.dart';

class HomeView extends GetView<HomeAppController> {
  final PageController pageController;

  HomeView(this.pageController);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(
          pageController: pageController,
          homeAppController: controller,
        ),
        SizedBox(
          height: LayoutHelper.spaceVertical,
        ),
        Body(
          homeAppController: controller,
        )
      ],
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key, required this.homeAppController}) : super(key: key);
  final HomeAppController homeAppController;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: LayoutHelper.spaceHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Response By Product",
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: LayoutHelper.fontMedium,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: LayoutHelper.spaceSizeBox,
          ),
          ResponseProduct(
            homeAppController: homeAppController,
          )
        ],
      ),
    );
  }
}

class ResponseProduct extends StatelessWidget {
  const ResponseProduct({Key? key, required this.homeAppController})
      : super(key: key);
  final HomeAppController homeAppController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: GetBuilder<HomeAppController>(
          builder: (controller) => controller.dataChart.isNotEmpty
              ? PieChart(
                  dataMap: controller.dataChart,
                  animationDuration: Duration(milliseconds: 800),
                  chartLegendSpacing: 32,
                  chartRadius: MediaQuery.of(context).size.width / 3.2,
                  colorList: [Colors.blue, Colors.redAccent, Colors.blueGrey],
                  initialAngleInDegree: 0,
                  chartType: ChartType.ring,
                  ringStrokeWidth: 32,
                  centerText: "Response",
                  legendOptions: LegendOptions(
                    showLegendsInRow: false,
                    legendPosition: LegendPosition.right,
                    showLegends: true,
                    legendShape: BoxShape.circle,
                    legendTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  chartValuesOptions: ChartValuesOptions(
                    showChartValueBackground: true,
                    showChartValues: true,
                    showChartValuesInPercentage: false,
                    showChartValuesOutside: false,
                    decimalPlaces: 1,
                  ),
                  // gradientList: ---To add gradient colors---
                  // emptyColorGradient: ---Empty Color gradient---
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
    );
    // return Center(
    //     child: SfCircularChart(series: <CircularSeries>[
    //   PieSeries<ChartData, String>(
    //       dataSource: homeAppController.chartData,
    //       enableTooltip: true,
    //       strokeColor: Colors.white,
    //       strokeWidth: 5.w,
    //       dataLabelSettings: DataLabelSettings(
    //           labelIntersectAction: LabelIntersectAction.none,
    //           labelPosition: ChartDataLabelPosition.outside,
    //           // connectorLineSettings: ConnectorLineSettings(
    //           //     type: ConnectorType.curve, length: ''),
    //           isVisible: true),
    //       dataLabelMapper: (ChartData data, _) =>
    //           data.x + "\n" + data.y.toString() + "%",
    //       pointColorMapper: (ChartData data, _) => data.color,
    //       xValueMapper: (ChartData data, _) => data.x,
    //       yValueMapper: (ChartData data, _) => data.y),
    // ]));
  }
}

class StatusCustomerLead extends StatelessWidget {
  const StatusCustomerLead(
      {Key? key, required this.pageController, required this.homeAppController})
      : super(key: key);
  final PageController pageController;
  final HomeAppController homeAppController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      padEnds: false,
      controller: pageController,
      children: [
        CardCustomerLead(
          margin: EdgeInsets.only(
              left: LayoutHelper.spaceHorizontal,
              right: LayoutHelper.spaceSizeBoxHorizontal),
          title: homeAppController.titleCard[0],
          homeAppController: homeAppController,
        ),
        CardCustomerLead(
          margin: EdgeInsets.only(right: LayoutHelper.spaceHorizontal),
          title: homeAppController.titleCard[1],
          homeAppController: homeAppController,
        )
      ],
    );
  }
}

class CardCustomerLead extends StatelessWidget {
  const CardCustomerLead({
    Key? key,
    required this.margin,
    required this.homeAppController,
    required this.title,
  }) : super(key: key);
  final EdgeInsets margin;
  final String title;
  final HomeAppController homeAppController;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: LayoutHelper.spaceVertical,
          horizontal: LayoutHelper.spaceHorizontal),
      width: MediaQuery.of(context).size.width,
      height: 50.h,
      margin: margin,
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/component/card-bg.png"),
              fit: BoxFit.cover),
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
          Text(
            title,
            style: TextStyle(
                fontSize: LayoutHelper.fontMedium, letterSpacing: 0.5),
          ),
          Obx(
            () => Text(
              homeAppController.loadSuccess()
                  ? homeAppController.dashboard.value.data.alreadyContact
                      .toString()
                  : "",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: LayoutHelper.fontMedium,
                  fontWeight: FontWeight.w600),
            ),
          ),
          LinearProgressIndicator(
            value: homeAppController.loadSuccess()
                ? int.parse(homeAppController
                        .dashboard.value.data.alreadyContactPercent
                        .toString()) /
                    100
                : 0,
            valueColor:
                AlwaysStoppedAnimation<Color>(LayoutHelper.primaryColor),
            backgroundColor: Colors.grey[300],
          )
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header(
      {Key? key, required this.pageController, required this.homeAppController})
      : super(key: key);
  final PageController pageController;
  final HomeAppController homeAppController;
  @override
  Widget build(BuildContext context) {
    final dateNow = DateTime.now();
    return Container(
      decoration: BoxDecoration(
          color: LayoutHelper.primaryColor,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10))),
      padding: EdgeInsets.symmetric(vertical: LayoutHelper.spaceVertical),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: LayoutHelper.spaceHorizontal,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dashboard",
                      style: TextStyle(fontSize: 20.sp, color: Colors.white),
                    ),
                    SizedBox(
                      height: LayoutHelper.spaceSizeBox,
                    ),
                    Text(
                      DateFormat("EEEE, MMMM yyyy").format(dateNow),
                      style: TextStyle(fontSize: 12.sp, color: Colors.white),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 10.h),
                              actions: [
                                TextButton(
                                    onPressed: () => Get.back(),
                                    child: Text("Close"))
                              ],
                              content:
                                  Image.asset("assets/component/example.jpeg"));
                        });
                  },
                  child: Container(
                    width: 45.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/component/example.jpeg"),
                            fit: BoxFit.cover),
                        shape: BoxShape.circle,
                        color: Colors.amber),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: LayoutHelper.spaceSizeBox,
          ),
          Divider(
            color: Colors.white,
            thickness: 0.3.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: LayoutHelper.spaceHorizontal,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Point Of Sales",
                      style: TextStyle(
                          fontSize: LayoutHelper.fontSmall,
                          color: LayoutHelper.greyColor),
                    ),
                    SizedBox(
                      height: LayoutHelper.spaceSizeBox,
                    ),
                    Obx(() => Text(
                        homeAppController.loadSuccess()
                            ? homeAppController
                                .dashboard.value.data.pointOfSales
                                .toString()
                            : "",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: LayoutHelper.fontLarge)))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Estimasi Intentif",
                      style: TextStyle(
                          fontSize: LayoutHelper.fontSmall,
                          color: LayoutHelper.greyColor),
                    ),
                    SizedBox(
                      height: LayoutHelper.spaceSizeBox,
                    ),
                    Obx(() => Text(
                          homeAppController.loadSuccess()
                              ? "Rp. ${homeAppController.dashboard.value.data.insentif.toString()}"
                              : "",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: LayoutHelper.fontLarge),
                        ))
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: LayoutHelper.spaceVertical,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 100.h,
              child: StatusCustomerLead(
                pageController: pageController,
                homeAppController: homeAppController,
              ))
        ],
      ),
    );
  }
}
