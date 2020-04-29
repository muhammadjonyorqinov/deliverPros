import 'package:deliverpros/constants.dart';
import 'package:flutter/material.dart';


class SampleFlatButton extends StatelessWidget {
  final BorderRadius borderRadius;
  final Color bgcolor;
  final Color splashColor;
  final Widget child;
  final Function onPressed;

  SampleFlatButton({
    this.borderRadius,
    this.bgcolor = product_background,
    this.splashColor = shadow_color,
    this.child,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Material(
        color: bgcolor, // button color
        child: InkWell(
          splashColor:
          splashColor, // inkwell color
          child: child,
          onTap: onPressed,
        ),
      ),
    );
  }
}
