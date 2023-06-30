import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamlivr/src/providers/my_stream_provider.dart';

import '../helper/export.dart';
import '../providers/user_provider.dart';

class StateManager extends StatelessWidget {
  final Widget child;
  const StateManager({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyStreamProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ChannelProvider()),
        ChangeNotifierProvider(create: (context) => GenreProvider()),
        ChangeNotifierProvider(create: (context) => DarkThemeProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => AuthentificationProvider()),
        ChangeNotifierProvider(create: (context) => BasicProvider()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, _) {
            return child;
          }),
    );
  }
}
