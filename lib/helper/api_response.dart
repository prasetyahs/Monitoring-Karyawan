class ApiResponse {
  ApiResponse({
    required this.success,
    required this.message,
  });
  late final bool success;
  late final String message;
  
  ApiResponse.fromApiResponse();
  ApiResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    return _data;
  }
}
