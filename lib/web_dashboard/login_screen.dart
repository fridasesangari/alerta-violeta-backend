import 'package:flutter/material.dart';

import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userController = TextEditingController();

  final passwordController = TextEditingController();

  String error = '';

  void login() {
    if (userController.text == 'admin' && passwordController.text == '1234') {
      Navigator.pushReplacement(
        context,

        MaterialPageRoute(builder: (_) => DashboardScreen()),
      );
    } else {
      setState(() {
        error = 'Usuario o contraseña incorrectos';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3FF),

      body: Center(
        child: Container(
          width: 400,

          padding: const EdgeInsets.all(30),

          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius: BorderRadius.circular(20),

            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Image.asset('assets/images/logo.png', height: 120),

              const SizedBox(height: 20),

              const Text(
                "Panel Administrador",

                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: userController,

                decoration: const InputDecoration(labelText: "Usuario"),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: passwordController,

                obscureText: true,

                decoration: const InputDecoration(labelText: "Contraseña"),
              ),

              const SizedBox(height: 20),

              if (error.isNotEmpty)
                Text(error, style: const TextStyle(color: Colors.red)),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: login,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,

                    foregroundColor: Colors.white,

                    padding: const EdgeInsets.all(18),
                  ),

                  child: const Text("Ingresar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
