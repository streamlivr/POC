import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamlivr/assets/assets.dart';
import 'package:streamlivr/src/constants/constants.dart';
import 'package:streamlivr/src/models/response_model.dart';
import 'package:streamlivr/src/providers/wallet_provider.dart';
import 'package:streamlivr/src/services/crypto_services.dart';
import 'package:streamlivr/src/theme/style.dart';
import 'package:streamlivr/src/widgets/build_text.dart';
import 'package:streamlivr/src/widgets/horizontal_space.dart';
import 'package:streamlivr/src/widgets/vertical_space.dart';

import '../../../models/currencies_model.dart';

class CurrenciesScreen extends StatelessWidget {
  const CurrenciesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currency = <CurrenciesModel>[
      CurrenciesModel(src: Assets.assetsIconsLskWallet, title: "LSK"),
      CurrenciesModel(src: Assets.assetsIconsToroWallet, title: "TORO"),
      CurrenciesModel(src: Assets.assetsIconsUsdtWallet, title: "USDT"),
      CurrenciesModel(src: Assets.assetsIconsNearWallet, title: "NEAR"),
    ];
    return Scaffold(
      backgroundColor: Styles.black,
      body: ListView.separated(
        itemCount: currency.length,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const Verticalspace(space: 10),
        padding: screenPadding,
        itemBuilder: (context, index) {
          return buildCurrencyTile(data: currency[index]);
        },
      ),
    );
  }

  Widget buildCurrencyTile({
    required CurrenciesModel data,
  }) {
    return FutureBuilder<ResponseModel>(
        future: CryptoService.convertCurrency(currency: data.title.toString()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.status == "success") {
              return Container(
                color: Styles.black,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(data.src.toString()),
                      backgroundColor: Styles.transparent,
                    ),
                    const Horizontalspace(space: 5),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BuildText(
                          data: '\$${data.title}',
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                        const BuildText(
                          data: 'Owns 32,000 STVR',
                          color: Color(0xff7d8fa9),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Consumer<WalletProvider>(builder: (context, p, _) {
                      if (p.hasData) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            BuildText(
                              data: jsonDecode(snapshot.data!.data)['rate']
                                          .toString() ==
                                      "null"
                                  ? ""
                                  : '\$${(double.parse(p.model!.data!.first.token!.balance!).roundToDouble() * double.parse(jsonDecode(snapshot.data!.data)['rate'].toString()).roundToDouble())}',
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            BuildText(
                              data: jsonDecode(snapshot.data!.data)['rate']
                                          .toString() ==
                                      "null"
                                  ? "-"
                                  : "${double.parse(jsonDecode(snapshot.data!.data)['rate'].toString()).roundToDouble()} %",
                              color: const Color(0xff7d8fa9),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            BuildText(
                              data: jsonDecode(snapshot.data!.data)['rate']
                                          .toString() ==
                                      "null"
                                  ? (int.parse("0") + 1000).toString()
                                  : (1000 *
                                          double.parse(jsonDecode(
                                                  snapshot.data!.data)['rate']
                                              .toString()))
                                      .toString(),
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            BuildText(
                              data: jsonDecode(snapshot.data!.data)['rate']
                                          .toString() ==
                                      "null"
                                  ? "-"
                                  : "${double.parse(jsonDecode(snapshot.data!.data)['rate'].toString()).roundToDouble()} %",
                              color: const Color(0xff7d8fa9),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        );
                      }
                    }),
                  ],
                ),
              );
            } else {
              return Container(
                color: Styles.black,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(data.src.toString()),
                      backgroundColor: Styles.transparent,
                    ),
                    const Horizontalspace(space: 5),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BuildText(
                          data: '-',
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                        BuildText(
                          data: '-',
                          color: Color(0xff7d8fa9),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        BuildText(
                          data: "-",
                          // data: jsonDecode(snapshot.data!.data)['rate'] == null
                          //     ? ""
                          //     : int.parse(jsonDecode(snapshot.data!.data)['rate']
                          //             .toString())
                          //         .toString(),
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        BuildText(
                          data: '-',
                          color: Color(0xff7d8fa9),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          } else {
            return const SizedBox();
          }
        });
  }
}
