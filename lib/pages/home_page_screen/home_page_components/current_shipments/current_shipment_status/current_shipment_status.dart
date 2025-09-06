import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import '../../../../../models/shipment_model.dart';
import '../../../../../shared/constants/shipment_status.dart';
import 'status/being_delivered_status.dart';
import 'status/waiting_for_driver_status.dart';

class CurrentShipmentStatus extends StatelessWidget {
  const CurrentShipmentStatus({
    super.key,
    required this.shipmentModel,
  });

  final ShipmentModel shipmentModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink[900],
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ConditionalBuilder(
          condition: shipmentModel.status == ShipmentStatus.pending,
          builder: (context) => const WaitingForDriverStatus(),
          fallback: (context) => const BeingDeliveredStatus(),
        ),
      ),
    );
  }
}
