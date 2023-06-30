import 'package:flutter_svg/flutter_svg.dart';
import 'package:streamlivr/src/constants/constants.dart';
import 'package:streamlivr/src/helper/export.dart';
import 'package:streamlivr/src/models/stream_model.dart';
import 'package:streamlivr/src/providers/user_provider.dart';
import 'package:streamlivr/src/routes/router.dart';
import 'package:streamlivr/src/services/user_service.dart';
import 'package:streamlivr/src/theme/style.dart';
import 'package:streamlivr/src/widgets/app_button.dart';
import 'package:streamlivr/src/widgets/build_text.dart';
import 'package:streamlivr/src/widgets/horizontal_space.dart';
import 'package:streamlivr/src/widgets/vertical_space.dart';

import '../../helper/generate_stream_id.dart';
import '../live_screen/live_page2.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Align(
              alignment: Alignment.center,
              child: BuildText(
                data: "you're offline",
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Verticalspace(space: 100),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  createStream(context);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      13,
                    ),
                  ),
                  backgroundColor: Styles.primary,
                ),
                child: Row(
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
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Verticalspace(space: 16),
            AppButton(
              buttonColor: Styles.white,
              textColor: Styles.primary,
              text: 'Edit stream info',
              onPressed: () {},
            ),
            const Verticalspace(space: 70),
          ],
        ),
      ),
    );
  }

  createStream(BuildContext context) {
    var data = Provider.of<UserProvider>(context, listen: false);
    final streamId = generateRandomCharacters();
    UserService.uploadPost(StreamModel(
      title: "tset ",
      description: "new test ",
      userId: data.model!.uuid.toString(),
      userName: data.model!.firstName.toString(),
      streamId: streamId,
      streamImage: "",
      avatar: data.model!.avatar.toString(),
    )).then((value) {
      print(value);
      push(
          context: context,
          page: LivePage2(
            isHost: true,
            liveID: streamId,
            userName: data.model!.firstName.toString(),
            userId: data.model!.uuid.toString(),
          ));
    });
  }
}
