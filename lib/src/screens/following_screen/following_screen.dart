import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamlivr/assets/assets.dart';
import 'package:streamlivr/src/models/following_model.dart';
import 'package:streamlivr/src/widgets/build_text.dart';
import 'package:streamlivr/src/widgets/horizontal_space.dart';
import 'package:streamlivr/src/widgets/my_app_bar.dart';
import 'package:streamlivr/src/widgets/vertical_space.dart';

import '../../models/user_model.dart';
import '../../providers/channel_provider.dart';
import '../../routes/router.dart';
import '../../theme/style.dart';
import '../profile_screen/profile_screen.dart';

class FollowingScreen extends StatelessWidget {
  const FollowingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var data = <FollowingModel>[
      FollowingModel(
          src: Assets.assetsImagesFlight, title: "Flight tour", views: "78.4"),
      FollowingModel(
          src: Assets.assetsImagesTravel, title: "Travelling", views: "78.4"),
      FollowingModel(
          src: Assets.assetsImagesSunset,
          title: "Sunset at Mon",
          views: "78.4"),
      FollowingModel(
          src: Assets.assetsImagesAustralia,
          title: "Austria Morning",
          views: "78.4"),
      FollowingModel(
          src: Assets.assetsImagesAncient,
          title: "Ancient temple",
          views: "78.4"),
      FollowingModel(
          src: Assets.assetsImagesFlight, title: "Flight tour", views: "78.4"),
    ];
    return Scaffold(
      backgroundColor: Styles.transparent,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyAppBar(
              pageTitle: 'Following',
              onPressed: () {
                push(context: context, page: const ProfileScreen());
              },
            ),
            const BuildText(
              data: 'Recommended Channel',
              color: Styles.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            const Verticalspace(space: 20),
            Expanded(
              child: Consumer<ChannelProvider>(
                builder: (context, provider, _) {
                  if (provider.list.isEmpty) {
                    return const Center(
                      child: Text(
                        "No Channel here",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  }
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return buildFollowingTile(index, provider.list);
                      },
                      separatorBuilder: (context, index) {
                        return const Verticalspace(space: 10);
                      },
                      itemCount: provider.list.length);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildFollowingTile(
    int index,
    List<UserModel> data,
  ) {
    return SizedBox(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(data[index].avatar.toString()))),
              ),
              Container(
                height: 27,
                margin: const EdgeInsets.all(8),
                width: 43,
                decoration: BoxDecoration(
                  color: Styles.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: BuildText(
                    data: 'Live',
                    color: Styles.white,
                  ),
                ),
              ),
            ],
          ),
          const Horizontalspace(space: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BuildText(
                  data: data[index].lastName!,
                  color: Styles.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye,
                      color: Color(0xffe0e0e0),
                      size: 26,
                    ),
                    Horizontalspace(space: 5),
                    BuildText(
                      data: '0 viewers',
                      color: Color(0xffe0e0e0),
                      fontSize: 14,
                    ),
                  ],
                ),
                Row(
                  children: [
                    ...["Nigeria", "Ph"]
                        .map((e) => Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: const Color(0xff343232),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: BuildText(
                                data: e.toString(),
                                fontSize: 5,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xfff4f3fc),
                              ),
                            ))
                        .toList(),
                  ],
                ),
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 7,
                      backgroundImage:
                          AssetImage(Assets.assetsImagesProfileImage),
                    ),
                    Horizontalspace(space: 5),
                    BuildText(
                      data: 'Kachi',
                      fontSize: 8,
                      color: Styles.white,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
