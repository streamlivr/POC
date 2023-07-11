import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:streamlivr/src/widgets/app_message.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class ReceiveScreen extends StatelessWidget {
  final String token;
  final String address;
  const ReceiveScreen({
    Key? key,
    required this.token,
    required this.address,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Receive LSK"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: SfBarcodeGenerator(
              value: address,
              symbology: QRCode(),
              showValue: true,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: address)).then((value) {
                AppMessage.showMessage(
                  context: context,
                  message: 'Copied to clipboard',
                  type: AnimatedSnackBarType.info,
                );
              });
            },
            child: const Text('Copy'),
          )
        ],
      ),
    );
  }
}
