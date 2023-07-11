import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:streamlivr/assets/assets.dart';
import 'package:streamlivr/src/providers/user_provider.dart';
import 'package:streamlivr/src/routes/router.dart';
import 'package:streamlivr/src/screens/my_schannel_screen/my_channel_screen.dart';
import 'package:streamlivr/src/screens/settings_screen/settings_screen.dart';
import 'package:streamlivr/src/theme/style.dart';
import 'package:streamlivr/src/widgets/build_text.dart';
import 'package:streamlivr/src/widgets/horizontal_space.dart';
import 'package:streamlivr/src/widgets/vertical_space.dart';
import 'package:streamlivr/wrapper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
            // color: Colors.white,
            ),
      ),
      body: Consumer<UserProvider>(builder: (context, snapshot, _) {
        if (!snapshot.hadData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
          children: [
            Builder(builder: (context) {
              if (snapshot.model!.avatar == "") {
                return const CircleAvatar(
                  radius: 65,
                  backgroundImage: NetworkImage(
                      '''https://firebasestorage.googleapis.com/v0/b/streamlivr-1cc43.appspot.com/o/stream%20picture%2Fwp11268839-sharingan-3840x2160-wallpapers.png?alt=media&token=71db99a5-95be-44f5-8dc0-7a6f80313a7a'''),
                );
              } else {
                return CircleAvatar(
                  radius: 65,
                  backgroundImage:
                      NetworkImage(snapshot.model!.avatar.toString()),
                );
              }
            }),
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
                      // color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
            const Verticalspace(space: 14),
            Center(
                child: BuildText(
              data: '${snapshot.model!.firstName} ${snapshot.model!.lastName}',
              fontSize: 24,
              // color: Colors.white,
              fontWeight: FontWeight.w700,
            )),
            const Verticalspace(space: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildOptionWidget(title: '0', subtitle: 'Streams'),
                buildOptionWidget(title: '0', subtitle: 'Collections'),
                buildOptionWidget(title: '0', subtitle: 'Followers'),
                buildOptionWidget(title: '0', subtitle: 'Following'),
              ],
            ),
            const Verticalspace(space: 40),
            buildListTile(
                onTap: () {
                  push(context: context, page: const MyChannelScreen());
                },
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
              onTap: () {
                push(context: context, page: const SettingScreen());
              },
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
        );
      }),
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
              color: Theme.of(context).textTheme.titleSmall!.color,
            ),
            const Horizontalspace(space: 10),
            BuildText(
              data: title,
              fontSize: 16,
              // color: Theme.of(context).textTheme.titleSmall!.color,
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
          fontSize: 12,
          // color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
