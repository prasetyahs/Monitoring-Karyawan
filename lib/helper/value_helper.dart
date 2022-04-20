import 'package:flutter/material.dart';
import 'package:monitoring_karyawan/app/modules/home_app/views/menu/home_view.dart';

import 'package:monitoring_karyawan/app/modules/home_app/views/menu/leads_view.dart';
import 'package:monitoring_karyawan/app/modules/home_app/views/menu/product_view.dart';
import 'package:monitoring_karyawan/app/modules/home_app/views/menu/report_view.dart';
import 'package:monitoring_karyawan/app/modules/home_app/views/menu/user_view.dart';

class ValueHelper {
  static final PageController pageController = PageController(viewportFraction: 0.9);
  static final menuPage = [
    HomeView(pageController),
    LeadsView(),
    ProductView(),
    ReportView(),
    UserView()
  ];
}
