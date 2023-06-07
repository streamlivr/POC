import 'package:flutter/material.dart';
import 'package:streamlivr/src/constants/constants.dart';
import 'package:streamlivr/src/screens/splash_screen/splash_screen.dart';
import 'package:streamlivr/src/widgets/state_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StateManager(
      child: MaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
