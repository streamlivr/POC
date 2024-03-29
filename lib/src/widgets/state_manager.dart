import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:streamlivr/src/providers/ads_provider.dart';
import 'package:streamlivr/src/providers/my_stream_provider.dart';
import 'package:streamlivr/src/providers/wallet_provider.dart';

import '../helper/export.dart';
import '../providers/user_presence_provider.dart';
import '../providers/user_provider.dart';

class StateManager extends StatefulWidget {
  final Widget child;
  const StateManager({Key? key, required this.child}) : super(key: key);

  @override
  State<StateManager> createState() => _StateManagerState();
}

class _StateManagerState extends State<StateManager> {
  DarkThemeProvider themeProvider = DarkThemeProvider();

  init() async {
    await themeProvider.getTheme();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AdsProvider()),
        ChangeNotifierProvider(create: (context) => WalletProvider()),
        ChangeNotifierProvider(create: (context) => MyStreamProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ChannelProvider()),
        ChangeNotifierProvider(create: (context) => UserPresenceProvider()),
        ChangeNotifierProvider(create: (context) => GenreProvider()),
        ChangeNotifierProvider.value(value: themeProvider),
        ChangeNotifierProvider(create: (context) => AuthentificationProvider()),
        ChangeNotifierProvider(create: (context) => BasicProvider()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, _) {
            return OKToast(
              child: widget.child,
            );
          }),
    );
  }
}

class AppLifecycleObserver extends WidgetsBindingObserver {
  final UserPresenceProvider userPresenceProvider;

  AppLifecycleObserver(this.userPresenceProvider);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
        userPresenceProvider.updateUserPresence(false);
        break;
      case AppLifecycleState.resumed:
        userPresenceProvider.updateUserPresence(true);
        break;
    }
  }
}
