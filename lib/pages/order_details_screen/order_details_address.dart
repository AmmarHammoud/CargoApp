import 'package:flutter/material.dart';

import '../../models/shipment_model.dart';

class OrderDetailsAddress extends StatelessWidget {
  const OrderDetailsAddress({
    super.key,
    required this.shipmentModel,
  });

  final ShipmentModel shipmentModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFCFCFCF),
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'تفاصيل العنوان',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Color(0xFFEAFFF3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      'المنزل',
                      style: TextStyle(
                        color: Color(0xFF28C76F),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('دمشق مزة قديمة'),
                    Text('شارع: شارع الأمين'),
                    Text('اسم المستلم: حسام زينه'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
