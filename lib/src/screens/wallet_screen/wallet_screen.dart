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

// class WalletScreen extends StatelessWidget {
//   const WalletScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         backgroundColor: Styles.transparent,
//         body: Column(
//           children: [
//             const Verticalspace(space: 24),
//             Padding(
//               padding: screenPadding,
//               child: MyAppBar(
//                 pageTitle: 'Wallet',
//                 onPressed: () {
//                   push(context: context, page: const ProfileScreen());
//                 },
//               ),
//             ),
//
//
//  const Verticalspace(space: 40),
//             const BuildText(
//               data: 'wallet balance',
//               color: Color(0xffbac4d1),
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//             ),
//             const Verticalspace(space: 10),
//             RichText(
//                 text: const TextSpan(children: [
//               TextSpan(
//                   text: '35,850.124',
//                   style: TextStyle(
//                     color: Styles.white,
//                     fontSize: 36,
//                     fontWeight: FontWeight.w600,
//                   )),
//               TextSpan(
//                   text: 'STVR',
//                   style: TextStyle(
//                     color: Styles.white,
//                     fontSize: 17,
//                     fontWeight: FontWeight.w600,
//                   )),
//             ])),
//             RichText(
//                 text: const TextSpan(children: [
//               TextSpan(
//                   text: '107,550.124',
//                   style: TextStyle(
//                     color: Styles.white,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w300,
//                   )),
//               TextSpan(
//                   text: 'USD',
//                   style: TextStyle(
//                     color: Styles.white,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w300,
//                   )),
//             ])),
//             const Verticalspace(space: 10),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 buildOptionWidget(
//                     onTap: () {},
//                     data: 'Send STVR',
//                     icon: Assets.assetsIconsUpArrow),
//                 const Horizontalspace(space: 30),
//                 buildOptionWidget(
//                     onTap: () {},
//                     data: 'State STVR',
//                     icon: Assets.assetsIconsDownArrow),
//                 const Horizontalspace(space: 30),
//                 buildOptionWidget(
//                     onTap: () {},
//                     data: 'Buy STVR',
//                     icon: Assets.assetsIconsWalletInclined),
//               ],
//             ),
//             const Verticalspace(space: 30),
//             const TabBar(
//               dividerColor: Colors.transparent,
//               labelColor: Styles.primary,
//               indicatorWeight: 1.0,
//               indicatorColor: Styles.primary,
//               unselectedLabelColor: Colors.white,
//               tabs: [
//                 Tab(text: "Transactions"),
//                 Tab(text: "NFTs"),
//                 Tab(text: "Utilities"),
//               ],
//             ),
//             const Expanded(
//                 child: TabBarView(children: [
//               TransactionScreen(),
//               NftsScreen(),
//               UtilitiesScreen(),
//             ]))
//           ],
//         ),
//       ),
//     );
//   }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streamlivr/src/constants/constants.dart';
import 'package:streamlivr/src/screens/wallet_screen/pages/nfts_screen.dart';
import 'package:streamlivr/src/screens/wallet_screen/pages/transaction_screen.dart';
import 'package:streamlivr/src/screens/wallet_screen/pages/utilities_screen.dart';

import '../../../assets/assets.dart';
import '../../routes/router.dart';
import '../../theme/style.dart';
import '../../widgets/build_text.dart';
import '../../widgets/horizontal_space.dart';
import '../../widgets/my_app_bar.dart';
import '../../widgets/vertical_space.dart';
import '../profile_screen/profile_screen.dart';

class CollapsingTabView extends StatelessWidget {
  const CollapsingTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
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
                length: 3, // Replace with the number of tabs you have
                child: CustomScrollView(
                  shrinkWrap: true,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          const Verticalspace(space: 40),
                          const BuildText(
                            data: 'wallet balance',
                            color: Color(0xffbac4d1),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          const Verticalspace(space: 10),
                          RichText(
                              text: const TextSpan(children: [
                            TextSpan(
                                text: '35,850.124',
                                style: TextStyle(
                                  color: Styles.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w600,
                                )),
                            TextSpan(
                                text: 'STVR',
                                style: TextStyle(
                                  color: Styles.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                )),
                          ])),
                          RichText(
                              text: const TextSpan(children: [
                            TextSpan(
                                text: '107,550.124',
                                style: TextStyle(
                                  color: Styles.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                )),
                            TextSpan(
                                text: 'USD',
                                style: TextStyle(
                                  color: Styles.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                )),
                          ])),
                          const Verticalspace(space: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildOptionWidget(
                                  onTap: () {},
                                  data: 'Send STVR',
                                  icon: Assets.assetsIconsUpArrow),
                              const Horizontalspace(space: 30),
                              buildOptionWidget(
                                  onTap: () {},
                                  data: 'State STVR',
                                  icon: Assets.assetsIconsDownArrow),
                              const Horizontalspace(space: 30),
                              buildOptionWidget(
                                  onTap: () {},
                                  data: 'Buy STVR',
                                  icon: Assets.assetsIconsWalletInclined),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SliverAppBar(
                      pinned: true,
                      excludeHeaderSemantics: true,
                      backgroundColor: Colors.black,
                      bottom: TabBar(
                        dividerColor: Colors.transparent,
                        labelColor: Styles.primary,
                        indicatorWeight: 1.0,
                        indicatorColor: Styles.primary,
                        unselectedLabelColor: Colors.white,
                        tabs: [
                          Tab(text: "Transactions"),
                          Tab(text: "NFTs"),
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
                          TransactionScreen(),
                          NftsScreen(),
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
    );
  }
}

Widget buildOptionWidget({
  required String data,
  required VoidCallback onTap,
  required String icon,
}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      children: [
        CircleAvatar(
          backgroundColor: Styles.white,
          child: Center(
            child: SvgPicture.asset(icon),
          ),
        ),
        BuildText(
          data: data,
          fontSize: 12,
        ),
      ],
    ),
  );
}
