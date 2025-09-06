import 'package:flutter/material.dart';

import '../../models/shipment_model.dart';

class OrderDetailsInfo extends StatelessWidget {
  const OrderDetailsInfo({
    super.key,
    required this.shipmentModel,
  });

  final ShipmentModel shipmentModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: const Color(0xFFCFCFCF),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'معلومات الطلب',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('السعر: 50 دولار'),
                Text('2 كغ موز + 4 كغ تفاح'),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('السعر: 50 دولار'),
                Text('2 كغ موز + 4 كغ تفاح'),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('دولار 5'),
                Text('الخصم'),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text('دولار 2'),
                Text(shipmentModel.deliveryPrice.toString()),
                Text('التوصيل'),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text('دولار 97'),
                Text(shipmentModel.totalAmount.toString()),
                Text('الإجمالي'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
