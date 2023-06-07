import 'package:flutter/material.dart';

class Verticalspace extends StatelessWidget {
  final double space;
  const Verticalspace({
    Key? key,
    required this.space,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: space,
    );
  }
}
