import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamlivr/src/providers/authentification_provider.dart';
import 'package:streamlivr/src/providers/basic_provider.dart';

class StateManager extends StatelessWidget {
  final Widget child;
  const StateManager({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (context) => OnboardingController()),
        // ChangeNotifierProvider(create: (context) => SplashController()),
        // ChangeNotifierProvider(create: (context) => MainController()),
        ChangeNotifierProvider(create: (context) => AuthentificationProvider()),
        ChangeNotifierProvider(create: (context) => BasicProvider()),
      ],
      child: child,
    );
  }
}
