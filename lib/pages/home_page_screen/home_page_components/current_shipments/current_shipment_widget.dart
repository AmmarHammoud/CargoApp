import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../../models/shipment_model.dart';
import '../../../../shared/constants/app_routes.dart';
import '../../../../shared/stripe_payment/payment_button.dart';
import 'current_shipment_components/current_shipment_pipeline.dart';
import 'current_shipment_status/current_shipment_status.dart';

class CurrentShipmentWidget extends StatelessWidget {
  const CurrentShipmentWidget({
    super.key,
    required this.shipmentModel,
  });

  final ShipmentModel shipmentModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.invoiceScreen,
            arguments: shipmentModel.id.toString());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[50],
          border: Border.all(color: Colors.pink[100]!, width: 2.0),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              CurrentShipmentPipeline(
                shipmentModel: shipmentModel,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CurrentShipmentStatus(
                    shipmentModel: shipmentModel,
                  ),
                  // Text('data'),
                  Text(shipmentModel.type),
                ],
              ),
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  // Text('ANONM15215454646'),
                  Text(shipmentModel.id.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
