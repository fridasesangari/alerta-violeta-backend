import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeyesScreen extends StatelessWidget {
  const LeyesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryPurple = Color(0xFF7C3AED);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FF),

      appBar: AppBar(
        backgroundColor: primaryPurple,
        elevation: 0,

        iconTheme: const IconThemeData(color: Colors.white),

        title: Text(
          "Artículos y Leyes",

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
            padding: const EdgeInsets.all(25),

            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF7C3AED), Color(0xFFA855F7)],
              ),

              borderRadius: BorderRadius.circular(25),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "Derechos y protección legal",

                  style: GoogleFonts.playfairDisplay(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  "Conoce las principales leyes y artículos que protegen a las mujeres contra la violencia en México.",

                  style: GoogleFonts.poppins(
                    color: Colors.white.withOpacity(0.9),
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // LEY 1
          buildLawCard(
            title:
                "Ley General de Acceso de las Mujeres a una Vida Libre de Violencia",

            article: "Artículo 1",

            description:
                "Garantiza la prevención, atención, sanción y erradicación de todos los tipos de violencia contra las mujeres.",

            color: Colors.deepPurple,
          ),

          // LEY 2
          buildLawCard(
            title: "Constitución Política de los Estados Unidos Mexicanos",

            article: "Artículo 4",

            description:
                "El hombre y la mujer son iguales ante la ley. Toda persona tiene derecho a vivir con dignidad y seguridad.",

            color: Colors.indigo,
          ),

          // LEY 3
          buildLawCard(
            title: "Código Penal del Estado de Colima",

            article: "Capítulo de delitos sexuales",

            description:
                "Sanciona conductas como acoso, hostigamiento, abuso sexual y violencia física.",

            color: Colors.redAccent,
          ),

          // LEY 4
          buildLawCard(
            title: "Derechos de las Víctimas",

            article: "Atención Integral",

            description:
                "Toda víctima tiene derecho a recibir apoyo psicológico, jurídico y protección inmediata.",

            color: Colors.orange,
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget buildLawCard({
    required String title,
    required String article,
    required String description,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),

      padding: const EdgeInsets.all(22),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(28),

        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12),
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

                child: Icon(Icons.gavel_rounded, color: color),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Text(
                  title,

                  style: GoogleFonts.poppins(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2E1065),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Text(
            article,

            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            description,

            style: GoogleFonts.inter(
              fontSize: 15,
              height: 1.7,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
