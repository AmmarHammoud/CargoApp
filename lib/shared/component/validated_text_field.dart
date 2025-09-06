
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ValidatedTextField extends StatelessWidget {
  final GlobalKey<FormState> validator;
  final String errorText;
  final String hintText;
  final bool hasNextText;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final TextEditingController controller;
  final bool enable;
  final IconData? icon;
  final Widget? suffixIcon;
  final bool obscureText;
  final double fontSize;
  final double radius;

  const ValidatedTextField(
      {Key? key,
        required this.controller,
        required this.validator,
        required this.errorText,
        required this.hintText,
        this.onChanged,
        this.onFieldSubmitted,
        this.hasNextText = true,
        this.enable = true,
        this.icon,
        this.suffixIcon,
        this.obscureText = false,
        this.fontSize = 20.0,
        this.radius = 15.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextInputType? textInputType;
    if (hintText == 'email') {
      textInputType = TextInputType.emailAddress;
    } else if (hintText == 'phone number') {
      textInputType = TextInputType.phone;
    }
    return Form(
      key: validator,
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        controller: controller,
        enabled: enable,
        textInputAction:
        hasNextText ? TextInputAction.next : TextInputAction.done,
        keyboardType: textInputType,
        obscureText: obscureText,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorText;
          }
          return null;
        },
        onChanged: onChanged,
        style: TextStyle(fontSize: fontSize),
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          prefixIcon: Icon(icon, color: Constants.primaryColor,),
        ),
      ),
    );
  }
}



