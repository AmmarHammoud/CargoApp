import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScanner extends StatelessWidget {
  const QrScanner({
    super.key,
    required this.onDetect,
  });

  final void Function(BarcodeCapture barcodes) onDetect;

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      onDetect: onDetect,
    );
  }
}
