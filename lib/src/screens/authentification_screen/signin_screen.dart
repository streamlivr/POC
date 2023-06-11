import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamlivr/assets/assets.dart';
import 'package:streamlivr/src/constants/constants.dart';
import 'package:streamlivr/src/models/network_model.dart';
import 'package:streamlivr/src/models/wallet_model.dart';
import 'package:streamlivr/src/providers/authentification_provider.dart';
import 'package:streamlivr/src/providers/basic_provider.dart';
import 'package:streamlivr/src/routes/router.dart';
import 'package:streamlivr/src/screens/authentification_screen/verify_phone.dart';
import 'package:streamlivr/src/widgets/app_button.dart';
import 'package:streamlivr/src/widgets/app_password_textfield.dart';
import 'package:streamlivr/src/widgets/app_textfield.dart';
import 'package:streamlivr/src/widgets/build_text.dart';
import 'package:streamlivr/src/widgets/horizontal_space.dart';
import 'package:streamlivr/src/widgets/vertical_space.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthentificationProvider>(builder: (context, provider, _) {
      return Scaffold(
        appBar: AppBar(),
        body: ListView(
          padding: screenPadding,
          children: [
            const BuildText(
              data: 'Log in',
              fontSize: 24,
            ),
            GestureDetector(
              onTap: () {
                pop(context: context);
              },
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Do you already have an account?",
                    style: TextStyle(
                      color: grey,
                      fontSize: 14,
                    )),
                TextSpan(
                  text: 'Sign in',
                  style: TextStyle(
                    color: primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ])),
            ),
            const Verticalspace(space: 36),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildText(
                  data: 'E-mail',
                  fontSize: 14,
                  color: black.withOpacity(0.5),
                ),
                const Verticalspace(space: 8),
                AppTextField(
                    hint: "Email",
                    prefix: Icon(
                      Icons.person_outline,
                      color: grey,
                    ),
                    controller: TextEditingController()),
              ],
            ),
            const Verticalspace(space: 26),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildText(
                  data: 'Password',
                  fontSize: 14,
                  color: black.withOpacity(0.5),
                ),
                const Verticalspace(space: 8),
                AppPasswordTextField(
                    hint: "Password", controller: TextEditingController()),
              ],
            ),
            const Verticalspace(space: 54),
            Row(
              children: [
                Consumer<BasicProvider>(
                  builder: (context, provider, child) {
                    return Checkbox(
                      activeColor: primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      value: provider.check,
                      onChanged: (value) => provider.checkBox(!value!),
                    );
                  },
                ),
                const BuildText(
                  data: 'I accept the terms and privacy policy',
                  fontSize: 14,
                )
              ],
            ),
            const Verticalspace(space: 43),
            AppButton(
              text: 'Login',
              textColor: white,
              onPressed: () {
                push(context: context, page: const VerifyPhoneScreen());
              },
            ),
            const Verticalspace(space: 31),
            const Center(child: BuildText(data: 'Or')),
            const Verticalspace(space: 32),
            socialButton(
                onPressed: () {},
                title: 'Sign in with Google',
                src: Assets.assetsIconsGoogle),
            const Verticalspace(space: 32),
            socialButton(
                onPressed: () {},
                title: 'Sign in with Apple',
                src: Assets.assetsIconsApple),
            const Verticalspace(space: 32),
            SizedBox(
              height: 34,
              child: AppButton(
                textColor: white,
                radius: 3,
                text: 'Connect to wallet',
                onPressed: () {
                  showConnectAccount(context: context);
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  showConnectAccount({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return connectAccountBody(context: context);
      },
    );
  }

  Widget connectAccountBody({
    required BuildContext context,
  }) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 18,
              right: 18,
              top: 18,
            ),
            child: Row(
              children: [
                const BuildText(
                  data: 'Connect Account',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    pop(context: context);
                  },
                  icon: const Icon(Icons.close),
                )
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                ExpansionTile(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide.none,
                    ),
                    collapsedShape: const RoundedRectangleBorder(
                      side: BorderSide.none,
                    ),
                    title: const BuildText(data: 'Choose Netwrok'),
                    children: [buildNetworkList()]),
                const Verticalspace(space: 10),
                ExpansionTile(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide.none,
                    ),
                    collapsedShape: const RoundedRectangleBorder(
                      side: BorderSide.none,
                    ),
                    title: const BuildText(data: 'Select Wallet'),
                    children: [buildWalletList()]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNetworkList() {
    var list = <NetworkModel>[
      NetworkModel(
        title: "Eth",
        src: Assets.assetsIconsEthereum,
      ),
      NetworkModel(
        title: "Ply",
        src: Assets.assetsIconsPolygon,
      ),
      NetworkModel(
        title: "Bsc",
        src: Assets.assetsIconsBnbChain,
      ),
      NetworkModel(
        title: "Ava",
        src: Assets.assetsIconsAvalanche,
      ),
      NetworkModel(
        title: "Ast",
        src: Assets.assetsIconsAstar,
      ),
      NetworkModel(
        title: "Opt",
        src: Assets.assetsIconsOptimism,
      ),
      NetworkModel(
        title: "Sol",
        src: Assets.assetsIconsSolana,
      ),
    ];
    return Consumer<BasicProvider>(builder: (context, provider, _) {
      return Wrap(
        spacing: 48,
        children: list
            .asMap()
            .entries
            .map((e) => GestureDetector(
                  onTap: () {
                    provider.changeNetworkIndex(e.key);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: provider.networkIndex == e.key
                            ? const Color(0xffb9c1f4)
                            : null,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Image.asset(e.value.src.toString()),
                        Text(e.value.title.toString()),
                      ],
                    ),
                  ),
                ))
            .toList(),
      );
    });
  }

  Widget buildWalletList() {
    var list = <WalletModel>[
      WalletModel(
        title: "Metamask",
        src: Assets.assetsIconsMetamaskWalletLogo,
      ),
      WalletModel(
        title: "TrustWallet",
        src: Assets.assetsIconsTrustWalletLogo,
      ),
      WalletModel(
        title: "NEAR",
        src: Assets.assetsIconsNearWalletLogo,
      ),
      WalletModel(
        title: "Difinity",
        src: Assets.assetsIconsDiffinity,
      ),
    ];
    return Consumer<BasicProvider>(builder: (context, provider, _) {
      return Wrap(
        spacing: 48,
        children: list
            .asMap()
            .entries
            .map((e) => GestureDetector(
                  onTap: () {
                    provider.changeWalletIndex(e.key);
                  },
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: MediaQuery.of(context).size.width * 0.4,
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: provider.walletIndex == e.key
                            ? const Color(0xffb9c1f4)
                            : null,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Image.asset(e.value.src.toString()),
                        const Horizontalspace(space: 10),
                        Text(e.value.title.toString()),
                      ],
                    ),
                  ),
                ))
            .toList(),
      );
    });
  }

  Widget socialButton({
    required VoidCallback onPressed,
    required String title,
    required String src,
  }) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: white,
              foregroundColor: white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2))),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(src),
              const Horizontalspace(space: 10),
              BuildText(
                data: title,
                color: black,
              ),
            ],
          )),
    );
  }
}