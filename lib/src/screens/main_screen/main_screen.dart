import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:streamlivr/assets/assets.dart';
import 'package:streamlivr/src/constants/constants.dart';
import 'package:streamlivr/src/providers/basic_provider.dart';
import 'package:streamlivr/src/screens/discover_screen/discover_screen.dart';
import 'package:streamlivr/src/screens/following_screen/following_screen.dart';
import 'package:streamlivr/src/screens/wallet_screen/wallet_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var pages = [
      const FollowingScreen(),
      const DiscoverScreen(),
      const WalletScreen(),
    ];
    return Consumer<BasicProvider>(builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: black,
        body: pages[provider.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: primary,
            elevation: 0,
            backgroundColor: black,
            unselectedItemColor: white,
            selectedLabelStyle: TextStyle(color: white),
            currentIndex: provider.currentIndex,
            onTap: (value) => provider.changeIndex(value),
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    Assets.assetsIconsFollowingLogo,
                    color: provider.currentIndex == 0 ? primary : null,
                  ),
                  label: "Following"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    Assets.assetsIconsDiscoverLogo,
                    color: provider.currentIndex == 1 ? primary : null,
                  ),
                  label: "Discover"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    Assets.assetsIconsWalletLogo,
                    color: provider.currentIndex == 2 ? primary : null,
                  ),
                  label: "Wallet"),
            ]),
      );
    });
  }
}
