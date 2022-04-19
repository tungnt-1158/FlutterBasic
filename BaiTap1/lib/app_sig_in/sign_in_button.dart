import 'package:flutter/material.dart';
import 'package:baitap1/app_sig_in/custom_raise_button.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;


class SignInButton extends CustomRaiseButton {
  SignInButton({
    String text: "",
    Color color: Colors.white,
    Color textColor: Colors.pinkAccent,
    String image: "",
    VoidCallback? onPressed,
  }) : super(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                Image.file(
                  File(image),
                ),
                Text(
                  text,
                  style: TextStyle(color: textColor, fontSize: 18.0),
                ),
                Opacity(
                  opacity: 0.0,
                  child: Image.file(
                    File(image),
                  ),
                ),
              ]
            ),
            color: color,
            height: 60.0,
            onPressed: onPressed);
}