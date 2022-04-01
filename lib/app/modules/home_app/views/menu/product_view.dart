import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProductView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'ProductView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
