import 'package:flutter/material.dart';
import 'package:streamlivr/src/routes/router.dart';
import 'package:streamlivr/wrapper.dart';

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
    inti();
  }

  inti() {
      Future.delayed(const Duration(seconds: 2), () {
        push(context: context, page: const Wrapper());
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
