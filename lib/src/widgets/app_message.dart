import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

class AppMessage {
  static showMessage({
    required BuildContext context,
    required String message,
    required AnimatedSnackBarType type,
  }) {
    AnimatedSnackBar.material(
      message,
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      mobilePositionSettings: const MobilePositionSettings(
        bottomOnAppearance: 20,
      ),
      type: type,
      duration: const Duration(
        seconds: 4,
      ),
    ).show(context);
  }
}
