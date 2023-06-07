import 'package:flutter/material.dart';

class BuildText extends StatelessWidget {
  final String data;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  const BuildText({
    Key? key,
    required this.data,
    this.fontSize,
    this.fontWeight,
    this.color, this.textAlign,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign:textAlign ,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
