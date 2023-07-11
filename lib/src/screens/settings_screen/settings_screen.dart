import 'package:day_night_themed_switch/day_night_themed_switch.dart';

import '../../helper/export.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Switch Theme'),
            trailing:
                Consumer<DarkThemeProvider>(builder: (context, provider, _) {
              final themeProvider = Provider.of<DarkThemeProvider>(context);
              return SizedBox(
                width: 45.49,
                height: 20.74,
                child: DayNightSwitch(
                  value: provider.darkTheme,
                  onChanged: (_) {
                    themeProvider.darkTheme = !themeProvider.darkTheme;
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
