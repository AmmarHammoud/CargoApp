import 'package:flutter/material.dart';

class WaitingForDriverStatus extends StatelessWidget {
  const WaitingForDriverStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.timelapse,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'بانتظار مندوب',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
