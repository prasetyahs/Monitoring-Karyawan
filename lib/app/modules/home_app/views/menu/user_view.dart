import 'package:flutter/material.dart';

import 'package:get/get.dart';

class UserView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'UserView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
