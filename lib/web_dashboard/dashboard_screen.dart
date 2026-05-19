import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_map_heatmap/flutter_map_heatmap.dart';

import '../services/api_service.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
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

class _DashboardScreenState extends State<DashboardScreen> {
  List reports = [];
  List<WeightedLatLng> heatPoints = [];

  int acoso = 0;
  int robo = 0;
  int violencia = 0;

  bool loading = true;

  String filtro = 'Todas';

  @override
  void initState() {
    super.initState();
    loadReports();
    // RECARGA AUTOMÁTICA
    Future.delayed(const Duration(seconds: 10), refreshLoop);
  }

  Future<void> loadReports() async {
    final data = await ApiService.getReports();

    setState(() {
      reports = data;

      heatPoints = reports.map((report) {
        return WeightedLatLng(
          LatLng(
            double.parse(report['latitud'].toString()),
            double.parse(report['longitud'].toString()),
          ),
          1,
        );
      }).toList();

      acoso = reports.where((r) => r['categoria'] == 'Acoso').length;
      robo = reports.where((r) => r['categoria'] == 'Robo').length;
      violencia = reports.where((r) => r['categoria'] == 'Violencia').length;
      loading = false;
    });
  }

  void refreshLoop() async {
    while (mounted) {
      await loadReports();
      await Future.delayed(const Duration(seconds: 10));
    }
  }

  @override
  Widget build(BuildContext context) {
    List filteredReports = filtro == 'Todas'
        ? reports
        : reports.where((r) => r['categoria'] == filtro).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F3FF),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF6D28D9)),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                mainAxisAlignment: MainAxisAlignment.end,

                children: const [
                  Icon(Icons.shield, color: Colors.white, size: 50),

                  SizedBox(height: 10),

                  Text(
                    "Alerta Violeta",

                    style: TextStyle(
                      color: Colors.white,

                      fontSize: 24,

                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.dashboard),

              title: const Text("Dashboard"),

              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.map),

              title: const Text("Mapa"),

              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.bar_chart),

              title: const Text("Estadísticas"),

              onTap: () {},
            ),
          ],
        ),
      ),

      appBar: AppBar(
        title: const Text("Dashboard Alerta Violeta"),

        backgroundColor: const Color(0xFF6D28D9),
      ),

      body: loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    "Total reportes: ${reports.length}",
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Conectado en tiempo real",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // FILTRO
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),

                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: DropdownButton<String>(
                      value: filtro,

                      underline: const SizedBox(),

                      items: ['Todas', 'Acoso', 'Robo', 'Violencia'].map((
                        categoria,
                      ) {
                        return DropdownMenuItem(
                          value: categoria,

                          child: Text(categoria),
                        );
                      }).toList(),

                      onChanged: (value) {
                        setState(() {
                          filtro = value!;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  // CARDS
                  Row(
                    children: [
                      statCard(
                        "Total",
                        reports.length.toString(),
                        Icons.warning,
                      ),

                      const SizedBox(width: 15),

                      statCard("Acoso", acoso.toString(), Icons.person),

                      const SizedBox(width: 15),

                      statCard("Robos", robo.toString(), Icons.dangerous),

                      const SizedBox(width: 15),

                      statCard("Violencia", violencia.toString(), Icons.gavel),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // GRAFICA
                  SizedBox(
                    height: 350,

                    child: Card(
                      elevation: 5,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(20),

                        child: BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.spaceAround,

                            maxY: 10,

                            barTouchData: BarTouchData(enabled: true),

                            titlesData: FlTitlesData(
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: true),
                              ),

                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,

                                  getTitlesWidget: (value, meta) {
                                    switch (value.toInt()) {
                                      case 0:
                                        return const Text("Acoso");

                                      case 1:
                                        return const Text("Robos");

                                      case 2:
                                        return const Text("Violencia");
                                    }

                                    return const Text('');
                                  },
                                ),
                              ),
                            ),

                            borderData: FlBorderData(show: false),

                            barGroups: [
                              BarChartGroupData(
                                x: 0,

                                barRods: [
                                  BarChartRodData(
                                    toY: acoso.toDouble(),

                                    color: Colors.purple,
                                  ),
                                ],
                              ),

                              BarChartGroupData(
                                x: 1,

                                barRods: [
                                  BarChartRodData(
                                    toY: robo.toDouble(),

                                    color: Colors.red,
                                  ),
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
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // MAPA + LISTA
                  SizedBox(
                    height: 600,

                    child: Row(
                      children: [
                        // LISTA
                        Expanded(
                          flex: 1,

                          child: ListView.builder(
                            itemCount: filteredReports.length,

                            itemBuilder: (context, index) {
                              final report = filteredReports[index];

                              return Card(
                                child: ListTile(
                                  leading: const Icon(
                                    Icons.warning,
                                    color: Colors.purple,
                                  ),

                                  title: Text(report['titulo'] ?? ''),

                                  subtitle: Text(report['descripcion'] ?? ''),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          title: Text(report['titulo'] ?? ''),
                                          content: SizedBox(
                                            width: 400,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                detailRow(
                                                  "Descripción",
                                                  report['descripcion'] ?? '',
                                                ),
                                                detailRow(
                                                  "Categoría",
                                                  report['categoria'] ?? '',
                                                ),
                                                detailRow(
                                                  "Estado",
                                                  report['estado'] ??
                                                      'Pendiente',
                                                ),
                                                detailRow(
                                                  "Latitud",
                                                  report['latitud'].toString(),
                                                ),
                                                detailRow(
                                                  "Longitud",
                                                  report['longitud'].toString(),
                                                ),
                                                detailRow(
                                                  "Fecha",
                                                  report['created_at']
                                                      .toString(),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            ElevatedButton.icon(
                                              icon: const Icon(Icons.close),
                                              label: const Text("Cerrar"),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () async {
                                          await ApiService.deleteReport(
                                            int.parse(report['id'].toString()),
                                          );
                                          loadReports();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(width: 20),

                        // MAPA
                        Expanded(
                          flex: 2,

                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,

                                  blurRadius: 10,
                                ),
                              ],
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
                                    urlTemplate:
                                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',

                                    userAgentPackageName:
                                        'com.example.alertavioleta',
                                  ),

                                  HeatMapLayer(
                                    heatMapDataSource:
                                        InMemoryHeatMapDataSource(
                                          data: heatPoints,
                                        ),
                                    heatMapOptions: HeatMapOptions(
                                      radius: 35,
                                      blurFactor: 0.7,
                                      minOpacity: 0.3,
                                    ),
                                  ),
                                  MarkerLayer(
                                    markers: [
                                      for (var report in filteredReports)
                                        Marker(
                                          point: LatLng(
                                            double.parse(
                                              report['latitud'].toString(),
                                            ),

                                            double.parse(
                                              report['longitud'].toString(),
                                            ),
                                          ),

                                          width: 80,
                                          height: 80,

                                          child: Tooltip(
                                            message:
                                                "${report['titulo']}\n${report['descripcion']}",

                                            child: const Icon(
                                              Icons.location_on,

                                              color: Colors.red,

                                              size: 40,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
