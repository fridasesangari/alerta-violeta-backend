import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';

class ApiService {
  static const String baseUrl = "https://alerta-violeta-backend.onrender.com";

  static final supabase = Supabase.instance.client;

  // =========================
  // OBTENER REPORTES
  // =========================

  static Future<List<dynamic>> getReports() async {
    final response = await http.get(Uri.parse("$baseUrl/incidentes"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    return [];
  }

  // =========================
  // CREAR INCIDENTE
  // =========================

  static Future<void> crearIncidente({
    required String titulo,
    required String descripcion,
    required String categoria,
    required double latitud,
    required double longitud,
    required File imageFile,
  }) async {
    // =========================
    // SUBIR IMAGEN A SUPABASE
    // (si falla, el reporte se envía igual sin imagen)
    // =========================

    String? imageUrl;

    try {
      final fileName = "${DateTime.now().millisecondsSinceEpoch}.jpg";

      final imageBytes = await imageFile.readAsBytes();

      await supabase.storage
          .from("reportes")
          .uploadBinary(fileName, imageBytes);

      imageUrl =
          supabase.storage.from("reportes").getPublicUrl(fileName);
    } catch (_) {
      // El reporte continúa aunque la imagen no se pueda subir
    }

    // =========================
    // ENVIAR AL BACKEND
    // =========================

    final url = Uri.parse("$baseUrl/incidentes");

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'titulo': titulo,
        'descripcion': descripcion,
        'categoria': categoria,
        'latitud': latitud,
        'longitud': longitud,
        'imagen': imageUrl,
      }),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Error al crear incidente');
    }
  }

  // =========================
  // ACTUALIZAR ESTADO
  // =========================

  static Future<void> updateStatus(int id, String estado) async {
    final url = Uri.parse('$baseUrl/incidentes/$id');

    await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'estado': estado}),
    );
  }

  // =========================
  // ELIMINAR REPORTE
  // =========================

  static Future<void> deleteReport(int id) async {
    final url = Uri.parse('$baseUrl/incidentes/$id');

    await http.delete(url);
  }
}
