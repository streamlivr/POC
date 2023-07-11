import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:streamlivr/src/models/channel_model.dart';
import 'package:streamlivr/src/providers/user_provider.dart';
import 'package:streamlivr/src/screens/my_schannel_screen/pages/about_page.dart';
import 'package:streamlivr/src/screens/my_schannel_screen/pages/home_page.dart';
import 'package:streamlivr/src/screens/my_schannel_screen/pages/schedules_page.dart';
import 'package:streamlivr/src/screens/my_schannel_screen/pages/videoos_page.dart';
import 'package:streamlivr/src/widgets/build_text.dart';
import 'package:streamlivr/src/widgets/vertical_space.dart';

import '../../../assets/assets.dart';
import '../../theme/style.dart';
import '../../widgets/horizontal_space.dart';

class MyChannelScreen extends StatefulWidget {
  final ChannelModel? data;
  const MyChannelScreen({Key? key, this.data}) : super(key: key);

  @override
  State<MyChannelScreen> createState() => _MyChannelScreenState();
}

class _MyChannelScreenState extends State<MyChannelScreen> {
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
        title: const Text('My Channel'),
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
                      decoration: const BoxDecoration(),
                    ),
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
                                  Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: const Color(0xfff4f3fc)
                                          .withOpacity(0.30),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    width: 45,
                                    height: 15,
                                    child: const Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 3,
                                          backgroundColor: Styles.green,
                                        ),
                                        Horizontalspace(space: 5),
                                        Text(
                                          'Online',
                                          style: TextStyle(
                                            color: Styles.white,
                                            fontSize: 8,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color(0xfff4f3fc).withOpacity(0.30),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    SvgPicture.asset(Assets.assetsIconsPenEdit),
                                    const Horizontalspace(space: 5),
                                    const Text(
                                      'Edit',
                                      style: TextStyle(
                                        color: Styles.white,
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        );
                      },
                    ),
                    const Verticalspace(space: 10),
                    Wrap(
                      children: [
                        Text(
                          """Consectetur adipisicing labore magna eiusmod pariatur eiusmod ullamco id ut. Ut non duis ullamco tempor ut. Cillum nisi nisi anim sint nisi. Nostrud sunt amet incididunt ut in eu.
        
        Cupidatat officia ea incididunt enim proident anim exercitation nostrud. Qui ex irure aliquip ipsum irure commodo adipisicing magna id. Voluptate ad ullamco officia non magna et non do anim. Magna ipsum pariatur duis qui consequat.""",
                          maxLines: maxLines,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {});
                            if (maxLines == 3) {
                              maxLines = null;
                            } else {
                              maxLines = 3;
                            }
                          },
                          child: BuildText(
                            data: maxLines == null ? "See less" : 'See more',
                            color: Styles.blue,
                          ),
                        )
                      ],
                    )
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
