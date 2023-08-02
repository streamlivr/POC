import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:streamlivr/src/helper/export.dart';
import 'package:streamlivr/src/providers/user_presence_provider.dart';
import 'package:streamlivr/src/providers/user_provider.dart';
import 'package:streamlivr/src/screens/my_schannel_screen/pages/about_page.dart';
import 'package:streamlivr/src/screens/my_schannel_screen/pages/home_page.dart';
import 'package:streamlivr/src/screens/my_schannel_screen/pages/schedules_page.dart';
import 'package:streamlivr/src/screens/my_schannel_screen/pages/videoos_page.dart';
import 'package:streamlivr/src/services/channel_service.dart';
import 'package:streamlivr/src/widgets/build_text.dart';
import 'package:streamlivr/src/widgets/vertical_space.dart';

import '../../models/all_channel_model.dart';
import '../../theme/style.dart';
import '../../widgets/horizontal_space.dart';

class ChannelDetailScreen extends StatefulWidget {
  final AllChannelModel data;
  const ChannelDetailScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<ChannelDetailScreen> createState() => _ChannelDetailScreenState();
}

class _ChannelDetailScreenState extends State<ChannelDetailScreen> {
  dynamic maxLines = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 80,
        height: 32,
        child: FloatingActionButton.extended(
          backgroundColor: const Color(0xff41BAF7),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.assetsIconsAddVideoIcon,
                color: Styles.white,
              ),
              const Horizontalspace(space: 5),
              const Text(
                "GO LIVE",
                style: TextStyle(
                  color: Styles.white,
                  fontSize: 9,
                ),
              ),
            ],
          ),
          onPressed: () {},
        ),
      ),
      appBar: AppBar(
        title: Text(widget.data.channelName.toString()),
      ),
      body: DefaultTabController(
        length: 4, // Replace with the number of tabs you have
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      height: 113,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            widget.data.channelImage.toString(),
                          ),
                        ),
                      ),
                    ),
                    const Verticalspace(space: 10),
                    Consumer<UserProvider>(
                      builder: (context, p, _) {
                        return Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(p.model!.avatar.toString()),
                            ),
                            const Horizontalspace(space: 34),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: p.model!.firstName.toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: '(Musician)',
                                          style: TextStyle(
                                            color: Color(0xFF1D9DDD),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Consumer<UserPresenceProvider>(builder:
                                      (context, userPresenceProvider, _) {
                                    return Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: const Color(0xfff4f3fc)
                                            .withOpacity(0.30),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      width: 45,
                                      height: 15,
                                      child: StreamBuilder<
                                              DocumentSnapshot<
                                                  Map<String, dynamic>>>(
                                          stream: userPresenceProvider
                                              .getUserPresenceStream(
                                                  user:
                                                      widget.data.channelOwner),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return const CupertinoActivityIndicator();
                                            }
                                            var data = snapshot.data?.data();
                                            bool isOnline =
                                                data?['isOnline'] ?? false;
                                            return Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CircleAvatar(
                                                  radius: 3,
                                                  backgroundColor: isOnline
                                                      ? Styles.green
                                                      : Styles.red,
                                                ),
                                                const Horizontalspace(space: 5),
                                                BuildText(
                                                  data: isOnline
                                                      ? 'Online'
                                                      : 'Offline',
                                                  fontSize: 8,
                                                  // color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ],
                                            );
                                          }),
                                    );
                                  }),
                                ],
                              ),
                            ),
                            StreamBuilder<
                                    DocumentSnapshot<Map<String, dynamic>>>(
                                stream: ChannelService.getUserFollowingStream(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData &&
                                      snapshot.data!.exists) {
                                    if (!snapshot.data!
                                        .get('channel')
                                        .toString()
                                        .contains(
                                            widget.data.channelId.toString())) {
                                      return ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xfff4f3fc)
                                                    .withOpacity(0.30),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          onPressed: () {
                                            ChannelService.followChannel(
                                                targetChannelId: widget
                                                    .data.channelId
                                                    .toString());
                                          },
                                          child: const Text(
                                            'Follow',
                                            style: TextStyle(
                                              color: Styles.white,
                                            ),
                                          ));
                                    }
                                    return ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xfff4f3fc)
                                                  .withOpacity(0.30),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        onPressed: () {
                                          ChannelService.unfollowChannel(
                                              targetChannelId: widget
                                                  .data.channelId
                                                  .toString());
                                        },
                                        child: const Text(
                                          'unfollow',
                                          style: TextStyle(
                                            color: Styles.white,
                                          ),
                                        ));
                                  } else {
                                    return ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xfff4f3fc)
                                                  .withOpacity(0.30),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        onPressed: () {
                                          ChannelService.followChannel(
                                              targetChannelId: widget
                                                  .data.channelId
                                                  .toString());
                                        },
                                        child: const Text(
                                          'Follow',
                                          style: TextStyle(
                                            color: Styles.white,
                                          ),
                                        ));
                                  }
                                }),
                          ],
                        );
                      },
                    ),
                    const Verticalspace(space: 10),
                    Consumer<BasicProvider>(builder: (context, p, _) {
                      return Wrap(
                        children: [
                          Text(
                            widget.data.channelDescription.toString(),
                            maxLines: p.maxLines,
                            textAlign: TextAlign.start,
                          ),
                          InkWell(
                            onTap: () {
                              if (p.maxLines == 3) {
                                p.maxLines = null;
                              } else {
                                p.maxLines = 3;
                              }
                            },
                            child: BuildText(
                              data:
                                  p.maxLines == null ? "See less" : 'See more',
                              color: Styles.blue,
                            ),
                          )
                        ],
                      );
                    })
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
                    Tab(text: "Home"),
                    Tab(text: "About"),
                    Tab(text: "Schedules"),
                    Tab(text: "Videos"),
                  ],
                ),
                automaticallyImplyLeading: false,
                expandedHeight: 1.0, // Height when fully expanded
              ),
              const SliverFillRemaining(
                fillOverscroll: true,
                child: TabBarView(
                  children: [
                    HomePage(),
                    AboutPage(),
                    SchedulesPage(),
                    VideosPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
