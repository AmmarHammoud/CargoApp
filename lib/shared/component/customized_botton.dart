import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'my_loader_indicator.dart';

class CustomizedButton extends StatelessWidget {
  final String title;
  final bool condition;
  final Function() onPressed;
  final Color _color;

  CustomizedButton({
    super.key,
    required this.title,
    required this.condition,
    required this.onPressed,
    Color? color,
  }) : _color = color ?? Constants.primaryColor;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: condition,
      builder: (context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(410, 55),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          backgroundColor: _color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      fallback: (context) => const Center(
        child: MyLoaderIndicator()
      ),
    );
  }
}
