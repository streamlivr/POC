// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:streamlivr/src/constants/constants.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final int? minLines;
  final int? maxLines;
  final Widget? prefix;
  final EdgeInsets? padding;
  final String? Function(String? value)? validator;
  final Color? borderColor;
  final TextInputType? keyboardType;
  const AppTextField({
    Key? key,
    required this.controller,
    this.hint,
    this.keyboardType,
    this.borderColor,
    this.minLines,
    this.maxLines,
    this.padding,
    this.validator,
    this.prefix,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      color: white,
      child: TextFormField(
        controller: controller,
        minLines: minLines,
        maxLines: maxLines,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: prefix,
        ),
      ),
    );
  }
}
