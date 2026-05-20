import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/home_screen.dart';
import 'register_screen.dart';
import 'auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool loading = false;

  Future<void> login() async {
    setState(() {
      loading = true;
    });

    final error = await AuthService.login(
      email: emailController.text.trim(),

      password: passwordController.text.trim(),
    );

    setState(() {
      loading = false;
    });

    if (error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));

      return;
    }

    Navigator.pushReplacement(
      context,

      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FF),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Column(
            children: [
              const SizedBox(height: 40),

              // =========================
              // LOGO
              // =========================
              Container(
                width: 140,
                height: 140,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.25),

                      blurRadius: 25,

                      spreadRadius: 5,

                      offset: const Offset(0, 10),
                    ),
                  ],
                ),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),

                  child: Image.asset(
                    "assets/images/logo.png",

                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 35),

              // =========================
              // TITULO
              // =========================
              Text(
                "Alerta Violeta",

                style: GoogleFonts.playfairDisplay(
                  fontSize: 38,

                  fontWeight: FontWeight.bold,

                  color: const Color(0xFF5B21B6),
                ),
              ),

              const SizedBox(height: 12),

              Text(
                "Seguridad ciudadana inteligente",

                textAlign: TextAlign.center,

                style: GoogleFonts.poppins(
                  fontSize: 15,

                  color: Colors.black54,

                  height: 1.6,
                ),
              ),

              const SizedBox(height: 45),

              // =========================
              // CARD LOGIN
              // =========================
              Container(
                padding: const EdgeInsets.all(24),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(30),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),

                      blurRadius: 15,
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    Text(
                      "Iniciar sesión",

                      style: GoogleFonts.montserrat(
                        fontSize: 28,

                        fontWeight: FontWeight.bold,

                        color: const Color(0xFF2E1065),
                      ),
                    ),

                    const SizedBox(height: 30),

                    buildInput(
                      "Correo electrónico",

                      Icons.email_rounded,

                      emailController,
                    ),

                    const SizedBox(height: 20),

                    buildInput(
                      "Contraseña",

                      Icons.lock_rounded,

                      passwordController,

                      obscure: true,
                    ),

                    const SizedBox(height: 35),

                    SizedBox(
                      width: double.infinity,

                      height: 55,

                      child: ElevatedButton(
                        onPressed: loading ? null : login,

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7C3AED),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),

                        child: loading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Ingresar",

                                style: GoogleFonts.poppins(
                                  fontSize: 17,

                                  fontWeight: FontWeight.w600,

                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text(
                          "¿No tienes cuenta?",

                          style: GoogleFonts.poppins(color: Colors.black54),
                        ),

                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (_) => const RegisterScreen(),
                              ),
                            );
                          },

                          child: Text(
                            "Registrarse",

                            style: GoogleFonts.poppins(
                              color: const Color(0xFF7C3AED),

                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              Text(
                "SafeCode Studio © 2026",

                style: GoogleFonts.poppins(color: Colors.black45, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInput(
    String hint,

    IconData icon,

    TextEditingController controller, {

    bool obscure = false,
  }) {
    return TextField(
      controller: controller,

      obscureText: obscure,

      style: GoogleFonts.poppins(),

      decoration: InputDecoration(
        hintText: hint,

        hintStyle: GoogleFonts.poppins(),

        prefixIcon: Icon(icon, color: const Color(0xFF7C3AED)),

        filled: true,

        fillColor: const Color(0xFFF5F3FF),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),

          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
