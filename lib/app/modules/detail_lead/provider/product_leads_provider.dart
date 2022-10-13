import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/home_app/data/DataLeads.dart';
import 'package:monitoring_karyawan/helper/api_response.dart';

import '../../home_app/leads_model.dart';

class ProductLeadsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return ApiResponse.fromJson(map);
      if (map is List)
        return map.map((item) => ApiResponse.fromJson(item)).toList();
    };
    httpClient.baseUrl = dotenv.get("CLIENT_URL");
  }

  Future<Leads> getLeads(id) async {
    final response = await get('leads/$id');
    print(response.bodyString);
    return response.body;
  }

  Future<Response> createProductLeads(body, id) async =>
      await post("leads-product/$id", body);
  // Future<Response> postLeads(body, id) async => await post('leads/2', body);

  // Future<Response> deleteLeads(int id) async => await delete('leads/$id');
}
