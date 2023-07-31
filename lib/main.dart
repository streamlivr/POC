import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:streamlivr/src/constants/constants.dart';
import 'package:streamlivr/src/providers/dark_theme_provider.dart';
import 'package:streamlivr/src/providers/user_presence_provider.dart';
import 'package:streamlivr/src/screens/splash_screen/splash_screen.dart';
import 'package:streamlivr/src/theme/style.dart';
import 'package:streamlivr/src/widgets/state_manager.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Styles.transparent));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  DarkThemeProvider d = DarkThemeProvider();
  await d.getTheme();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppLifecycleObserver lifecycleObserver =
      AppLifecycleObserver(UserPresenceProvider());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addObserver(lifecycleObserver);
    return StateManager(
      child: Consumer<DarkThemeProvider>(
        builder: (context, provider, _) {
          return MaterialApp(
            title: appName,
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(provider.darkTheme, context),
            darkTheme: Styles.themeData(provider.darkTheme, context),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
