import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_connect/connect.dart';
import 'package:monitoring_karyawan/helper/api_response.dart';

class AdminProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return ApiResponse.fromJson(map);
      if (map is List) {
        return map.map((item) => ApiResponse.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = dotenv.get("CLIENT_URL");
  }

  Future<Response> getCategory() async => await get("category-product");
  Future<Response> storeProduct(body) async => await post("product", body);
  Future<Response> getProduct() async => await get("product");
  Future<Response> storeProgram(body) async => await post("program", body);
  Future<Response> fetchProgram() async => await get("program");
  Future<Response> storeCategory(body) async =>
      await post("category-product", body);

  Future<Response> fetchJabatan() async => await get("jabatan");
  Future<Response> storeUser(body) async => await post("karyawan", body);
  Future<Response> fetchUser() async => await get("karyawan");
  Future<Response> storeJabatan(body) async => await post("jabatan",body);

}
