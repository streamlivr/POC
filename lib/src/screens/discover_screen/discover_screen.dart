import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streamlivr/assets/assets.dart';
import 'package:streamlivr/src/constants/constants.dart';
import 'package:streamlivr/src/models/category_model.dart';
import 'package:streamlivr/src/models/streaming_model.dart';
import 'package:streamlivr/src/routes/router.dart';
import 'package:streamlivr/src/screens/live_screen/live_screen.dart';
import 'package:streamlivr/src/widgets/build_text.dart';
import 'package:streamlivr/src/widgets/horizontal_space.dart';
import 'package:streamlivr/src/widgets/vertical_space.dart';

import '../../theme/style.dart';
import '../../widgets/my_app_bar.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var stream = <StreamingModel>[
      StreamingModel(
          title: "Streaming",
          avatar: Assets.assetsImagesImage,
          image: Assets.assetsImagesStream1,
          subtitle: "Daily Life",
          userName: "Kachi",
          views: "2000",
          tag: ["Vlog", "Entertainment", "English"]),
      StreamingModel(
          title: "Streaming",
          avatar: Assets.assetsImagesImage,
          image: Assets.assetsImagesStream1,
          subtitle: "Daily Life",
          userName: "Kachi",
          views: "2000",
          tag: ["Vlog", "Entertainment", "English"]),
      StreamingModel(
          title: "Streaming",
          avatar: Assets.assetsImagesImage,
          image: Assets.assetsImagesStream1,
          subtitle: "Daily Life",
          userName: "Kachi",
          views: "2000",
          tag: ["Vlog", "Entertainment", "English"]),
      StreamingModel(
          title: "Streaming",
          avatar: Assets.assetsImagesImage,
          image: Assets.assetsImagesStream1,
          subtitle: "Daily Life",
          userName: "Kachi",
          views: "2000",
          tag: ["Vlog", "Entertainment", "English"]),
      StreamingModel(
          title: "Streaming",
          avatar: Assets.assetsImagesImage,
          image: Assets.assetsImagesStream1,
          subtitle: "Daily Life",
          userName: "Kachi",
          views: "2000",
          tag: ["Vlog", "Entertainment", "English"]),
      StreamingModel(
          title: "Streaming",
          avatar: Assets.assetsImagesImage,
          image: Assets.assetsImagesStream1,
          subtitle: "Daily Life",
          userName: "Kachi",
          views: "2000",
          tag: ["Vlog", "Entertainment", "English"]),
    ];
    var category = <CategoryModel>[
      CategoryModel(title: "Games"),
      CategoryModel(title: "Music"),
      CategoryModel(title: "Creative"),
      CategoryModel(title: "Games"),
      CategoryModel(title: "Music"),
      CategoryModel(title: "Creative"),
    ];
    return Scaffold(
      backgroundColor: Styles.transparent,
      body: Column(
        children: [
          const Verticalspace(space: 24),
          Padding(
            padding: screenPadding,
            child: MyAppBar(
              pageTitle: 'Discover',
              onPressed: () {},
            ),
          ),
          buildSearchWidget(),
          Expanded(
              child: ListView(
            children: [
              const Verticalspace(space: 30),
              buildLiveWidget(model: stream),
              buildCategory(model: category),
              const Verticalspace(space: 13),
              Padding(
                padding: screenPadding,
                child: Row(
                  children: [
                    const BuildText(
                      data: 'Top Streamers Live',
                      color: Styles.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    const Spacer(),
                    TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                          color: Styles.primary,
                        )),
                        onPressed: () {},
                        child: const Text('view all'))
                  ],
                ),
              ),
              const Verticalspace(space: 13),
              buildLiveStreamWidget(model: stream),
            ],
          ))
        ],
      ),
    );
  }

  Widget buildCategory({required List<CategoryModel> model}) {
    return SizedBox(
      height: 36,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: model
            .asMap()
            .entries
            .map((e) => Container(
                  height: 40,
                  margin: const EdgeInsets.only(right: 12),
                  width: 109,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Styles.primary,
                  ),
                  child: Center(
                    child: BuildText(
                      data: e.value.title!,
                      color: Styles.white,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget buildLiveWidget({required List<StreamingModel> model}) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                push(context: context, page: LiveScreen(model: model[index]));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 270,
                    height: 156,
                    child: Stack(
                      children: [
                        Container(
                          width: 270,
                          height: 156,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(model[index].image!)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Row(
                            children: [
                              Container(
                                height: 28,
                                width: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xffeb5757)),
                                child: const Center(
                                  child: BuildText(
                                    data: 'LIVE',
                                    color: Styles.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const Horizontalspace(space: 5),
                              Container(
                                height: 28,
                                width: 70,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xff333333)
                                        .withOpacity(0.4)),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.remove_red_eye,
                                        color: Styles.white,
                                      ),
                                      const Horizontalspace(space: 5),
                                      BuildText(
                                        data: formatNumber(model[index].views!),
                                        color: Styles.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const Verticalspace(space: 13),
                  BuildText(
                    data: model[index].userName!,
                    color: Styles.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  Row(
                    children: [
                      BuildText(
                        data: model[index].title!,
                        color: const Color(0xff1d9ddd),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      const BuildText(
                        data: "-",
                        color: Color(0xff828282),
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                      BuildText(
                        data: model[index].subtitle!,
                        color: const Color(0xff828282),
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                      Row(
                        children: model[index]
                            .tag!
                            .asMap()
                            .entries
                            .map((e) => Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  padding: const EdgeInsets.only(
                                      top: 2, bottom: 3, left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: const Color(0xff343232),
                                  ),
                                  child: BuildText(
                                    data: e.value,
                                    fontSize: 5,
                                    fontWeight: FontWeight.w500,
                                    color: Styles.white,
                                  ),
                                ))
                            .toList(),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Horizontalspace(space: 10);
          },
          itemCount: model.length),
    );
  }

  Widget buildLiveStreamWidget({required List<StreamingModel> model}) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 270,
                  height: 156,
                  child: Stack(
                    children: [
                      Container(
                        width: 270,
                        height: 156,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(model[index].image!)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Row(
                          children: [
                            Container(
                              height: 28,
                              width: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffeb5757)),
                              child: const Center(
                                child: BuildText(
                                  data: 'LIVE',
                                  color: Styles.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Horizontalspace(space: 5),
                            Container(
                              height: 28,
                              width: 70,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color(0xff333333).withOpacity(0.4)),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.remove_red_eye,
                                      color: Styles.white,
                                    ),
                                    const Horizontalspace(space: 5),
                                    BuildText(
                                      data: formatNumber(model[index].views!),
                                      color: Styles.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Verticalspace(space: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 34,
                      width: 34,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(model[index].avatar!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Horizontalspace(space: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BuildText(
                          data: model[index].userName!,
                          color: Styles.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        Row(
                          children: [
                            BuildText(
                              data: model[index].title!,
                              color: Styles.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                            BuildText(
                              data: model[index].subtitle!,
                              color: Styles.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          ],
                        ),
                        const Verticalspace(space: 5),
                        Row(
                          children: model[index]
                              .tag!
                              .asMap()
                              .entries
                              .map((e) => Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    padding: const EdgeInsets.only(
                                        top: 2, bottom: 3, left: 10, right: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: const Color(0xff343232),
                                    ),
                                    child: BuildText(
                                      data: e.value,
                                      fontSize: 5,
                                      fontWeight: FontWeight.w500,
                                      color: Styles.white,
                                    ),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return const Horizontalspace(space: 10);
          },
          itemCount: model.length),
    );
  }

  String formatNumber(String data) {
    if (int.parse(data) < 1000) {
      return data;
    } else if (data == "") {
      return '0';
    } else {
      return '${(int.parse(data)) / 1000}k';
    }
  }

  Widget buildSearchWidget() {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 51,
        margin: screenPadding,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Styles.white,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(Assets.assetsIconsSearchIcon),
            const Horizontalspace(space: 20),
            const BuildText(
              data: 'Search live channels or streamers',
              color: Color(0xff828282),
            ),
          ],
        ),
      ),
    );
  }
}
