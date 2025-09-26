import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong2/latlong.dart';

class ThirdScreen extends StatelessWidget {
  // Definição do PopupController para controlar a abertura/fechamento do popup
  final PopupController _popupController = PopupController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(
            -7.9935,
            -34.8509,
          ), // Coordenadas do Alto da Sé, Olinda
          zoom: 15.0, // Nível de zoom inicial
          onTap: (_, __) =>
              _popupController.hideAllPopups(), // Fecha popups ao tocar fora
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          PopupMarkerLayerWidget(
            options: PopupMarkerLayerOptions(
              popupController: _popupController,
              markers: [
                Marker(
                  point: LatLng(-7.9935, -34.8509), // Coordenadas do Alto da Sé
                  width: 80.0,
                  height: 80.0,
                  builder: (ctx) =>
                      Icon(Icons.location_on, color: Colors.red, size: 40.0),
                ),
              ],
              popupDisplayOptions: PopupDisplayOptions(
                builder: (BuildContext context, Marker marker) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Alto da Sé, Olinda',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'O Alto da Sé é um ponto turístico famoso em Olinda, '
                          'com vista panorâmica, igrejas históricas e um pôr do sol deslumbrante.',
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
