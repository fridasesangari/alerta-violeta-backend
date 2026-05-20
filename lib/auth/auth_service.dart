import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  static final supabase = Supabase.instance.client;

  // =========================
  // REGISTRO
  // =========================

  static Future<String?> registerUser({
    required String nombre,

    required String telefono,

    required String domicilio,

    required String email,

    required String password,

    required File imageFile,
  }) async {
    try {
      // =========================
      // CREAR USUARIO
      // =========================

      final response = await supabase.auth.signUp(
        email: email,

        password: password,
      );

      final user = response.user;

      if (user == null) {
        return "No se pudo crear usuario";
      }

      final uid = user.id;

      // =========================
      // SUBIR FOTO
      // =========================

      final imageBytes = await imageFile.readAsBytes();

      final fileName = "$uid.jpg";

      await supabase.storage
          .from('usuarios')
          .uploadBinary(fileName, imageBytes);

      // =========================
      // URL PUBLICA
      // =========================

      final imageUrl = supabase.storage.from('usuarios').getPublicUrl(fileName);

      // =========================
      // GUARDAR DATOS
      // =========================

      await supabase.from("usuarios").insert({
        "id": uid,

        "nombre": nombre,

        "telefono": telefono,

        "domicilio": domicilio,

        "email": email,

        "foto": imageUrl,
      });

      return null;
    } catch (e) {
      print(e);

      return e.toString();
    }
  }

  // =========================
  // LOGIN
  // =========================

  static Future<String?> login({
    required String email,

    required String password,
  }) async {
    try {
      await supabase.auth.signInWithPassword(email: email, password: password);

      return null;
    } catch (e) {
      print(e);

      return e.toString();
    }
  }

  // =========================
  // LOGOUT
  // =========================

  static Future<void> logout() async {
    await supabase.auth.signOut();
  }

  // =========================
  // USUARIO ACTUAL
  // =========================

  static User? getCurrentUser() {
    return supabase.auth.currentUser;
  }
}
