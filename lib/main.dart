import 'package:flutter/material.dart';
import 'package:alertavioleta/web_dashboard/dashboard_screen.dart';
import 'web_dashboard/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}
