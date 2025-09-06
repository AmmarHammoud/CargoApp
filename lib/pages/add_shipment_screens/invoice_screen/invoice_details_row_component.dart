import 'package:flutter/material.dart';

import '../../../shared/constants/constants.dart';

class InvoiceDetailsRowComponent extends StatelessWidget {
  const InvoiceDetailsRowComponent({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Icon(
          icon,
          color: Constants.primaryColor,
        ),
        SizedBox(
          width: screenWidth * 0.03,
        ),
        Text(
          '$title: ',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Text(value, style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.grey[600]),),
      ],
    );
  }
}
