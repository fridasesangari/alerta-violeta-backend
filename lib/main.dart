import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'screens/home_screen.dart';
import 'auth/login_screen.dart' as mobile_auth;
import 'web_dashboard/login_screen.dart' as web_auth;
import 'supabase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Verifica si existe sesión activa al arrancar (solo móvil)
    final session = Supabase.instance.client.auth.currentSession;

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // =========================
      // WEB
      // =========================
      home: kIsWeb
          ? web_auth.LoginScreen()
          // =========================
          // CELULAR — redirige según sesión
          // =========================
          : session != null
              ? const HomeScreen()
              : const mobile_auth.LoginScreen(),
    );
  }
}
