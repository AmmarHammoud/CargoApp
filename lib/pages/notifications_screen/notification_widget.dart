import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    // required this.notificationModel,
  });

  // final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.5,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(15.0), // Rounded corners for the card
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              child: Image.asset('assets/images/apple 1.png'),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Transferred from bank balance',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      '12 min ago',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    CircleAvatar(
                      radius: 3.5,
                      // foregroundColor: Colors.blueAccent,
                      backgroundColor: Colors.blueAccent,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
