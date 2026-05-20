import 'package:flutter/material.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'supabase_config.dart';

import 'auth/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Alerta Violeta',

      theme: ThemeData(primarySwatch: Colors.deepPurple),

      home: const LoginScreen(),
    );
  }
}
