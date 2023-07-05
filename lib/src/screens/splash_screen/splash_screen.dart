import 'package:flutter/material.dart';
import 'package:streamlivr/src/routes/router.dart';
import 'package:streamlivr/wrapper.dart';

import '../../../assets/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<Alignment>? _animation;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300), // Set the duration of the animation
      vsync: this,
    );
    _animation = _animationController!.drive(
      AlignmentTween(
        begin: Alignment.bottomCenter,
        end: Alignment.center,
      ),
    );
    _animationController!.forward().then((value) {
      push(context: context, page: const Wrapper());
    });
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  inti() {
    Future.delayed(const Duration(seconds: 2), () {
      push(context: context, page: const Wrapper());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: _animation!,
          builder: (context, child) {
            return Align(
              alignment: _animation!.value,
              child: Hero(
                tag: "title",
                child: Image.asset(Assets.assetsImagesStreamlivrLogo),
              ),
            );
          }),
    );
  }
}
