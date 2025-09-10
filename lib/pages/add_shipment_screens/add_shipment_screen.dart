import 'package:carge_app/pages/add_shipment_screens/sender_location_screen/sender_map_widget.dart';

import '../add_shipment_screens/recipient_info_screen/recipient_map_widget.dart';
import 'package:flutter/material.dart';

class AddShipmentScreen extends StatelessWidget {
  const AddShipmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SenderMapWidget();
  }
}
