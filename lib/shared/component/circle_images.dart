
import 'dart:ui';

import 'package:flutter/cupertino.dart';

class CircleImageWithBorder extends StatelessWidget {
  final Color borderColor ;
  final double borderWidth ;
  final ImageProvider  imagePath;
  final double size;



  CircleImageWithBorder ({
    Key? key,
    required this.borderColor,
    required this.borderWidth,
    required this.imagePath,
    required this.size,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: borderWidth
        ),
        image: DecorationImage(image: imagePath,fit: BoxFit.cover)
      ),

    );
  }
}
