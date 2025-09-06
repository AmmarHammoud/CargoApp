
import 'package:flutter/material.dart';

class ImageComponent extends StatelessWidget {
  const ImageComponent({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: Colors.yellow[700]!),
      ),
        child: Image.network(url, width: 300, height: 600, fit: BoxFit.contain,));
  }
}
