import 'package:flutter/material.dart';

import '../../models/shipment_model.dart';

class OrderDetailsPaymentMethod extends StatelessWidget {
  const OrderDetailsPaymentMethod({
    super.key,
    required this.shipmentModel,
  });

  final ShipmentModel shipmentModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Color(0xFFCFCFCF))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'طريقة الدفع',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('كاش عند الاستلام'),
                Text('طريقة الدفع'),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Color(0xFFF6E6E6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      'غير مدفوع',
                      style: TextStyle(
                        color: Color(0xFFF70707),
                      ),
                    ),
                  ),
                ),
                Text('حالة السداد'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
