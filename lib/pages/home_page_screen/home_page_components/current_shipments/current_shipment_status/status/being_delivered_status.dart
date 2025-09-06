import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hugeicons/hugeicons.dart';

class BeingDeliveredStatus extends StatelessWidget {
  const BeingDeliveredStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          HugeIcons.strokeRoundedAirplane02,
          color: Colors.white,
        ),
        Text(
          'قيد التوصيل',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
