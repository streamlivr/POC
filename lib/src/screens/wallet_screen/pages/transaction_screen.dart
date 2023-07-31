import 'package:flutter/material.dart';
import 'package:streamlivr/assets/assets.dart';
import 'package:streamlivr/src/constants/constants.dart';
import 'package:streamlivr/src/widgets/build_text.dart';
import 'package:streamlivr/src/widgets/horizontal_space.dart';
import 'package:streamlivr/src/widgets/vertical_space.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Styles.black,
      body: ListView.separated(
        itemCount: 1,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const Verticalspace(space: 10),
        padding: screenPadding,
        itemBuilder: (context, index) {
          return buildTransactionTile();
        },
      ),
    );
  }

  Widget buildTransactionTile() {
    return const Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(Assets.assetsImagesProfileImage),
        ),
        Horizontalspace(space: 5),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildText(
              data: 'Kachi',
              fontSize: 16,
              // color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            BuildText(
              data: 'Owns 32,000 STVR',
              color: Color(0xff7d8fa9),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BuildText(
              data: '~\$130,000',
              fontSize: 18,
              // color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            BuildText(
              data: 'USD value',
              color: Color(0xff7d8fa9),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ],
    );
  }
}
