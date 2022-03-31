import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppController extends GetxController {

  final PageController pageController = PageController(viewportFraction: 0.9);

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
