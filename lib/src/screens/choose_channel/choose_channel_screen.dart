import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:streamlivr/src/providers/genre_provider.dart';
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

class ChooseChannelScreen extends StatelessWidget {
  const ChooseChannelScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
              child: FlutterSwitch(
                width: 35.49,
                height: 17.74,
                toggleSize: 20.0,
                value: provider.darkTheme,
                borderRadius: 30.0,
                padding: 2.0,
                toggleColor: const Color.fromRGBO(225, 225, 225, 1),
                switchBorder: Border.all(
                  color: const Color.fromRGBO(2, 107, 206, 1),
                  width: 0.0,
                ),
                toggleBorder: Border.all(
                  color: const Color.fromRGBO(2, 107, 206, 1),
                  width: 0.0,
                ),
                activeColor: Styles.primary,
                inactiveColor: Colors.black38,
                onToggle: (value) {
                  themeProvider.darkTheme = !themeProvider.darkTheme;
                },
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
            data: '''Follow some of the live streaming channels 
that you may know below''',
            color: Styles.black.withOpacity(0.6),
            fontSize: 14,
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
                push(context: context, page: const MainScreen());
              },
            ),
          )
        ],
      ),
    );
  }

  Widget builtListWidget() {
    return Expanded(
      child: Consumer<GenreProvider>(builder: (context, provider, _) {
        return ListView.builder(
          padding: screenPadding,
          itemCount: provider.list.length,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                provider.checkList(provider.list[index]);
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
                          image: AssetImage(
                            provider.list[index].image.toString(),
                          ),
                        ),
                      ),
                    ),
                    const Horizontalspace(space: 5),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BuildText(
                          data: 'Channel',
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                        BuildText(
                          data: '249k follower',
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          color: Color(0xff676767),
                        ),
                      ],
                    ),
                    const Spacer(),
                    AnimatedContainer(
                      duration: KAninationDuration,
                      height: 26,
                      width:
                          !provider.checkedList.contains(provider.list[index])
                              ? 59
                              : 72,
                      child: AppButton(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        fontSize: 8,
                        buttonColor:
                            !provider.checkedList.contains(provider.list[index])
                                ? Styles.primary
                                : Styles.white,
                        textColor:
                            !provider.checkedList.contains(provider.list[index])
                                ? Styles.white
                                : Styles.black,
                        side:
                            !provider.checkedList.contains(provider.list[index])
                                ? BorderSide.none
                                : const BorderSide(color: Styles.primary),
                        text:
                            !provider.checkedList.contains(provider.list[index])
                                ? "Follow"
                                : "Following",
                        onPressed: () {
                          provider.checkList(provider.list[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
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
