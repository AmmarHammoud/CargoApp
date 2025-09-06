import 'package:flutter/material.dart';

class CurrentShipmentStep extends StatelessWidget {
  const CurrentShipmentStep({
    super.key,
    required this.icon,
    required this.stepRadius,
  });

  final IconData icon;

  final double stepRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: stepRadius * 1.5,
      height: stepRadius * 1.5,
      // decoration: const BoxDecoration(
      //   color: Colors.red,
      //   shape: BoxShape.circle,
      // ),
      // color: Colors.red,
      child: Icon(
        icon,
        color: Colors.white,
        size: stepRadius * 1.2,
      ),
    );
  }
}
