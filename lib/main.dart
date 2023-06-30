import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamlivr/src/constants/constants.dart';
import 'package:streamlivr/src/providers/dark_theme_provider.dart';
import 'package:streamlivr/src/screens/splash_screen/splash_screen.dart';
import 'package:streamlivr/src/theme/style.dart';
import 'package:streamlivr/src/widgets/state_manager.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StateManager(
      child: Consumer<DarkThemeProvider>(
        builder: (context, provider, _) {
          return MaterialApp(
            title: appName,
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(provider.darkTheme, context),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
