import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProcessingDialog {
  static showProcessingDialog({
    required BuildContext context,
  }) {
    showGeneralDialog(
        barrierDismissible: false,
        context: context,
        pageBuilder: (c, v, g) {
          return Center(
            child: SizedBox(
              height: 150,
              width: 150,
              child: LottieBuilder.asset(
                'assets/animations/loading.json',
              ),
            ),
          );
        });
  }

  static cancelDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
