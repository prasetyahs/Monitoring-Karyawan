import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MainLayout extends StatelessWidget {
  const MainLayout({ Key? key, required this.body, required this.title, required this.appbarColor, required this.scaffoldBackground, this.centerTitle, required this.foregroundColor }) : super(key: key);
  final Widget body;
  final String title;
  final Color appbarColor,scaffoldBackground,foregroundColor;
  final centerTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
        title: Text(title.toUpperCase(),style: TextStyle(fontSize: 14.sp,letterSpacing: 0.5.w),),
        backgroundColor: appbarColor,
        foregroundColor: foregroundColor,
        elevation: 0.0,
        centerTitle: centerTitle,
      ),
    );
  }
}