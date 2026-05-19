import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static Future<void> updateStatus(int id, String estado) async {
    final url = Uri.parse('$baseUrl/incidentes/$id');
    await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'estado': estado}),
    );
  }

  static Future<void> deleteReport(int id) async {
    final url = Uri.parse('$baseUrl/incidentes/$id');
    await http.delete(url);
  }

  static const String baseUrl = "https://alerta-violeta-backend.onrender.com";

  static Future<List<dynamic>> getReports() async {
    final response = await http.get(Uri.parse("$baseUrl/incidentes"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    return [];
  }
}
