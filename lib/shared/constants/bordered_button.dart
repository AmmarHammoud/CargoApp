import 'package:flutter/material.dart';

class BorderedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color borderColor;
  final Color textColor;
  final double borderWidth;
  final double borderRadius;
  final EdgeInsets padding;

  const BorderedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.borderColor = Colors.blue,
    this.textColor = Colors.blue,
    this.borderWidth = 2,
    this.borderRadius = 8,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor, backgroundColor: Colors.transparent,
        side: BorderSide(color: borderColor, width: borderWidth),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
      ),
      child: Text(text),
    );
  }
}