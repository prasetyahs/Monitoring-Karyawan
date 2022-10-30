import 'dart:convert';
import 'package:monitoring_karyawan/app/modules/login/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  // ignore: prefer_typing_uninitialized_variables

  static Future<bool> writePrefs(LoginModel data) async {
    var prefs = await SharedPreferences.getInstance();
    bool result = await prefs.setString('user', jsonEncode(data));
    return result;
  }

  static Future<void> removePrefs() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static Future<LoginModel?> readPrefs() async {
    var prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap = {};
    final String? userStr = prefs.getString('user');
    if (userStr != null) {
      userMap = jsonDecode(userStr) as Map<String, dynamic>;
    }
    final LoginModel data = LoginModel.fromJson(userMap);
    return data;
  }
}
