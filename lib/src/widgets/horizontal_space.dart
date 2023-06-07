import 'package:flutter/material.dart';

class Horizontalspace extends StatelessWidget {
  final double space;
  const Horizontalspace({
    Key? key,
    required this.space,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: space,
    );
  }
}
