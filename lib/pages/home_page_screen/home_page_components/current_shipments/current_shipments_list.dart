import 'package:flutter/material.dart';
import '../../../../models/shipment_model.dart';
import 'current_shipment_widget.dart';

class CurrentShipmentsList extends StatelessWidget {
  const CurrentShipmentsList({super.key, required this.shipments});

  final List<ShipmentModel> shipments;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .675,
      child: ListView.separated(
        itemBuilder: (context, idx) =>
            CurrentShipmentWidget(shipmentModel: shipments[idx]),
        separatorBuilder: (context, idx) => const SizedBox(height: 5),
        itemCount: shipments.length,
      ),
    );
  }
}
