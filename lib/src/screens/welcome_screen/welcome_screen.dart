import 'package:flutter/material.dart';
import 'package:streamlivr/assets/assets.dart';
import 'package:streamlivr/src/routes/router.dart';
import 'package:streamlivr/src/screens/authentification_screen/signup_screen.dart';
import 'package:streamlivr/src/widgets/app_button.dart';
import 'package:streamlivr/src/widgets/build_text.dart';
import 'package:streamlivr/src/widgets/vertical_space.dart';

import '../../theme/style.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(Assets.assetsImagesBackgroundImage))),
      child: Scaffold(
        backgroundColor: Styles.transparent,
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Hero(
                tag: "title",
                child: BuildText(
                  data: 'Welcome to Streamlivr! 👋',
                  fontSize: 40,
                  color: Styles.white,
                  textAlign: TextAlign.center,
                ),
              ),
              const Verticalspace(space: 24),
              const BuildText(
                  color: Styles.white,
                  textAlign: TextAlign.center,
                  fontSize: 12,
                  data: '''Watch and chat with millions of other fans
from around the world you can start earning from livestreaming or watching other livestream earners content'''),
              const Verticalspace(space: 24),
              AppButton(
                text: 'Continue',
                textColor: Styles.white,
                onPressed: () {
                  push(context: context, page: const SignUpScreen());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
