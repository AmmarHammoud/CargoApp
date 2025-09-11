import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

showToast({
  required context,
  required String text,
  required ToastificationType color,
  int duration = 3,
}) {
  toastification.show(
    context: context,
    title: Text(text),
    type: color,
    style: ToastificationStyle.flatColored,
    autoCloseDuration: Duration(seconds: duration),
  );
}
