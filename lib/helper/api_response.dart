import 'dart:convert';

class ApiResponse {
  ApiResponse(
      {required this.success, required this.message, this.data});
  late final bool success;
  late final String message;
  late final data;

  ApiResponse.fromApiResponse();
  ApiResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'] != null ? json['success'] : false;
    message = json['message'] != null ? json['message'] : "";
    data = json['data'] != null ? json['data']: null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['data'] = data;
    if (this.data != null) {
      _data['data'] = this.data!.toJson();
    }
    return _data;
  }
}
