import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:monitoring_karyawan/helper/layout_helper.dart';

import '../controllers/home_app_controller.dart';

class HomeAppView extends GetView<HomeAppController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 5.0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: LayoutHelper.primaryColor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.house,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.folder_fill_badge_person_crop,
              ),
              label: "Leads"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.badge,
              ),
              label: "Product"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.report,
              ),
              label: "Report"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "User"),
        ],
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Header(
                pageController: controller.pageController,
              ),
            ],
          ),
        ),
      ),
    );
  }
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
      width: MediaQuery.of(context).size.width,
      height: 50.h,
      margin: margin,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key, required this.pageController}) : super(key: key);
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: LayoutHelper.primaryColor,
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
                      "Kamis, 31 Maret 2021",
                      style: TextStyle(
                          fontSize: LayoutHelper.fontSmall,
                          color: LayoutHelper.greyColor),
                    ),
                  ],
                ),
                Container(
                  width: 45.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.amber),
                )
              ],
            ),
          ),
          SizedBox(
            height: LayoutHelper.spaceVertical,
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
                    Text(
                      "5000",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: LayoutHelper.fontMedium),
                    )
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
                          fontSize: LayoutHelper.fontMedium),
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
