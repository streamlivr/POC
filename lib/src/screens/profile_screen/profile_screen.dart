import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streamlivr/assets/assets.dart';
import 'package:streamlivr/src/routes/router.dart';
import 'package:streamlivr/src/theme/style.dart';
import 'package:streamlivr/src/widgets/build_text.dart';
import 'package:streamlivr/src/widgets/horizontal_space.dart';
import 'package:streamlivr/src/widgets/vertical_space.dart';
import 'package:streamlivr/wrapper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          const CircleAvatar(
            radius: 65,
          ),
          const Verticalspace(space: 14),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xfff4f3fc).withOpacity(0.3),
              ),
              height: 30,
              width: 82,
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 3,
                    backgroundColor: Styles.green,
                  ),
                  Horizontalspace(space: 10),
                  BuildText(
                    data: 'Online',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),
          const Verticalspace(space: 14),
          const Center(
              child: BuildText(
            data: 'MR KOLN',
            fontSize: 24,
            fontWeight: FontWeight.w700,
          )),
          const Verticalspace(space: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildOptionWidget(title: '38', subtitle: 'Streams'),
              buildOptionWidget(title: '50', subtitle: 'Collections'),
              buildOptionWidget(title: '87.8k', subtitle: 'Followers'),
              buildOptionWidget(title: '526', subtitle: 'Following'),
            ],
          ),
          const Verticalspace(space: 40),
          buildListTile(
              onTap: () {},
              title: 'My Channel',
              src: Assets.assetsIconsProfilecircleIcon),
          buildListTile(
            onTap: () {},
            title: 'My Collectibles',
            src: Assets.assetsIconsBoxIcon,
          ),
          buildListTile(
            onTap: () {},
            title: 'Payments',
            src: Assets.assetsIconsWalletLogo,
          ),
          buildListTile(
            onTap: () {},
            title: 'Notification',
            src: Assets.assetsIconsNotificationIcon,
          ),
          buildListTile(
            onTap: () {},
            title: 'Preferences',
            src: Assets.assetsIconsSettingIcon,
          ),
          buildListTile(
            onTap: () {},
            title: 'Security',
            src: Assets.assetsIconsShieldIcon,
          ),
          buildListTile(
            onTap: () {},
            title: 'Language',
            src: Assets.assetsIconsMoresquareIcon,
          ),
          buildListTile(
            onTap: () {},
            title: 'Help Center',
            src: Assets.assetsIconsCommentIcon,
          ),
          buildListTile(
            onTap: () {},
            title: 'Licenses',
            src: Assets.assetsIconsFilesIcon,
          ),
          buildListTile(
            onTap: () {},
            title: 'About',
            src: Assets.assetsIconsInformationsquareIcon,
          ),
          buildListTile(
            onTap: () {
              FirebaseAuth.instance.signOut().then((value) {
                pushRemoveAll(context: context, page: const Wrapper());
              });
            },
            title: 'Logout',
            src: Assets.assetsIconsLogoutIcon,
          ),
          const Verticalspace(space: 50)
        ],
      ),
    );
  }

  Widget buildListTile({
    required VoidCallback onTap,
    required String title,
    required String src,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            SvgPicture.asset(
              src,
              height: 20,
              width: 19,
            ),
            const Horizontalspace(space: 10),
            BuildText(
              data: title,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            const Spacer(),
            SvgPicture.asset(Assets.assetsIconsArrowRight)
          ],
        ),
      ),
    );
  }

  Widget buildOptionWidget({
    required String title,
    required String subtitle,
  }) {
    return Column(
      children: [
        BuildText(
          data: title,
          color: const Color(0xff1d9ddd),
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        BuildText(
          data: subtitle,
          color: const Color(0xfff4f3fc),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
