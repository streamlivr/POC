import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streamlivr/assets/assets.dart';
import 'package:streamlivr/src/constants/constants.dart';
import 'package:streamlivr/src/widgets/build_text.dart';
import 'package:streamlivr/src/widgets/horizontal_space.dart';

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
      height: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(Assets.assetsIconsPersonIcon),
              const Spacer(),
              SvgPicture.asset(Assets.assetsIconsNotificationsLogo),
              const Horizontalspace(space: 5),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: primary,
                            width: 2,
                          ))),
                  onPressed: () {},
                  child: Row(
                    children: [
                      SvgPicture.asset(Assets.assetsIconsAddVideoIcon),
                      const Horizontalspace(space: 5),
                      Text(
                        'Create',
                        style: TextStyle(color: primary),
                      ),
                    ],
                  )),
            ],
          ),
          BuildText(
            data: pageTitle,
            color: white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
