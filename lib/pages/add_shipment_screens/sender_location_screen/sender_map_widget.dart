import 'package:carge_app/models/sender_and_recipient_locatinos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../../shared/component/show_toast.dart';
import '../../../shared/constants/app_routes.dart';
import '../../../shared/constants/constants.dart';

class SenderMapWidget extends StatefulWidget {
  const SenderMapWidget({super.key});

  @override
  State<SenderMapWidget> createState() => _SenderMapWidgetState();
}

class _SenderMapWidgetState extends State<SenderMapWidget> {
  LatLng? _tappedPoint;
  @override
  Widget build(BuildContext context) {
    // showToast(context: context, text: 'قم بتحديد موقع الإرسال', color: Constants.successColor);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        // leading: const Icon(Icons.location_on_outlined, size: 29),
        // leadingWidth: 60.0,
        title: Text('Sender location'),
        elevation: Theme.of(context).appBarTheme.elevation,
        shape: Theme.of(context).appBarTheme.shape,
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          if (_tappedPoint == null) {
            showToast(
              context: context,
              text: 'رجاء قم بتحديد موقع الإرسال',
              color: Colors.yellow[800]!,
            );
            return;
          }
          Get.toNamed(
            AppRoutes.recipientMapWidget,
            arguments: SenderAndRecipientLocations(
              senderLoc: _tappedPoint!,
              recipientLoc: null,
            ),
          );
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
