import 'package:flutter/material.dart';

import '../theme/style.dart';

class AppButton extends StatelessWidget {
  final String text;
  final String? tag;
  final VoidCallback onPressed;

  final Color? buttonColor;
  final Color? textColor;
  final double? fontSize;
  final double? radius;
  final double? elevation;
  final EdgeInsets? padding;
  final BorderSide? side;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.buttonColor,
    this.fontSize,
    this.radius,
    this.textColor,
    this.elevation,
    this.padding,
    this.side,
    this.tag,
  });

  @override
  Widget build(BuildContext context) {
    BorderSide side_ = BorderSide.none;
    return Hero(
      tag: tag ?? "b",
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: elevation,
            padding: padding,
            backgroundColor: buttonColor ?? Styles.primary,
            shape: RoundedRectangleBorder(
              side: side ?? side_,
              borderRadius: BorderRadius.circular(
                radius ?? 13,
              ),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: textColor ?? Styles.black,
              fontSize: fontSize ?? 16,
            ),
          ),
        ),
      ),
    );
  }
}
