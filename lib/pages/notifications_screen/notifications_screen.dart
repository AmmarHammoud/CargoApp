import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'notification_widget.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: Theme.of(context).appBarTheme.elevation,
        centerTitle: true,
        title: const Text('Notification'),
        shape: Theme.of(context).appBarTheme.shape,
        leading: IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.arrowLeft)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => NotificationWidget(),
          separatorBuilder: (context, index) => const SizedBox(
            height: 0.0,
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
