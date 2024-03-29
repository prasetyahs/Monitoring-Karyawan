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

  Future<Leads> getLeads(id,
      {String startData = "", String endDate = ""}) async {
    print(startData + " " + endDate);
    final response =
        await get('leads/$id?start_date=$startData&end_date=$endDate');
    print(response.request?.url);
    return response.body;
  }

  Future<Response> postLeads(body, id) async => await post('leads/2', body);

  Future<Response> deleteLeads(int id) async => await delete('leads/$id');
}
