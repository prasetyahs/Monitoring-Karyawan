import 'dart:convert';
import 'package:monitoring_karyawan/app/modules/login/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  // ignore: prefer_typing_uninitialized_variables

  static Future<bool> writePrefs(Data data) async {
    var prefs = await SharedPreferences.getInstance();
    bool result = await prefs.setString('user', jsonEncode(data));
    return result;
  }

  static Future<Data?> readPrefs() async {
    var prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap = {};
    final String? userStr = prefs.getString('user');
    if (userStr != null) {
      userMap = jsonDecode(userStr) as Map<String, dynamic>;
    }
    final Data data = Data.fromJson(userMap);
    return data;
  }
}
