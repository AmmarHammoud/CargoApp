import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

showToast({
  required context,
  required String text,
  required Color color,
  int duration = 3,
}) {
  toastification.show(
    context: context,
    title: Text(text),
    autoCloseDuration: const Duration(seconds: 5),
  );
}
