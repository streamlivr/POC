import 'package:flutter/material.dart';

import '../../theme/style.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Styles.transparent,
      body: Center(
        child: Text('WalletScreen'),
      ),
    );
  }
}
