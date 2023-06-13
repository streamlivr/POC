import 'package:flutter/material.dart';
import 'package:streamlivr/src/widgets/build_text.dart';

import '../../constants/constants.dart';
import '../../theme/style.dart';
import '../../widgets/my_app_bar.dart';
import '../../widgets/vertical_space.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.transparent,
      body: Column(
        children: [
          const Verticalspace(space: 24),
          Padding(
            padding: screenPadding,
            child: MyAppBar(
              pageTitle: 'Wallet',
              onPressed: () {},
            ),
          ),
          const Verticalspace(space: 60),
          const BuildText(data: 'wallet balance'),
          RichText(
              text: const TextSpan(children: [
            TextSpan(text: '35,850.124'),
            TextSpan(text: 'STVR'),
          ])),
          RichText(
              text: const TextSpan(children: [
            TextSpan(text: '107,550.124'),
            TextSpan(text: 'USD'),
          ])),
        ],
      ),
    );
  }


  
}
