import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'current_shipment_step.dart';

List<EasyStep> currentShipmentSteps({
  required double stepRadius,
}) {
  return [
    EasyStep(
      customStep: CurrentShipmentStep(
        icon: Icons.add,
        stepRadius: stepRadius,
      ),
    ),
    EasyStep(
      customStep: CurrentShipmentStep(
        icon: Icons.fire_truck_outlined,
        stepRadius: stepRadius,
      ),
    ),
    EasyStep(
      customStep: CurrentShipmentStep(
        icon: Icons.access_alarm,
        stepRadius: stepRadius,
      ),
    ),
    EasyStep(
      customStep: CurrentShipmentStep(
        icon: Icons.airplane_ticket_outlined,
        stepRadius: stepRadius,
      ),
    ),
    EasyStep(
      customStep: CurrentShipmentStep(
        icon: Icons.house_siding,
        stepRadius: stepRadius,
      ),
    ),
    EasyStep(
      customStep: CurrentShipmentStep(
        icon: Icons.house_siding,
        stepRadius: stepRadius,
      ),
    ),
    EasyStep(
      customStep: CurrentShipmentStep(
        icon: Icons.house_siding,
        stepRadius: stepRadius,
      ),
    ),
    EasyStep(
      customStep: CurrentShipmentStep(
        icon: Icons.house_siding,
        stepRadius: stepRadius,
      ),
    ),
    // EasyStep(
    //   customStep: CurrentShipmentStep(
    //     icon: Icons.house_siding,
    //     stepRadius: stepRadius,
    //   ),
    // ),
  ];
}
