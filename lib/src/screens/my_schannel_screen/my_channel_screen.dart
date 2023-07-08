import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:streamlivr/src/screens/my_schannel_screen/pages/about_page.dart';
import 'package:streamlivr/src/screens/my_schannel_screen/pages/home_page.dart';
import 'package:streamlivr/src/screens/my_schannel_screen/pages/schedules_page.dart';
import 'package:streamlivr/src/screens/my_schannel_screen/pages/videoos_page.dart';
import 'package:streamlivr/src/widgets/build_text.dart';

import '../../../assets/assets.dart';
import '../../theme/style.dart';
import '../../widgets/horizontal_space.dart';

class MyChannelScreen extends StatefulWidget {
  const MyChannelScreen({Key? key}) : super(key: key);

  @override
  State<MyChannelScreen> createState() => _MyChannelScreenState();
}

class _MyChannelScreenState extends State<MyChannelScreen> {
  dynamic maxLines = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Channel'),
      ),
      body: DefaultTabController(
        length: 4, // Replace with the number of tabs you have
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
                  Row(
                    children: [
                      const CircleAvatar(),
                      const Horizontalspace(space: 34),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                BuildText(data: 'Mr Product'),
                                BuildText(data: 'Musician'),
                              ],
                            ),
                            SizedBox(
                              width: 100,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xfff4f3fc)
                                          .withOpacity(0.30),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                  onPressed: () {},
                                  child: const Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 3,
                                        backgroundColor: Styles.green,
                                      ),
                                      Horizontalspace(space: 5),
                                      Text(
                                        'Online',
                                        style: TextStyle(color: Styles.white),
                                      ),
                                    ],
                                  )),
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
                  ),
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
    );
  }
}
