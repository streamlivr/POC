import 'package:flutter/material.dart';

pop({
  required BuildContext context,
}) {
  Navigator.pop(context);
}

push({
  required BuildContext context,
  required Widget page,
}) {
  Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
          opacity: animation,
          child: page,
        ),
      ));
}

pushReplacement({
  required BuildContext context,
  required Widget page,
}) {
  Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
          opacity: animation,
          child: page,
        ),
      ));
}

pushRemoveAll({
  required BuildContext context,
  required Widget page,
}) {
  Navigator.pushAndRemoveUntil(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
        opacity: animation,
        child: page,
      ),
    ),
    (route) => false,
  );
}
