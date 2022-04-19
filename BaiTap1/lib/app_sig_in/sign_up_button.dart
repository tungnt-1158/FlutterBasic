import 'package:flutter/material.dart';
import 'package:baitap1/app_sig_in/custom_raise_button.dart';


class SignUpButton extends CustomRaiseButton {
  SignUpButton({
    String text: "",
    Color color: Colors.white,
    Color textColor: Colors.pinkAccent,
    VoidCallback? onPressed,
  }) : super(
    child: Text(
      text,
      style: TextStyle(color: textColor, fontSize: 18.0),
    ),
      color: color,
      height: 60.0,
      onPressed: onPressed
  );
}