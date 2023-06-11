// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../theme/style.dart';

class AppPasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hint;
  final String? Function(String? value)? validator;
  final bool? isPassword;
  final TextInputType? keyboardType;
  const AppPasswordTextField({
    Key? key,
    required this.controller,
    this.hint,
    this.isPassword,
    this.keyboardType,
    this.validator,
  }) : super(key: key);

  @override
  State<AppPasswordTextField> createState() => _AppPasswordTextFieldState();
}

class _AppPasswordTextFieldState extends State<AppPasswordTextField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: TextInputType.visiblePassword,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hint,
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              icon: const Icon(
                Icons.remove_red_eye,
              )),
        ),
        obscureText: isVisible,
      ),
    );
  }
}
