import 'package:day_night_themed_switch/day_night_themed_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:streamlivr/src/providers/authentification_provider.dart';
import 'package:streamlivr/src/providers/genre_provider.dart';
import 'package:streamlivr/src/routes/router.dart';
import 'package:streamlivr/src/screens/choose_channel/choose_channel_screen.dart';
import 'package:streamlivr/src/widgets/app_button.dart';
import 'package:streamlivr/src/widgets/app_message.dart';
import 'package:streamlivr/src/widgets/build_text.dart';
import 'package:streamlivr/src/widgets/processing_dialogue.dart';
import 'package:streamlivr/src/widgets/vertical_space.dart';

import '../../../assets/assets.dart';
import '../../constants/constants.dart';
import '../../providers/dark_theme_provider.dart';
import '../../theme/style.dart';

class ChooseGenreScreen extends StatefulWidget {
  const ChooseGenreScreen({Key? key}) : super(key: key);

  @override
  State<ChooseGenreScreen> createState() => _ChooseGenreScreenState();
}

class _ChooseGenreScreenState extends State<ChooseGenreScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Provider.of<GenreProvider>(context, listen: false).fetchList();
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
              data: 'Pick What You’d Like to Watch',
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            const Verticalspace(space: 21),
            BuildText(
              data: '''Pick some Genres and we’ll show you 
some live streams you might like.''',
              color: Theme.of(context).textTheme.titleSmall!.color,
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
                  print(Provider.of<GenreProvider>(
                    context,
                    listen: false,
                  ).checkedList);
                  if (Provider.of<GenreProvider>(
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
                      .chooseGenre(
                    genres: Provider.of<GenreProvider>(
                      context,
                      listen: false,
                    ).checkedList,
                  )
                      .then((value) {
                    pop(context: context);
                    if (value.status == 'success') {
                      AppMessage.showMessage('genre selected');
                      push(
                        context: context,
                        page: const ChooseChannelScreen(),
                      );
                    } else {
                      AppMessage.showMessage('something went wrong');
                    }
                  });
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
      child: Consumer<GenreProvider>(
        builder: (context, provider, _) {
          return GridView.builder(
            padding: screenPadding,
            itemCount: provider.list.length,
            physics: const AlwaysScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 3 / 4,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  provider.checkList(provider.list[index].id.toString());
                },
                borderRadius: BorderRadius.circular(13),
                child: SizedBox(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              provider.list[index].image.toString(),
                            ),
                          ),
                          border: !provider.checkedList
                                  .contains(provider.list[index].id)
                              ? null
                              : Border.all(
                                  color: Styles.blue,
                                  width: 2,
                                ),
                        ),
                      ),
                      Positioned(
                        right: 5,
                        left: 5,
                        bottom: 5,
                        child: Center(
                          child: BuildText(
                            data: provider.list[index].title.toString(),
                            color: Styles.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Positioned(
                          right: 5,
                          top: 5,
                          child: !provider.checkedList
                                  .contains(provider.list[index].id)
                              ? const SizedBox()
                              : SvgPicture.asset(Assets.assetsIconsActiveIcon)),
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
