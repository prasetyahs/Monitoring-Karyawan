import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../leads_model.dart';

class LeadsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Leads.fromJson(map);
      if (map is List) return map.map((item) => Leads.fromJson(item)).toList();
    };
    httpClient.baseUrl = dotenv.get("CLIENT_URL");
  }

  Future<Leads?> getLeads(int id) async {
    final response = await get('leads/$id');
    return response.body;
  }

  Future<Response<Leads>> postLeads(Leads leads) async =>
      await post('leads', leads);
  Future<Response> deleteLeads(int id) async => await delete('leads/$id');
}
