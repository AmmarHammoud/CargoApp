import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageButton extends StatelessWidget {
  const HomePageButton({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final Color color;
  final IconData icon;
  final String title;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final MaterialColor materialColor = color as MaterialColor;
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    // return InkWell(
    //   onTap: () {},
    //   child: Container(
    //     width: screenWidth * 0.40,
    //     height: screenHeight * 0.14,
    //     padding: const EdgeInsets.all(20.0),
    //     decoration: BoxDecoration(
    //       color: materialColor[50],
    //       border: Border.all(color: materialColor[200]!),
    //       borderRadius: BorderRadius.circular(15),
    //     ),
    //     child: Column(
    //       children: [
    //         Icon(
    //           icon,
    //           size: 40,
    //           color: materialColor[400],
    //         ),
    //         const SizedBox(height: 5,),
    //         Text(
    //           title,
    //           // style: TextStyle(fontSize: 16, color: materialColor[400]),
    //           style: Theme.of(context)
    //               .textTheme
    //               .bodyMedium!
    //               .apply(color: materialColor[400]),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: Theme.of(context).primaryColor, size: 32,),
          SizedBox(height: 7,),
          Text(title)
        ],
      ),
    );
  }
}
