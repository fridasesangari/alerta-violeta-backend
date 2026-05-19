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

            // LOGO
            Container(
              width: 140,
              height: 140,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),

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
                borderRadius: BorderRadius.circular(35),

                child: Image.asset("assets/logo.png", fit: BoxFit.cover),
              ),
            ),

            const SizedBox(height: 30),

            // NOMBRE APP
            const Text(
              "Alerta Violeta",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5B21B6),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Plataforma inteligente de seguridad ciudadana",
              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 35),

            // SAFE CODE STUDIO
            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),

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
                  const Icon(
                    Icons.code_rounded,
                    size: 50,
                    color: Color(0xFF7C3AED),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "SafeCode Studio",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Desarrollo tecnológico enfocado en soluciones innovadoras con impacto social y enfoque en seguridad ciudadana.",
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

            const SizedBox(height: 35),

            // INTEGRANTES
            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(22),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),

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
                  const Row(
                    children: [
                      Icon(Icons.groups_rounded, color: Color(0xFF7C3AED)),

                      SizedBox(width: 10),

                      Text(
                        "Equipo de Desarrollo",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  buildMember("Frida", "Ingeniería Informática"),

                  buildMember("Amanda", "Ingeniería en Sistemas"),

                  buildMember("Mariana", "Ingeniería en Sistemas"),

                  buildMember("Emiliano", "Ingeniería Informática"),
                ],
              ),
            ),

            const SizedBox(height: 35),

            // TECNOLOGÍAS
            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(22),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),

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
                  const Row(
                    children: [
                      Icon(Icons.memory_rounded, color: Color(0xFF7C3AED)),

                      SizedBox(width: 10),

                      Text(
                        "Tecnologías",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  buildTech("Flutter"),
                  buildTech("Node.js"),
                  buildTech("MySQL"),
                  buildTech("Firebase"),
                  buildTech("Google Maps"),
                  buildTech("HeatMaps"),
                ],
              ),
            ),

            const SizedBox(height: 40),

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

  Widget buildMember(String name, String career) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),

      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,

            decoration: const BoxDecoration(
              color: Color(0xFFEEE7FF),
              shape: BoxShape.circle,
            ),

            child: const Icon(Icons.person, color: Color(0xFF7C3AED)),
          ),

          const SizedBox(width: 15),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              Text(career, style: const TextStyle(color: Colors.black54)),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTech(String tech) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

        decoration: BoxDecoration(
          color: const Color(0xFFF3EEFF),
          borderRadius: BorderRadius.circular(15),
        ),

        child: Row(
          children: [
            const Icon(Icons.check_circle, color: Color(0xFF7C3AED)),

            const SizedBox(width: 12),

            Text(tech, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
