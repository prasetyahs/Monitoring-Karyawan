import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:monitoring_karyawan/helper/api_response.dart';

class LoginProvider extends GetConnect {
  @override
  void onInit() {
    print("INIT");
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return ApiResponse.fromJson(map);
      if (map is List) {
        return map.map((item) => ApiResponse.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = dotenv.get("CLIENT_URL");
    print(httpClient.baseUrl);
  }

  Future<Response> postLogin(body) async{
    print("POST");
    return await post('auth', body);
  }
}
