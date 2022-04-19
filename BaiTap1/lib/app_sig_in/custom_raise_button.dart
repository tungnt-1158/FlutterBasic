import 'package:flutter/material.dart';

class CustomRaiseButton extends StatelessWidget {

  CustomRaiseButton({
    this.child,
    this.color,
    this.connerRadius: 30.0,
    this.height: 80.0,
    this.onPressed,

  });

  final Widget? child;
  final Color? color;
  final double connerRadius;
  final double height;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
        child: child,
        color: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(connerRadius),
            )
        ),
        onPressed: onPressed,
      ),
    );
  }
}