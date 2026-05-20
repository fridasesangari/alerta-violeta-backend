import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'auth_service.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  File? image;

  // =========================
  // NOMBRE
  // =========================

  final nombreController = TextEditingController();

  final paternoController = TextEditingController();

  final maternoController = TextEditingController();

  // =========================
  // TELEFONO
  // =========================

  final telefonoController = TextEditingController();

  // =========================
  // DOMICILIO
  // =========================

  final calleController = TextEditingController();

  final numeroController = TextEditingController();

  final coloniaController = TextEditingController();

  final ciudadController = TextEditingController();

  final estadoController = TextEditingController();

  // =========================
  // LOGIN
  // =========================

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool loading = false;

  // =========================
  // TOMAR FOTO
  // =========================

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.camera);

    if (picked != null) {
      setState(() {
        image = File(picked.path);
      });
    }
  }

  // =========================
  // REGISTRO
  // =========================

  Future<void> register() async {
    if (image == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Debes tomar una foto")));

      return;
    }

    setState(() {
      loading = true;
    });

    final error = await AuthService.registerUser(
      nombre:
          "${nombreController.text} "
          "${paternoController.text} "
          "${maternoController.text}",

      telefono: telefonoController.text,

      domicilio:
          "${calleController.text} "
          "#${numeroController.text}, "
          "${coloniaController.text}, "
          "${ciudadController.text}, "
          "${estadoController.text}",

      email: emailController.text,

      password: passwordController.text,

      imageFile: image!,
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

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Cuenta creada correctamente")),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FF),

      appBar: AppBar(
        elevation: 0,

        backgroundColor: Colors.deepPurple,

        title: Text(
          "Crear cuenta",

          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          children: [
            // =========================
            // FOTO
            // =========================
            GestureDetector(
              onTap: pickImage,

              child: Column(
                children: [
                  CircleAvatar(
                    radius: 65,

                    backgroundColor: Colors.deepPurple,

                    backgroundImage: image != null ? FileImage(image!) : null,

                    child: image == null
                        ? const Icon(
                            Icons.camera_alt,

                            size: 42,

                            color: Colors.white,
                          )
                        : null,
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Tomar foto de seguridad",

                    style: GoogleFonts.poppins(
                      fontSize: 14,

                      fontWeight: FontWeight.w500,

                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 35),

            // =========================
            // TITULO
            // =========================
            Align(
              alignment: Alignment.centerLeft,

              child: Text(
                "Información personal",

                style: GoogleFonts.poppins(
                  fontSize: 22,

                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // =========================
            // NOMBRE
            // =========================
            buildInput("Nombre(s)", nombreController),

            buildInput("Apellido paterno", paternoController),

            buildInput("Apellido materno", maternoController),

            buildInput("Número de celular", telefonoController),

            const SizedBox(height: 20),

            // =========================
            // DOMICILIO
            // =========================
            Align(
              alignment: Alignment.centerLeft,

              child: Text(
                "Domicilio",

                style: GoogleFonts.poppins(
                  fontSize: 22,

                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            buildInput("Calle", calleController),

            buildInput("Número", numeroController),

            buildInput("Colonia", coloniaController),

            buildInput("Ciudad", ciudadController),

            buildInput("Estado", estadoController),

            const SizedBox(height: 20),

            // =========================
            // LOGIN
            // =========================
            Align(
              alignment: Alignment.centerLeft,

              child: Text(
                "Datos de acceso",

                style: GoogleFonts.poppins(
                  fontSize: 22,

                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            buildInput("Correo electrónico", emailController),

            buildInput("Contraseña", passwordController, obscure: true),

            const SizedBox(height: 30),

            // =========================
            // BOTON
            // =========================
            SizedBox(
              width: double.infinity,

              height: 55,

              child: ElevatedButton(
                onPressed: loading ? null : register,

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),

                child: loading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(
                        "Registrarse",

                        style: GoogleFonts.poppins(
                          fontSize: 17,

                          fontWeight: FontWeight.bold,

                          color: Colors.white,
                        ),
                      ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // =========================
  // INPUT
  // =========================

  Widget buildInput(
    String label,

    TextEditingController controller, {

    bool obscure = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),

      child: TextField(
        controller: controller,

        obscureText: obscure,

        decoration: InputDecoration(
          labelText: label,

          labelStyle: GoogleFonts.poppins(),

          filled: true,

          fillColor: Colors.white,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),

            borderSide: BorderSide.none,
          ),

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,

            vertical: 18,
          ),
        ),
      ),
    );
  }
}
