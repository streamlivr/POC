import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streamlivr/assets/assets.dart';
import 'package:streamlivr/src/constants/constants.dart';
import 'package:streamlivr/src/widgets/build_text.dart';
import 'package:streamlivr/src/widgets/horizontal_space.dart';
import 'package:streamlivr/src/widgets/vertical_space.dart';

import '../../widgets/my_app_bar.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: transparent,
      body: Padding(
        padding: screenPadding,
        child: Column(
          children: [
            const Verticalspace(space: 24),
            MyAppBar(
              pageTitle: 'Discover',
              onPressed: () {},
            ),
            buildSearchWidget(),
            Expanded(
                child: ListView(
              children: [
                buildLiveWidget(),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget buildLiveWidget() {
    return SizedBox(
      height: 156,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container();
          },
          separatorBuilder: (context, index) {
            return const Horizontalspace(space: 10);
          },
          itemCount: 10),
    );
  }

  Widget buildSearchWidget() {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        height: 51,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: white,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(Assets.assetsIconsSearchIcon),
            const Horizontalspace(space: 20),
            const BuildText(
              data: 'Search live channels or streamers',
              color: Color(0xff828282),
            ),
          ],
        ),
      ),
    );
  }
}
