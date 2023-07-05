import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streamlivr/src/constants/constants.dart';
import 'package:streamlivr/src/theme/style.dart';

import '../../../assets/assets.dart';
import '../../routes/router.dart';
import '../../widgets/build_text.dart';
import '../../widgets/horizontal_space.dart';
import '../profile_screen/profile_screen.dart';
import 'content_tab.dart';
import 'dashboard_tab.dart';

class StreamDashboard extends StatelessWidget {
  const StreamDashboard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              // const Verticalspace(space: 24),
              Padding(
                padding: screenPadding,
                child: buildAppButton(context),
              ),
              const TabBar(
                  dividerColor: Colors.transparent,
                  labelColor: Styles.primary,
                  indicatorWeight: 1.0,
                  indicatorColor: Styles.primary,
                  unselectedLabelColor: Colors.white,
                  tabs: [
                    Tab(text: "Dashboard"),
                    Tab(text: "Content"),
                  ]),
              const Expanded(
                  child: TabBarView(children: [
                DashboardTab(),
                ContentTab(),
              ]))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAppButton(
    BuildContext context,
  ) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                  onTap: () {
                    push(context: context, page: const ProfileScreen());
                  },
                  borderRadius: BorderRadius.circular(50),
                  child: SvgPicture.asset(Assets.assetsIconsPersonIcon)),
              const Spacer(),
              SvgPicture.asset(Assets.assetsIconsNotificationsLogo),
              const Horizontalspace(space: 5),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Styles.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(
                            color: Styles.primary,
                            width: 2,
                          ))),
                  onPressed: () {
                    push(context: context, page: const StreamDashboard());
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(Assets.assetsIconsAddVideoIcon),
                      const Horizontalspace(space: 5),
                      const Text(
                        'Watch',
                        style: TextStyle(color: Styles.primary),
                      ),
                    ],
                  )),
            ],
          ),
          const BuildText(
            data: "Dashboard",
            color: Styles.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
