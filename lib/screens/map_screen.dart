import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_heatmap/flutter_map_heatmap.dart';
import 'package:latlong2/latlong.dart';

import '../services/api_service.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Marker> markers = [];
  List<WeightedLatLng> heatPoints = [];

  @override
  void initState() {
    super.initState();
    loadReports();
  }

  //COLOR SEGÚN CATEGORÍA
  Color getColor(String categoria) {
    switch (categoria) {
      case "Robo":
        return Colors.orange;

      case "Violencia Física":
        return Colors.red;

      case "Seguimiento":
        return Colors.purple;

      case "Acoso":
        return Colors.blue;

      default:
        return Colors.grey;
    }
  }

  //CARGAR REPORTES
  Future<void> loadReports() async {
    try {
      final data = await ApiService.getReports();

      List<Marker> tempMarkers = [];
      List<WeightedLatLng> tempHeatPoints = [];

      for (var r in data) {
        final lat = double.parse(r["lat"].toString());
        final lng = double.parse(r["lng"].toString());

        final categoria = r["categoria"] ?? "Acoso";

        // 🔥 HEATMAP
        tempHeatPoints.add(WeightedLatLng(LatLng(lat, lng), 1));

        // 🔥 MARKERS
        tempMarkers.add(
          Marker(
            point: LatLng(lat, lng),

            width: 40,
            height: 40,

            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,

                  backgroundColor: Colors.transparent,

                  builder: (_) {
                    return Container(
                      padding: const EdgeInsets.all(20),

                      decoration: const BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),

                      child: Column(
                        mainAxisSize: MainAxisSize.min,

                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            categoria,

                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text("📍 $lat, $lng"),

                          Text("📅 ${r["fecha"]}"),

                          const SizedBox(height: 20),

                          if (r["foto"] != null)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),

                              child: Image.memory(
                                base64Decode(r["foto"]),

                                height: 220,

                                width: double.infinity,

                                fit: BoxFit.cover,
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                );
              },

              child: Icon(
                Icons.location_on,

                color: getColor(categoria),

                size: 40,
              ),
            ),
          ),
        );
      }

      setState(() {
        markers = tempMarkers;
        heatPoints = tempHeatPoints;
      });
    } catch (e) {
      print("ERROR MAPA:");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mapa de Riesgo")),

      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(19.2433, -103.7250),

          initialZoom: 13,
        ),

        children: [
          //MAPA
          TileLayer(
            urlTemplate:
                "https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png",

            subdomains: ['a', 'b', 'c'],
          ),

          //HEATMAP
          if (heatPoints.isNotEmpty)
            HeatMapLayer(
              heatMapDataSource: InMemoryHeatMapDataSource(data: heatPoints),

              heatMapOptions: HeatMapOptions(
                radius: 35,

                blurFactor: 0.7,

                minOpacity: 0.3,
              ),
            ),

          //MARKERS
          MarkerLayer(markers: markers),
        ],
      ),
    );
  }
}
