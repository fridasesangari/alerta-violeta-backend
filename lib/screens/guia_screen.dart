import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class GuiaScreen extends StatelessWidget {
  const GuiaScreen({super.key});

  Future<void> _makeCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);

    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryPurple = Color(0xFF7C3AED);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FF),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryPurple,

        iconTheme: const IconThemeData(color: Colors.white),

        title: Text(
          "Guía de Violencia",

          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [
          // HEADER
          Container(
            padding: const EdgeInsets.all(28),

            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF7C3AED), Color(0xFFA855F7)],
              ),

              borderRadius: BorderRadius.circular(28),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Text(
                  "Prevención y orientación",

                  style: GoogleFonts.playfairDisplay(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  "Conoce los tipos de violencia y aprende cómo actuar ante situaciones de riesgo.",

                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.white.withOpacity(0.9),
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // ACOSO
          buildCard(
            title: "Acoso Callejero",

            icon: Icons.record_voice_over_rounded,

            color: primaryPurple,

            content:
                "Incluye conductas ofensivas o intimidantes como silbidos, persecución, comentarios sexuales, tocamientos o fotografías sin consentimiento.",
          ),

          // VIOLENCIA FISICA
          buildCard(
            title: "Violencia Física",

            icon: Icons.front_hand_rounded,

            color: Colors.redAccent,

            content:
                "Es cualquier agresión que provoque daño corporal como golpes, empujones, lesiones o ataques físicos.",
          ),

          // VIOLENCIA PSICOLOGICA
          buildCard(
            title: "Violencia Psicológica",

            icon: Icons.psychology_rounded,

            color: Colors.orange,

            content:
                "Incluye amenazas, humillaciones, manipulación, aislamiento emocional, control excesivo o intimidación constante.",
          ),

          // VIOLENCIA DIGITAL
          buildCard(
            title: "Violencia Digital",

            icon: Icons.phone_android_rounded,

            color: Colors.indigo,

            content:
                "Difusión de contenido íntimo, amenazas por redes sociales, acoso digital, hackeo o vigilancia sin consentimiento.",
          ),

          // QUE HACER
          buildCard(
            title: "¿Qué hacer ante una situación de riesgo?",

            icon: Icons.shield_rounded,

            color: Colors.green,

            content:
                "1. Busca un lugar seguro.\n\n"
                "2. Contacta a familiares o personas de confianza.\n\n"
                "3. Comparte tu ubicación.\n\n"
                "4. Llama al 911.\n\n"
                "5. Realiza un reporte desde la app.\n\n"
                "6. Conserva evidencia si es posible.",
          ),

          const SizedBox(height: 30),

          // AYUDA
          Container(
            padding: const EdgeInsets.all(25),

            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.circular(28),

              boxShadow: [
                BoxShadow(color: Colors.red.withOpacity(0.08), blurRadius: 15),
              ],
            ),

            child: Column(
              children: [
                const Icon(
                  Icons.support_agent_rounded,
                  color: Colors.red,
                  size: 55,
                ),

                const SizedBox(height: 15),

                Text(
                  "Ayuda inmediata",

                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  "Si estás en peligro o necesitas ayuda urgente, utiliza los siguientes números oficiales.",

                  textAlign: TextAlign.center,

                  style: GoogleFonts.poppins(
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton.icon(
                    onPressed: () => _makeCall("911"),

                    icon: const Icon(Icons.local_police),

                    label: const Text("Llamar al 911"),

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,

                      padding: const EdgeInsets.symmetric(vertical: 16),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                SizedBox(
                  width: double.infinity,

                  child: OutlinedButton.icon(
                    onPressed: () => _makeCall("075"),

                    icon: const Icon(Icons.woman),

                    label: const Text("Línea Mujer 075"),

                    style: OutlinedButton.styleFrom(
                      foregroundColor: primaryPurple,

                      padding: const EdgeInsets.symmetric(vertical: 16),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget buildCard({
    required String title,
    required IconData icon,
    required String content,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 22),

      padding: const EdgeInsets.all(22),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(28),

        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 12),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),

                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),

                  borderRadius: BorderRadius.circular(18),
                ),

                child: Icon(icon, color: color),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Text(
                  title,

                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2E1065),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Text(
            content,

            style: GoogleFonts.inter(
              fontSize: 15,
              color: Colors.black87,
              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }
}
