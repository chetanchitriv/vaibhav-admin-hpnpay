import 'dart:convert';

class ApiService {
  static String getRequestBody(Map<String, dynamic> data) {
    return jsonEncode(data);
  }

  static Map<String, String> getHeaders() {
    return {
      "Content-Type": "application/json",
    };
  }
}
