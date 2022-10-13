  // Future<Response> fetchProgram() async => await get("program");
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:monitoring_karyawan/app/modules/detail_lead/program_model.dart';

class ProgramLeadProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return ProgramModel.fromJson(map);
      if (map is List) {
        return map.map((item) => ProgramModel.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = dotenv.get("CLIENT_URL");
  }

  Future<Response> fetchProgram() async =>
      await get("program");

}
