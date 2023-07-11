import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streamlivr/assets/assets.dart';
import 'package:streamlivr/src/screens/notification_screen/notification_screen.dart';
import 'package:streamlivr/src/screens/stream_dashboard/stream_dashboard.dart';
import 'package:streamlivr/src/widgets/build_text.dart';
import 'package:streamlivr/src/widgets/horizontal_space.dart';

import '../routes/router.dart';
import '../theme/style.dart';

class MyAppBar extends StatelessWidget {
  final String pageTitle;
  final bool? enableBackButton;
  final VoidCallback onPressed;
  const MyAppBar(
      {Key? key,
      required this.pageTitle,
      required this.onPressed,
      this.enableBackButton})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // padding: const EdgeInsets.symmetric(horizontal: 16),
      // height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(Assets.assetsIconsMainLogo),
              const Horizontalspace(space: 10),
              InkWell(
                  onTap: onPressed,
                  borderRadius: BorderRadius.circular(50),
                  child: SvgPicture.asset(Assets.assetsIconsPersonIcon)),
              const Spacer(),
              InkWell(
                  onTap: () {
                    push(context: context, page: const NotificationScreen());
                  },
                  child: SvgPicture.asset(Assets.assetsIconsNotificationsLogo)),
              const Horizontalspace(space: 19),
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
                        'Create',
                        style: TextStyle(color: Styles.primary),
                      ),
                    ],
                  )),
            ],
          ),
          BuildText(
            data: pageTitle,
            // color: Styles.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
