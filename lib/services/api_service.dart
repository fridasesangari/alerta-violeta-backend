import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://alerta-violeta-backend.onrender.com";

  static Future<List<dynamic>> getReports() async {
    final response = await http.get(Uri.parse("$baseUrl/incidentes"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    return [];
  }
}
