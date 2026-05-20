import 'package:flutter/material.dart';
import 'report_screen.dart';
import '../widgets/drawer_menu.dart';
import 'package:animate_do/animate_do.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // =========================
  // BOTON PERSONALIZADO
  // =========================

  Widget buildReportButton(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required String categoria,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 65,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 10,
          shadowColor: color.withOpacity(0.4),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),

        onPressed: () {
          Navigator.push(
            context,

            MaterialPageRoute(
              builder: (_) => ReportScreen(categoria: categoria),
            ),
          );
        },

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Icon(icon, size: 28),

            const SizedBox(width: 15),

            Text(
              title,

              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // COLORES

    const Color primaryPurple = Color(0xFF7C3AED);

    const Color lightPurpleBg = Color(0xFFF5F3FF);

    return Scaffold(
      backgroundColor: lightPurpleBg,

      // =========================
      // APPBAR
      // =========================
      appBar: AppBar(
        title: const Text(
          "Alerta Violeta Colima",

          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),

        centerTitle: true,

        backgroundColor: primaryPurple,

        elevation: 0,

        iconTheme: const IconThemeData(color: Colors.white),
      ),

      drawer: const DrawerMenu(),

      // =========================
      // BODY
      // =========================
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              // =========================
              // ICONO SUPERIOR
              // =========================
              FadeInDown(
                duration: const Duration(milliseconds: 800),

                child: Container(
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    shape: BoxShape.circle,

                    boxShadow: [
                      BoxShadow(
                        color: primaryPurple.withOpacity(0.1),

                        blurRadius: 35,

                        spreadRadius: 8,

                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),

                  child: const Icon(
                    Icons.shield_moon_rounded,

                    size: 80,

                    color: primaryPurple,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // =========================
              // TITULO
              // =========================
              const Text(
                "Tu seguridad nos importa",

                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E1065),
                ),
              ),

              const SizedBox(height: 10),

              // =========================
              // DESCRIPCION
              // =========================
              Text(
                "Reporta cualquier incidente de forma rápida y segura en el estado de Colima.",

                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade600,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 45),

              // =========================
              // BOTONES
              // =========================
              FadeInUp(
                duration: const Duration(milliseconds: 1000),

                child: Column(
                  children: [
                    // =========================
                    // ACOSO
                    // =========================
                    buildReportButton(
                      context,

                      title: "REPORTAR ACOSO",

                      icon: Icons.person_off,

                      color: primaryPurple,

                      categoria: "Acoso",
                    ),

                    const SizedBox(height: 18),

                    // =========================
                    // ROBOS
                    // =========================
                    buildReportButton(
                      context,

                      title: "REPORTAR ROBO",

                      icon: Icons.security,

                      color: Colors.orange,

                      categoria: "Robos",
                    ),

                    const SizedBox(height: 18),

                    // =========================
                    // VIOLENCIA
                    // =========================
                    buildReportButton(
                      context,

                      title: "REPORTAR VIOLENCIA",

                      icon: Icons.gavel,

                      color: Colors.redAccent,

                      categoria: "Violencia Física",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // =========================
              // SEGURIDAD
              // =========================
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Icon(
                    Icons.lock_outline,
                    size: 16,
                    color: Colors.grey.shade500,
                  ),

                  const SizedBox(width: 5),

                  Text(
                    "Conexión cifrada y anónima",

                    style: TextStyle(
                      color: Colors.grey.shade500,

                      fontSize: 12,

                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
