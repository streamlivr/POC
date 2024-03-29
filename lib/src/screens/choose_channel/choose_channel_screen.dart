import 'package:day_night_themed_switch/day_night_themed_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:streamlivr/src/providers/authentification_provider.dart';
import 'package:streamlivr/src/providers/channel_provider.dart';
import 'package:streamlivr/src/routes/router.dart';
import 'package:streamlivr/src/screens/main_screen/main_screen.dart';
import 'package:streamlivr/src/widgets/app_button.dart';
import 'package:streamlivr/src/widgets/build_text.dart';
import 'package:streamlivr/src/widgets/horizontal_space.dart';
import 'package:streamlivr/src/widgets/vertical_space.dart';

import '../../../assets/assets.dart';
import '../../constants/constants.dart';
import '../../providers/dark_theme_provider.dart';
import '../../theme/style.dart';
import '../../widgets/app_message.dart';
import '../../widgets/processing_dialogue.dart';

class ChooseChannelScreen extends StatefulWidget {
  const ChooseChannelScreen({Key? key}) : super(key: key);

  @override
  State<ChooseChannelScreen> createState() => _ChooseChannelScreenState();
}

class _ChooseChannelScreenState extends State<ChooseChannelScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Provider.of<ChannelProvider>(context, listen: false).fetcChannel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthentificationProvider>(builder: (context, provider, _) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          actions: [
            Consumer<DarkThemeProvider>(builder: (context, provider, _) {
              final themeProvider = Provider.of<DarkThemeProvider>(context);
              return Padding(
                padding: const EdgeInsets.only(
                  right: 24,
                ),
                child: SizedBox(
                  width: 45.49,
                  height: 20.74,
                  child: DayNightSwitch(
                    value: provider.darkTheme,
                    onChanged: (_) {
                      themeProvider.darkTheme = !themeProvider.darkTheme;
                    },
                  ),
                ),
              );
            })
          ],
        ),
        body: Column(
          children: [
            buildSearchWidget(),
            const Verticalspace(space: 16),
            const BuildText(
              data: 'Select a Channel to Follow',
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            const Verticalspace(space: 21),
            BuildText(
              data:
                  '''Follow some of the live streaming channels that you may know below''',
              color: Theme.of(context).textTheme.titleSmall!.color,
              fontSize: 14,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w400,
            ),
            const Verticalspace(space: 41),
            builtListWidget(),
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: const EdgeInsets.only(
                top: 24,
                left: 31,
                right: 31,
                bottom: 56,
              ),
              height: 130,
              child: AppButton(
                text: 'Continue',
                textColor: Styles.white,
                onPressed: () {
                  if (Provider.of<ChannelProvider>(
                    context,
                    listen: false,
                  ).checkedList.isEmpty) {
                    AppMessage.showMessage('Select at least one');
                    return;
                  }
                  ProcessingDialog.showProcessingDialog(
                    context: context,
                  );
                  provider
                      .chooseChannel(
                    channel: Provider.of<ChannelProvider>(
                      context,
                      listen: false,
                    ).checkedList,
                  )
                      .then((value) {
                    pop(context: context);
                    if (value.status == 'success') {
                      AppMessage.showMessage(
                        'channel selected',
                      );
                      push(
                        context: context,
                        page: const MainScreen(),
                      );
                    } else {
                      AppMessage.showMessage('something went wrong');
                    }
                  });

                  // push(context: context, page: const MainScreen());
                },
              ),
            )
          ],
        ),
      );
    });
  }

  Widget builtListWidget() {
    return Expanded(
      child: Consumer<ChannelProvider>(
        builder: (context, provider, _) {
          return ListView.builder(
            padding: screenPadding,
            itemCount: provider.list.length,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  provider.checkList(provider.list[index].uuid.toString());
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        height: 51,
                        width: 51,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              provider.list[index].avatar.toString(),
                            ),
                          ),
                        ),
                      ),
                      const Horizontalspace(space: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BuildText(
                            data: provider.list[index].firstName.toString(),
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                          const BuildText(
                            data: '249k follower',
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: Color(0xff676767),
                          ),
                        ],
                      ),
                      const Spacer(),
                      AnimatedContainer(
                        duration: kAninationDuration,
                        height: 26,
                        width: !provider.checkedList
                                .contains(provider.list[index].uuid)
                            ? 59
                            : 72,
                        child: AppButton(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          fontSize: 8,
                          buttonColor: !provider.checkedList
                                  .contains(provider.list[index].uuid)
                              ? Styles.primary
                              : Styles.white,
                          textColor: !provider.checkedList
                                  .contains(provider.list[index].uuid)
                              ? Styles.white
                              : Styles.black,
                          side: !provider.checkedList
                                  .contains(provider.list[index].uuid)
                              ? BorderSide.none
                              : const BorderSide(color: Styles.primary),
                          text: !provider.checkedList
                                  .contains(provider.list[index].uuid)
                              ? "Follow"
                              : "Following",
                          onPressed: () {
                            provider.checkList(
                                provider.list[index].uuid.toString());
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget buildSearchWidget() {
    return Consumer<DarkThemeProvider>(builder: (context, provider, _) {
      return Container(
        height: 51,
        margin: screenPadding,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: provider.darkTheme ? Styles.white : const Color(0xfff5f5f5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextField(
          // onChanged:
          //     Provider.of<GenreProvider>(context, listen: false).filterList,
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(Assets.assetsIconsSearchIcon),
              ),
              hintText: 'Search',
              hintStyle: const TextStyle(
                color: Color(0xff828282),
              )),
        ),
      );
    });
  }
}
