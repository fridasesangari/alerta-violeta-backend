import 'dart:io';

import 'package:alertavioleta/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportScreen extends StatefulWidget {
  final String categoria;

  const ReportScreen({super.key, required this.categoria});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final TextEditingController _descController = TextEditingController();

  Position? position;

  File? image;

  bool isSending = false;

  @override
  void initState() {
    super.initState();

    _getLocation();
  }

  // =========================
  // OBTENER UBICACION
  // =========================

  Future<void> _getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    final currentPosition = await Geolocator.getCurrentPosition();

    setState(() {
      position = currentPosition;
    });
  }

  // =========================
  // TOMAR FOTO
  // =========================

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 70,
    );

    if (picked != null) {
      setState(() {
        image = File(picked.path);
      });
    }
  }

  // =========================
  // ENVIAR REPORTE
  // =========================

  Future<void> _sendData() async {
    // VALIDAR UBICACION

    if (position == null) {
      _showCustomSnackBar(
        "Esperando ubicación GPS...",
        backgroundColor: Colors.orange,
      );

      return;
    }

    // VALIDAR DESCRIPCION

    if (_descController.text.trim().isEmpty) {
      _showCustomSnackBar(
        "Debes escribir una descripción",
        backgroundColor: Colors.red,
      );

      return;
    }

    // VALIDAR FOTO

    if (image == null) {
      _showCustomSnackBar(
        "Debes tomar una fotografía",
        backgroundColor: Colors.red,
      );

      return;
    }

    setState(() {
      isSending = true;
    });

    try {
      await ApiService.crearIncidente(
        titulo: widget.categoria,

        descripcion: _descController.text.trim(),

        categoria: widget.categoria.toLowerCase(),

        latitud: position!.latitude,

        longitud: position!.longitude,

        imageFile: image!,
      );

      if (!mounted) return;

      _showCustomSnackBar(
        "Reporte enviado correctamente",
        backgroundColor: Colors.green,
      );

      Navigator.pop(context);
    } catch (e) {
      _showCustomSnackBar(
        "Error al enviar reporte",
        backgroundColor: Colors.red,
      );
    }

    setState(() {
      isSending = false;
    });
  }

  // =========================
  // SNACKBAR BONITO
  // =========================

  void _showCustomSnackBar(String message, {required Color backgroundColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),

        backgroundColor: backgroundColor,

        behavior: SnackBarBehavior.floating,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),

        margin: const EdgeInsets.all(16),
      ),
    );
  }

  // =========================
  // UI
  // =========================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F2FF),

      appBar: AppBar(
        backgroundColor: Colors.deepPurple,

        elevation: 0,

        title: Text(
          "Nuevo reporte",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // TITULO
            Text(
              widget.categoria,

              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Describe la situación y agrega evidencia fotográfica.",

              style: GoogleFonts.montserrat(
                fontSize: 15,
                color: Colors.black54,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 30),

            // DESCRIPCION
            TextField(
              controller: _descController,

              maxLines: 5,

              style: GoogleFonts.poppins(),

              decoration: InputDecoration(
                hintText: "Describe lo sucedido...",

                hintStyle: GoogleFonts.poppins(),

                filled: true,

                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),

                  borderSide: BorderSide.none,
                ),

                contentPadding: const EdgeInsets.all(20),
              ),
            ),

            const SizedBox(height: 30),

            // FOTO
            GestureDetector(
              onTap: pickImage,

              child: Container(
                width: double.infinity,

                height: 220,

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(25),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,

                      blurRadius: 10,

                      offset: const Offset(0, 5),
                    ),
                  ],
                ),

                child: image == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 60,
                            color: Colors.deepPurple,
                          ),

                          const SizedBox(height: 15),

                          Text(
                            "Tomar fotografía",

                            style: GoogleFonts.poppins(
                              fontSize: 18,

                              fontWeight: FontWeight.w600,

                              color: Colors.deepPurple,
                            ),
                          ),
                        ],
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(25),

                        child: Image.file(image!, fit: BoxFit.cover),
                      ),
              ),
            ),

            const SizedBox(height: 30),

            // UBICACION
            Container(
              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(20),

                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
              ),

              child: Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.deepPurple),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      position == null
                          ? "Obteniendo ubicación..."
                          : "Ubicación obtenida correctamente",

                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // BOTON
            SizedBox(
              width: double.infinity,

              height: 58,

              child: ElevatedButton(
                onPressed: isSending ? null : _sendData,

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),

                child: isSending
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(
                        "Enviar reporte",

                        style: GoogleFonts.poppins(
                          fontSize: 18,

                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
