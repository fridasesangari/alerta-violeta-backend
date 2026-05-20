import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FF),

      appBar: AppBar(title: const Text("Acerca de"), centerTitle: true),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          children: [
            const SizedBox(height: 20),

            // =========================
            // LOGO ALERTA VIOLETA
            // =========================
            Container(
              width: 150,
              height: 150,

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

                child: Image.asset("assets/images/logo.png", fit: BoxFit.cover),
              ),
            ),

            const SizedBox(height: 30),

            // =========================
            // TITULO
            // =========================
            const Text(
              "Alerta Violeta",

              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,

                color: Color(0xFF5B21B6),
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              "Sistema inteligente de seguridad ciudadana enfocado en la prevención, monitoreo y visualización de incidentes en tiempo real.",

              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 16,

                color: Colors.black54,

                height: 1.6,
              ),
            ),

            const SizedBox(height: 35),

            // =========================
            // OBJETIVO
            // =========================
            buildCard(
              title: "Objetivo",

              icon: Icons.security_rounded,

              content:
                  "Alerta Violeta busca brindar una herramienta tecnológica accesible que permita reportar incidentes, visualizar zonas de riesgo y generar estadísticas para fortalecer la seguridad ciudadana y la prevención.",
            ),

            const SizedBox(height: 25),

            // =========================
            // SAFE CODE
            // =========================
            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(24),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(28),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),

                    blurRadius: 15,

                    offset: const Offset(0, 6),
                  ),
                ],
              ),

              child: Column(
                children: [
                  // LOGO SAFE CODE
                  Container(
                    width: 110,
                    height: 110,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.withOpacity(0.15),

                          blurRadius: 18,
                        ),
                      ],
                    ),

                    child: ClipRRect(
                      //borderRadius: BorderRadius.circular(28),
                      child: Image.asset(
                        "assets/images/safecode_logo.png",

                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "SafeCode Studio",

                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    "SafeCode Studio es un equipo enfocado en el desarrollo de soluciones tecnológicas modernas, seguras e innovadoras, orientadas al impacto social, la seguridad digital y la transformación tecnológica.",

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 15,

                      color: Colors.black54,

                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 45),

            const Text(
              "© 2026 SafeCode Studio",

              style: TextStyle(
                color: Colors.black45,

                fontSize: 13,

                letterSpacing: 1,
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildCard({
    required String title,

    required IconData icon,

    required String content,
  }) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(24),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(28),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),

            blurRadius: 15,

            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF7C3AED), size: 30),

              const SizedBox(width: 12),

              Text(
                title,

                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Text(
            content,

            style: const TextStyle(
              fontSize: 15,

              color: Colors.black54,

              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}
