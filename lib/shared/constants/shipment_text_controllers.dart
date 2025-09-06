import 'package:flutter/material.dart';

class ShipmentTextControllers {
  late TextEditingController shipmentTypeController;
  late TextEditingController numberOfPiecesController;
  late TextEditingController weightController;
  late TextEditingController productValueController;
  late TextEditingController senderLatController;
  late TextEditingController senderLngController;

  ShipmentTextControllers() {
    shipmentTypeController = TextEditingController();
    numberOfPiecesController = TextEditingController();
    weightController = TextEditingController();
    productValueController = TextEditingController();
    senderLatController = TextEditingController();
    senderLngController = TextEditingController();
  }

  dispose() {
    shipmentTypeController.dispose();
    numberOfPiecesController.dispose();
    weightController.dispose();
    productValueController.dispose();
    senderLatController.dispose();
    senderLngController.dispose();
  }
}
