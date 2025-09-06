import 'package:flutter/material.dart';

class AppBarIconComponent extends StatelessWidget {
  const AppBarIconComponent({
    super.key,
    required this.icon,
    this.onTap,
  });

  final IconData icon;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        color: Colors.white,
        size: 25,
      ),
    );
  }
}
