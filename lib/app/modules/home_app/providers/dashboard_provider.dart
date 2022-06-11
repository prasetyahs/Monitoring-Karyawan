import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../dashboard_model.dart';

class DashboardProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Dashboard.fromJson(map);
      if (map is List) {
        return map.map((item) => Dashboard.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = dotenv.get("CLIENT_URL");
  }

  Future<Dashboard?> getDashboard(int id) async {
    final response = await get('dashboard/$id');
    return response.body;
  }
}
