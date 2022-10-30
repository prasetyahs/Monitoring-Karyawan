import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:monitoring_karyawan/helper/api_response.dart';

class UpdateProfileProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return ApiResponse.fromJson(map);
      if (map is List)
        return map.map((item) => ApiResponse.fromJson(item)).toList();
    };
    httpClient.baseUrl = dotenv.get("CLIENT_URL");
  }

  Future<Response> updateProfile(id, body) async =>
      put("account/update-profile/$id", body);
}
