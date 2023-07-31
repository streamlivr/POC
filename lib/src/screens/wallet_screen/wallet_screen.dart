// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:streamlivr/assets/assets.dart';
// import 'package:streamlivr/src/screens/wallet_screen/pages/nfts_screen.dart';
// import 'package:streamlivr/src/screens/wallet_screen/pages/transaction_screen.dart';
// import 'package:streamlivr/src/screens/wallet_screen/pages/utilities_screen.dart';
// import 'package:streamlivr/src/widgets/build_text.dart';
// import 'package:streamlivr/src/widgets/horizontal_space.dart';

// import '../../constants/constants.dart';
// import '../../routes/router.dart';
// import '../../theme/style.dart';
// import '../../widgets/my_app_bar.dart';
// import '../../widgets/vertical_space.dart';
// import '../profile_screen/profile_screen.dart';

import 'dart:developer';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:streamlivr/src/constants/constants.dart';
import 'package:streamlivr/src/helper/export.dart';
import 'package:streamlivr/src/providers/user_provider.dart';
import 'package:streamlivr/src/providers/wallet_provider.dart';
import 'package:streamlivr/src/screens/receive_screen/receive_screen.dart';
import 'package:streamlivr/src/screens/wallet_screen/pages/currencies_screen.dart';
import 'package:streamlivr/src/screens/wallet_screen/pages/nfts_screen.dart';
import 'package:streamlivr/src/screens/wallet_screen/pages/transaction_screen.dart';
import 'package:streamlivr/src/screens/wallet_screen/pages/utilities_screen.dart';

import '../../models/currencies_model.dart';
import '../../routes/router.dart';
import '../../theme/style.dart';
import '../../widgets/build_text.dart';
import '../../widgets/horizontal_space.dart';
import '../../widgets/my_app_bar.dart';
import '../../widgets/vertical_space.dart';
import '../profile_screen/profile_screen.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async =>
              Provider.of<WalletProvider>(context, listen: false).fetchData(),
          child: Column(
            children: [
              const Verticalspace(space: 24),
              Padding(
                padding: screenPadding,
                child: MyAppBar(
                  pageTitle: 'Wallet',
                  onPressed: () {
                    push(context: context, page: const ProfileScreen());
                  },
                ),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 4, // Replace with the number of tabs you have
                  child: CustomScrollView(
                    shrinkWrap: true,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            const Verticalspace(space: 40),
                            const BuildText(
                              data: 'Balance',
                              color: Color(0xffbac4d1),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            const Verticalspace(space: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(Assets.assetsIconsStreamlivrCoin),
                                const Text(
                                  'STVR',
                                  style: TextStyle(
                                    // color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                  // color: Colors.white,
                                )
                              ],
                            ),
                            Consumer<WalletProvider>(
                              builder: (context, provider, _) {
                                log(provider.model.toString());
                                log(provider.isLoading.toString());
                                if (provider.isLoading) {
                                  return const CircularProgressIndicator();
                                } else if (provider.hasData) {
                                  return RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: provider
                                            .model!.data!.first.token!.balance
                                            .toString(),
                                        style: const TextStyle(
                                          color: Styles.white,
                                          fontSize: 36,
                                          fontWeight: FontWeight.w600,
                                        )),
                                    const TextSpan(
                                        text: 'LSK',
                                        style: TextStyle(
                                          // color: Styles.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        )),
                                  ]));
                                } else {
                                  return RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: '3',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .color,
                                          fontSize: 36,
                                          fontWeight: FontWeight.w600,
                                        )),
                                    TextSpan(
                                        text: 'LSK',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .color,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        )),
                                  ]));
                                }
                              },
                            ),
                            // RichText(
                            //     text: const TextSpan(children: [
                            //   TextSpan(
                            //       text: '0 ',
                            //       style: TextStyle(
                            //         color: Styles.white,
                            //         fontSize: 14,
                            //         fontWeight: FontWeight.w300,
                            //       )),
                            //   TextSpan(
                            //       text: 'USD',
                            //       style: TextStyle(
                            //         color: Styles.white,
                            //         fontSize: 14,
                            //         fontWeight: FontWeight.w300,
                            //       )),
                            // ])),
                            const Verticalspace(space: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buildOptionWidget(
                                    onTap: () {},
                                    backgroundColor: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .color,
                                    data: 'Send',
                                    icon: Assets.assetsIconsUpArrow),
                                const Horizontalspace(space: 30),
                                buildOptionWidget(
                                    onTap: () {
                                      showSheet(context);
                                    },
                                    data: 'Receive',
                                    backgroundColor: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .color,
                                    icon: Assets.assetsIconsDownArrow),
                                const Horizontalspace(space: 30),
                                buildOptionWidget(
                                    onTap: () {},
                                    data: 'Buy',
                                    backgroundColor: const Color(0xffEB5E5E),
                                    iconColor: Colors.white,
                                    icon: Assets.assetsIconsWalletInclined),
                                const Horizontalspace(space: 30),
                                buildOptionWidget(
                                    onTap: () {},
                                    backgroundColor: const Color(0xffFFAA04),
                                    data: 'Swap',
                                    icon: Assets.assetsIconsUpdownArrow),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SliverAppBar(
                        pinned: true,
                        excludeHeaderSemantics: true,
                        // backgroundColor: Colors.black,
                        bottom: TabBar(
                          dividerColor: Colors.transparent,
                          labelColor: Styles.primary,
                          indicatorWeight: 1.0,
                          indicatorColor: Styles.primary,
                          unselectedLabelColor: Colors.grey,
                          tabs: [
                            Tab(text: "Currencies"),
                            Tab(text: "NFTs"),
                            Tab(text: "Transactions"),
                            Tab(text: "Utilities"),
                          ],
                        ),
                        automaticallyImplyLeading: false,
                        expandedHeight: 1.0, // Height when fully expanded
                      ),
                      const SliverFillRemaining(
                        fillOverscroll: true,
                        child: TabBarView(
                          children: [
                            CurrenciesScreen(),
                            NftsScreen(),
                            TransactionScreen(),
                            UtilitiesScreen(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return body(context);
    },
  );
}

Widget body(BuildContext context) {
  var currency = <CurrenciesModel>[
    CurrenciesModel(src: Assets.assetsIconsLskWallet, title: "LSK"),
    CurrenciesModel(src: Assets.assetsIconsToroWallet, title: "TORO"),
    CurrenciesModel(src: Assets.assetsIconsUsdtWallet, title: "USDT"),
    CurrenciesModel(src: Assets.assetsIconsNearWallet, title: "NEAR"),
  ];
  return Container(
    padding: const EdgeInsets.all(16),
    width: double.infinity,
    child: ListView(
      children: currency
          .asMap()
          .entries
          .map((e) => Column(
                children: [
                  InkWell(
                    onTap: () {
                      var wallet =
                          Provider.of<UserProvider>(context, listen: false);

                      push(
                        context: context,
                        page: ReceiveScreen(
                            token: e.value.title.toString(),
                            address: wallet.model1!.address.toString()),
                      );
                    },
                    child: Container(
                      height: 72,
                      padding: const EdgeInsets.all(16),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF232324),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 0.50, color: Color(0xFF1D9DDD)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            e.value.title.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Image.asset(e.value.src.toString())
                        ],
                      ),
                    ),
                  ),
                  const Verticalspace(space: 10),
                ],
              ))
          .toList(),
    ),
  );
}

Widget buildOptionWidget({
  required String data,
  required VoidCallback onTap,
  Color? backgroundColor,
  Color? iconColor,
  required String icon,
}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      children: [
        CircleAvatar(
          backgroundColor: backgroundColor ?? Styles.white,
          child: Center(
            child: SvgPicture.asset(
              icon,
              color: iconColor,
            ),
          ),
        ),
        const Verticalspace(space: 2),
        BuildText(
          data: data,
          fontSize: 12,
        ),
      ],
    ),
  );
}
