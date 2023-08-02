import 'package:flutter/material.dart';
import 'package:streamlivr/src/models/all_channel_model.dart';
import 'package:streamlivr/src/models/user_model.dart';
import 'package:streamlivr/src/services/channel_service.dart';
import 'package:streamlivr/src/services/user_service.dart';
import 'package:streamlivr/src/widgets/build_text.dart';
import 'package:streamlivr/src/widgets/horizontal_space.dart';
import 'package:streamlivr/src/widgets/my_app_bar.dart';
import 'package:streamlivr/src/widgets/vertical_space.dart';

import '../../routes/router.dart';
import '../../theme/style.dart';
import '../channel_detail_screen/channel_detail_screen.dart';
import '../profile_screen/profile_screen.dart';

class FollowingScreen extends StatelessWidget {
  const FollowingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
              child: StreamBuilder<List<AllChannelModel>>(
                  stream: ChannelService.readFollowingChannels(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var list = snapshot.data!;
                      if (list.isEmpty) {
                        return const Center(
                          child: Text("You've not followed any channel"),
                        );
                      }
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            var data = list[index];
                            return buildFollowingTile(data, context);
                          },
                          separatorBuilder: (context, index) {
                            return const Verticalspace(space: 10);
                          },
                          itemCount: list.length);
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget buildFollowingTile(AllChannelModel data, BuildContext context) {
    return InkWell(
      onTap: () {
        push(
            context: context,
            page: ChannelDetailScreen(
              data: data,
            ));
      },
      child: SizedBox(
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
                          fit: BoxFit.cover,
                          image: NetworkImage(data.channelImage.toString()))),
                ),
                // Container(
                //   height: 27,
                //   margin: const EdgeInsets.all(8),
                //   width: 43,
                //   decoration: BoxDecoration(
                //     color: Styles.red,
                //     borderRadius: BorderRadius.circular(8),
                //   ),
                //   child: const Center(
                //     child: BuildText(
                //       data: 'Live',
                //       color: Styles.white,
                //     ),
                //   ),
                // ),
              ],
            ),
            const Horizontalspace(space: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BuildText(
                    data: data.channelName!,
                    // color: Styles.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.remove_red_eye,
                        // color: Color(0xffe0e0e0),
                        size: 16,
                      ),
                      Horizontalspace(space: 5),
                      BuildText(
                        data: '0 viewers',
                        // color: Color(0xffe0e0e0),
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
                  FutureBuilder<UserModel?>(
                      future: UserService.readUser2(
                          userId: data.channelOwner.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Row(
                            children: [
                              CircleAvatar(
                                radius: 7,
                                backgroundImage: NetworkImage(
                                    snapshot.data!.avatar.toString()),
                              ),
                              const Horizontalspace(space: 5),
                              BuildText(
                                data: snapshot.data!.firstName.toString(),
                                fontSize: 8,
                                // color: Styles.white,
                              )
                            ],
                          );
                        } else {
                          return const Row(
                            children: [
                              CircleAvatar(
                                radius: 7,
                              ),
                              Horizontalspace(space: 5),
                              BuildText(
                                data: '',
                                fontSize: 8,
                                // color: Styles.white,
                              )
                            ],
                          );
                        }
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
