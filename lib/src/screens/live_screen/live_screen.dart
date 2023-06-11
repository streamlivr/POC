import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:streamlivr/assets/assets.dart';
import 'package:streamlivr/src/models/streaming_model.dart';
import 'package:streamlivr/src/routes/router.dart';
import 'package:streamlivr/src/widgets/build_text.dart';
import 'package:streamlivr/src/widgets/horizontal_space.dart';
import 'package:streamlivr/src/widgets/vertical_space.dart';

import '../../theme/style.dart';

class LiveScreen extends StatelessWidget {
  final StreamingModel model;
  const LiveScreen({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(model.image!),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Styles.transparent,
        body: Stack(
          children: [
            Positioned(
              bottom: 20,
              right: 16,
              left: 16,
              child: buildTextField(context: context),
            ),
            Positioned(
              top: 20,
              right: 16,
              left: 16,
              child: buildTopBar(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTopBar() {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.keyboard_arrow_down,
              color: Styles.white,
              size: 34,
            ),
            const Horizontalspace(space: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const BuildText(
                      data: 'Kachi',
                      color: Styles.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    const Horizontalspace(space: 5),
                    Container(
                      width: 45,
                      height: 28,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color(0xffed5757),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: BuildText(
                          data: 'LIVE',
                          color: Styles.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
                const Row(
                  children: [
                    BuildText(
                      data: 'Streaming Now',
                      color: Styles.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    BuildText(
                      data: '-',
                      color: Styles.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    BuildText(
                      data: 'Daily life',
                      color: Styles.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            SizedBox(
              width: 110,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: const BorderSide(
                        color: Styles.white,
                      )),
                  onPressed: () {},
                  child: const BuildText(
                    data: 'Following',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Styles.white,
                  )),
            )
          ],
        ),
        Row(
          children: [
            const Spacer(),
            Container(
              width: 78,
              height: 28,
              decoration: BoxDecoration(
                color: const Color(0xffbdbdbd).withOpacity(0.4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.remove_red_eye, color: Color(0xfff2f2f2)),
                  Horizontalspace(space: 2),
                  BuildText(
                    data: '124.5k',
                    color: Color(0xfff2f2f2),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget buildTextField({required BuildContext context}) {
    return Row(
      children: [
        Expanded(
            child: TextFormField(
          decoration: InputDecoration(
            hintText: 'say something...',
            suffixIcon: Container(
              height: 20,
              width: 27,
              margin: const EdgeInsets.only(
                right: 8,
                top: 8,
                bottom: 8,
              ),
              decoration: BoxDecoration(
                  color: Styles.primary,
                  borderRadius: BorderRadius.circular(7)),
              child: const Center(
                child: Icon(
                  Icons.arrow_back,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
            hintStyle: const TextStyle(color: Styles.white),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Styles.white),
              borderRadius: BorderRadius.circular(18),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Styles.white),
              borderRadius: BorderRadius.circular(18),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Styles.white),
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        )),
        const Horizontalspace(space: 10),
        InkWell(
            onTap: () {
              buildTipDialog(context: context);
            },
            child: SvgPicture.asset(Assets.assetsIconsTipUserIcon))
      ],
    );
  }

  buildTipDialog({required BuildContext context}) {
    showAnimatedDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Styles.transparent,
          contentPadding: EdgeInsets.zero,
          content: buildTipBody(context: context),
        );
      },
      animationType: DialogTransitionType.fadeScale,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }

  Widget buildTipBody({
    required BuildContext context,
  }) {
    return GlassContainer(
      height: 300,
      width: 400,
      borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.40),
          Colors.white.withOpacity(0.10)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderGradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.60),
          Colors.white.withOpacity(0.10),
          Colors.lightBlueAccent.withOpacity(0.05),
          Colors.lightBlueAccent.withOpacity(0.6)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: const [0.0, 0.39, 0.40, 1.0],
      ),
      blur: 15.0,
      borderWidth: 0,
      elevation: 3.0,
      isFrostedGlass: false,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    pop(context: context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Styles.white,
                  )),
              const BuildText(
                data: 'Tip the streamer',
                color: Styles.white,
              ),
            ],
          ),
          const Verticalspace(space: 26),
          const BuildText(
            data: 'Amount',
            color: Styles.white,
          ),
          const Verticalspace(space: 13),
          TextFormField(
            decoration: const InputDecoration(
              suffixIcon: BuildText(
                data: 'STVR',
                color: Styles.white,
              ),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Styles.white)),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Styles.white)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Styles.white)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Styles.white)),
            ),
          ),
          const Verticalspace(space: 9),
          const BuildText(
            data: '\$10',
            color: Styles.white,
          ),
          const Verticalspace(space: 25),
          SizedBox(
            width: 85,
            height: 38,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Styles.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: const BuildText(
                data: 'Send',
                color: Styles.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
