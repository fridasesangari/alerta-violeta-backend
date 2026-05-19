import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_map_heatmap/flutter_map_heatmap.dart';
import 'login_screen.dart';

import '../services/api_service.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List reports = [];

  int selectedIndex = 0;

  int acoso = 0;
  int robo = 0;
  int violencia = 0;

  @override
  void initState() {
    super.initState();

    loadReports();
  }

  Future<void> loadReports() async {
    final data = await ApiService.getReports();

    int acosoCount = 0;
    int roboCount = 0;
    int violenciaCount = 0;

    for (var report in data) {
      final categoria = report['categoria'].toString().toLowerCase();

      if (categoria == 'acoso') {
        acosoCount++;
      }

      if (categoria == 'robo') {
        roboCount++;
      }

      if (categoria == 'violencia') {
        violenciaCount++;
      }
    }

    setState(() {
      reports = data;

      acoso = acosoCount;

      robo = roboCount;

      violencia = violenciaCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3FF),

      body: Row(
        children: [
          buildSidebar(),

          Expanded(
            child: IndexedStack(
              index: selectedIndex,

              children: [dashboardContent(), mapContent(), statisticsContent()],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSidebar() {
    return Container(
      width: 220,

      color: Colors.white,

      child: Column(
        children: [
          Container(
            width: double.infinity,

            padding: const EdgeInsets.all(25),

            color: Colors.purple,

            child: const Column(
              children: [
                Icon(Icons.shield, color: Colors.white, size: 50),

                SizedBox(height: 10),

                Text(
                  "Alerta Violeta",

                  style: TextStyle(
                    color: Colors.white,

                    fontSize: 22,

                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          sidebarItem(Icons.dashboard, "Dashboard", 0),

          sidebarItem(Icons.map, "Mapa", 1),

          sidebarItem(Icons.bar_chart, "Estadísticas", 2),

          const Spacer(),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),

            title: const Text(
              "Cerrar sesión",

              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),

            onTap: () {
              Navigator.pushReplacement(
                context,

                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget sidebarItem(IconData icon, String title, int index) {
    final selected = selectedIndex == index;

    return ListTile(
      leading: Icon(icon, color: selected ? Colors.purple : Colors.grey),

      title: Text(
        title,

        style: TextStyle(color: selected ? Colors.purple : Colors.black),
      ),

      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }

  Widget dashboardContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            "Total reportes: ${reports.length}",

            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              statCard("Total", reports.length.toString(), Icons.warning),

              const SizedBox(width: 20),

              statCard("Acoso", acoso.toString(), Icons.person),

              const SizedBox(width: 20),

              statCard("Robos", robo.toString(), Icons.gpp_bad),

              const SizedBox(width: 20),

              statCard("Violencia", violencia.toString(), Icons.gavel),
            ],
          ),

          const SizedBox(height: 30),

          buildChart(),

          const SizedBox(height: 30),

          SizedBox(height: 500, child: buildMap()),

          const SizedBox(height: 30),

          buildReportsList(),
        ],
      ),
    );
  }

  Widget statisticsContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),

      child: Column(
        children: [
          Row(
            children: [
              statCard("Acoso", acoso.toString(), Icons.person),

              const SizedBox(width: 20),

              statCard("Robos", robo.toString(), Icons.gpp_bad),

              const SizedBox(width: 20),

              statCard("Violencia", violencia.toString(), Icons.gavel),
            ],
          ),

          const SizedBox(height: 30),

          buildChart(),

          const SizedBox(height: 30),

          buildPieChart(),
        ],
      ),
    );
  }

  Widget mapContent() {
    return Padding(padding: const EdgeInsets.all(20), child: buildMap());
  }

  Widget buildChart() {
    return Container(
      height: 300,

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),

      child: BarChart(
        BarChartData(
          barGroups: [
            BarChartGroupData(
              x: 0,

              barRods: [
                BarChartRodData(toY: acoso.toDouble(), color: Colors.purple),
              ],
            ),

            BarChartGroupData(
              x: 1,

              barRods: [
                BarChartRodData(toY: robo.toDouble(), color: Colors.red),
              ],
            ),

            BarChartGroupData(
              x: 2,

              barRods: [
                BarChartRodData(
                  toY: violencia.toDouble(),
                  color: Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPieChart() {
    return Container(
      height: 500,

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),

      child: Column(
        children: [
          const Text(
            "Distribución de incidentes",

            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 30),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,

                  child: PieChart(
                    PieChartData(
                      sectionsSpace: 3,

                      centerSpaceRadius: 70,

                      sections: [
                        PieChartSectionData(
                          value: acoso.toDouble(),

                          title: '$acoso',

                          radius: 100,

                          color: Colors.purple,
                        ),

                        PieChartSectionData(
                          value: robo.toDouble(),

                          title: '$robo',

                          radius: 100,

                          color: Colors.red,
                        ),

                        PieChartSectionData(
                          value: violencia.toDouble(),

                          title: '$violencia',

                          radius: 100,

                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      legendItem(Colors.purple, "Acoso"),

                      const SizedBox(height: 20),

                      legendItem(Colors.red, "Robos"),

                      const SizedBox(height: 20),

                      legendItem(Colors.orange, "Violencia"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMap() {
    final heatPoints = reports
        .where(
          (report) => report['latitud'] != null && report['longitud'] != null,
        )
        .map((report) {
          return WeightedLatLng(
            LatLng(
              double.parse(report['latitud'].toString()),

              double.parse(report['longitud'].toString()),
            ),

            1,
          );
        })
        .toList();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),

        child: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(19.2433, -103.7241),

            initialZoom: 13,
          ),

          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',

              userAgentPackageName: 'com.example.alertavioleta',
            ),

            // SOLO mostrar heatmap si hay puntos
            if (heatPoints.isNotEmpty)
              HeatMapLayer(
                heatMapDataSource: InMemoryHeatMapDataSource(data: heatPoints),

                heatMapOptions: HeatMapOptions(radius: 35),
              ),

            MarkerLayer(
              markers: [
                for (var report in reports)
                  Marker(
                    point: LatLng(
                      double.parse(report['latitud'].toString()),

                      double.parse(report['longitud'].toString()),
                    ),

                    width: 80,
                    height: 80,

                    child: const Icon(
                      Icons.location_on,

                      color: Colors.red,

                      size: 40,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildReportsList() {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text(
            "Incidentes",

            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          ListView.builder(
            shrinkWrap: true,

            physics: const NeverScrollableScrollPhysics(),

            itemCount: reports.length,

            itemBuilder: (context, index) {
              final report = reports[index];

              return Card(
                child: ListTile(
                  leading: Icon(
                    Icons.warning,

                    color: report['estado'] == 'Atendido'
                        ? Colors.green
                        : Colors.purple,
                  ),

                  title: Text(report['titulo']),

                  subtitle: Text(report['descripcion']),

                  onTap: () {
                    showDialog(
                      context: context,

                      builder: (context) {
                        return AlertDialog(
                          title: Text(report['titulo']),

                          content: Column(
                            mainAxisSize: MainAxisSize.min,

                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              detailRow("Descripción", report['descripcion']),

                              detailRow("Categoría", report['categoria']),

                              detailRow(
                                "Estado",
                                report['estado'] ?? 'Pendiente',
                              ),
                            ],
                          ),

                          actions: [
                            ElevatedButton(
                              onPressed: () async {
                                await ApiService.updateStatus(
                                  int.parse(report['id'].toString()),

                                  'Atendido',
                                );

                                Navigator.pop(context);

                                loadReports();
                              },

                              child: const Text("Atendido"),
                            ),

                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },

                              child: const Text("Cerrar"),
                            ),
                          ],
                        );
                      },
                    );
                  },

                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),

                    onPressed: () async {
                      await ApiService.deleteReport(
                        int.parse(report['id'].toString()),
                      );

                      loadReports();
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

Widget statCard(String title, String value, IconData icon) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),

      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.purple),

          const SizedBox(height: 10),

          Text(
            value,

            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 5),

          Text(title),
        ],
      ),
    ),
  );
}

Widget legendItem(Color color, String text) {
  return Row(
    children: [
      Container(
        width: 20,
        height: 20,

        decoration: BoxDecoration(
          color: color,

          borderRadius: BorderRadius.circular(5),
        ),
      ),

      const SizedBox(width: 10),

      Text(text, style: const TextStyle(fontSize: 18)),
    ],
  );
}

Widget detailRow(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          title,

          style: const TextStyle(
            fontWeight: FontWeight.bold,

            color: Colors.purple,
          ),
        ),

        const SizedBox(height: 4),

        Text(value),
      ],
    ),
  );
}
