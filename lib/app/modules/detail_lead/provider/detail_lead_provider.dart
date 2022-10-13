import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/detail_lead/leads_product_model.dart';

class DetailLeadProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return LeadsProduct.fromJson(map);
      if (map is List) {
        return map.map((item) => LeadsProduct.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = dotenv.get("CLIENT_URL");
  }

  Future<Response> getProductLeads(status, idLeads) async =>
      await get("leads-product/get-by-status?status=$status&id_leads=$idLeads");

  Future<Response> createProductLeads(body, idLeads) async =>
      await post("leads-product/$idLeads", body);

}
