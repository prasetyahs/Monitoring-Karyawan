import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';
import 'package:monitoring_karyawan/helper/layout_helper.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeView extends GetView {
  final PageController pageController;

  HomeView(this.pageController);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(pageController: pageController),
        SizedBox(
          height: LayoutHelper.spaceVertical,
        ),
        Body()
      ],
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

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
          ResponseProduct()
        ],
      ),
    );
  }
}

class ResponseProduct extends StatelessWidget {
  const ResponseProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Berminat', 50, Colors.amber),
      ChartData('Menolak', 34, Colors.blueGrey),
      ChartData('Follow Up', 38, Colors.blue),
    ];
    return Container(
        child: SfCircularChart(series: <CircularSeries>[
      PieSeries<ChartData, String>(
          dataSource: chartData,
          enableTooltip: true,
          strokeColor: Colors.white,
          strokeWidth: 5.w,
          dataLabelSettings: DataLabelSettings(
              labelIntersectAction: LabelIntersectAction.none,
              labelPosition: ChartDataLabelPosition.outside,
              connectorLineSettings: ConnectorLineSettings(
                  type: ConnectorType.curve, length: '10%'),
              isVisible: true),
          dataLabelMapper: (ChartData data, _) =>
              data.x + "\n" + data.y.toString() + "%",
          pointColorMapper: (ChartData data, _) => data.color,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y),
    ]));
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final int y;
  final Color color;
}

class StatusCustomerLead extends StatelessWidget {
  const StatusCustomerLead({Key? key, required this.pageController})
      : super(key: key);
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: 2,
        padEnds: false,
        controller: pageController,
        itemBuilder: (context, index) {
          return CardCustomerLead(
              margin: index == 0
                  ? EdgeInsets.only(
                      left: LayoutHelper.spaceHorizontal,
                      right: LayoutHelper.spaceSizeBoxHorizontal)
                  : EdgeInsets.only(right: LayoutHelper.spaceHorizontal));
        });
  }
}

class CardCustomerLead extends StatelessWidget {
  const CardCustomerLead({Key? key, required this.margin}) : super(key: key);
  final EdgeInsets margin;
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
            "Sudah Kontak",
            style: TextStyle(
                fontSize: LayoutHelper.fontMedium, letterSpacing: 0.5),
          ),
          Text(
            "50%",
            style: TextStyle(
                color: Colors.black,
                fontSize: LayoutHelper.fontMedium,
                fontWeight: FontWeight.w600),
          ),
          LinearProgressIndicator(
            value: 0.5,
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
  const Header({Key? key, required this.pageController}) : super(key: key);
  final PageController pageController;

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
                      style: TextStyle(
                          fontSize: LayoutHelper.fontSmall,
                          color: LayoutHelper.greyColor),
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
                    Text("5000",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: LayoutHelper.fontLarge))
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
                    Text(
                      "Rp. 5.000",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: LayoutHelper.fontLarge),
                    )
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
              child: StatusCustomerLead(pageController: pageController))
        ],
      ),
    );
  }
}
