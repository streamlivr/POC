import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streamlivr/src/constants/constants.dart';
import 'package:streamlivr/src/helper/export.dart';
import 'package:streamlivr/src/providers/user_presence_provider.dart';
import 'package:streamlivr/src/providers/user_provider.dart';
import 'package:streamlivr/src/providers/wallet_provider.dart';
import 'package:streamlivr/src/screens/discover_screen/discover_screen.dart';
import 'package:streamlivr/src/screens/following_screen/following_screen.dart';
import 'package:streamlivr/src/screens/wallet_screen/wallet_screen.dart';

import '../../theme/style.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarIconBrightness: Brightness.dark,
    ));

    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Provider.of<UserProvider>(context, listen: false).fetchData();
      Provider.of<UserProvider>(context, listen: false)
          .fetchWalletData()
          .then((value) async {
        var data = Provider.of<UserProvider>(context, listen: false);
        Provider.of<WalletProvider>(context, listen: false)
            .fetchBalance(address: data.model1!.address ?? "");
      });
      Provider.of<UserPresenceProvider>(context, listen: false)
          .updateUserPresence(true);
      Provider.of<ChannelProvider>(context, listen: false).fetcChannel();
      Provider.of<UserProvider>(context, listen: false).checkChannel();
      Provider.of<GenreProvider>(context, listen: false).fetchList();

      Provider.of<WalletProvider>(context, listen: false).fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    var pages = [
      const FollowingScreen(),
      const DiscoverScreen(),
      const WalletScreen(),
    ];
    return Consumer<BasicProvider>(builder: (context, provider, _) {
      return Scaffold(
        body: SafeArea(
          child: AnimatedSwitcher(
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.ease,
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
                // return SlideTransition(
                //   position: Tween<Offset>(
                //     begin: const Offset(0.0, 1.0),
                //     end: const Offset(0.0, 0.0),
                //   ).animate(animation),
                //   child: child,
                // );
              },
              duration: kAninationDuration,
              child: pages[provider.currentIndex]),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Styles.primary,
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            unselectedItemColor: Styles.grayColor,
            selectedLabelStyle: const TextStyle(color: Styles.white),
            currentIndex: provider.currentIndex,
            onTap: (value) => provider.changeIndex(value),
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    Assets.assetsIconsFollowingLogo,
                    color: provider.currentIndex == 0
                        ? Styles.primary
                        : Styles.grayColor,
                  ),
                  label: "Following"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    Assets.assetsIconsDiscoverLogo,
                    color: provider.currentIndex == 1
                        ? Styles.primary
                        : Styles.grayColor,
                  ),
                  label: "Discover"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    Assets.assetsIconsWalletLogo,
                    color: provider.currentIndex == 2
                        ? Styles.primary
                        : Styles.grayColor,
                  ),
                  label: "Wallet"),
            ]),
      );
    });
  }
}
