import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../../shared/component/show_toast.dart';
import '../../../shared/constants/app_routes.dart';
import '../../../shared/constants/constants.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  LatLng? _tappedPoint;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          if (_tappedPoint == null) {
            showToast(
              context: context,
              text: 'رجاء قم بتحديد موقع المستلم',
              color: Colors.yellow[800]!,
            );
            return;
          }
          Get.toNamed(AppRoutes.recipientInfoScreen, arguments: _tappedPoint);
        },
        child: Text(
          'Next',
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(color: Colors.white),
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Constants.primaryColor),
        ),
      ),
      body: FlutterMap(
        options: MapOptions(
          onTap: (tapPos, latLng) {
            print(tapPos);
            print(latLng);
            setState(() {
              _tappedPoint = latLng;
            });
          },
          initialCenter: LatLng(33.510414, 36.278336),
          initialZoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            // + many other options
          ),
          if (_tappedPoint != null)
            MarkerLayer(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: _tappedPoint!,
                  child: const Icon(
                    Icons.location_pin,
                    color: Colors.red,
                    size: 40.0,
                  ),
                ),
              ],
            ),
          // TileLayer(
          //   urlTemplate:
          //       'https://tile.stamen.com/terrain/{z}/{x}/{y}.jpg',
          //   userAgentPackageName: 'com.example.app',
          // ),
        ],
      ),
    );
  }
}
