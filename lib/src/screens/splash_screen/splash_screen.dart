import 'package:flutter/material.dart';
import 'package:streamlivr/src/routes/router.dart';
import 'package:streamlivr/src/screens/welcome_screen/welcome_screen.dart';

import '../../../assets/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 2), () {
        push(context: context, page: const WelcomeScreen());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Image.asset(Assets.assetsImagesStreamlivrLogo),
      ),
    );
  }
}
