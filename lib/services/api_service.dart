import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://192.168.1.25:3000/api";

  static Future sendReport(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse("$baseUrl/report"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );

    return response;
  }

  static Future getReports() async {
    final response = await http.get(Uri.parse("$baseUrl/report"));

    return jsonDecode(response.body);
  }
}
