import 'package:flutter/material.dart';

abstract class Styles {
  //colors
  static const Color whiteColor = Color(0xffffffff);
  static const Color blackColor = Color(0xff000000);
  static const Color orangeColor = Colors.orange;
  static const Color redColor = Colors.red;
  static const Color darkRedColor = Color(0xFFB71C1C);

  static const Color purpleColor = Color(0xff5E498A);

  static const Color darkThemeColor = Color(0xff33333E);

  static const Color grayColor = Color(0xff797979);

  static const Color greyColorLight = Color(0xffd7d7d7);

  static const Color settingsBackground = Color(0xffefeff4);

  static const Color settingsGroupSubtitle = Color(0xff777777);

  static const Color iconBlue = Color(0xff0000ff);
  static const Color transparent = Colors.transparent;
  static const Color iconGold = Color(0xffdba800);
  static const Color bottomBarSelectedColor = Color(0xff5e4989);

  // colors
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color primary = Color(0xff41BAF7);
  static const Color secondary = Color(0xffffb703);
  static const Color backGround = Color(0xffF7FAFD);
  static const Color grey = Color(0xff0A0A0A);
  static const Color grey2 = Color(0xffcccccc);
  static const Color lightGrey = Color(0xffd9d9d9);
  static const Color green = Color(0xff219653);
  static const Color blue = Color(0xff2f80ed);
  static const Color yellow = Color(0xfff2c94c);
  static const Color red = Color(0xffed5757);

  //Strings
  static const TextStyle defaultTextStyle = TextStyle(
    color: Styles.purpleColor,
    fontSize: 20.0,
  );
  static const TextStyle defaultTextStyleBlack = TextStyle(
    color: Styles.blackColor,
    fontSize: 20.0,
  );
  static const TextStyle defaultTextStyleGRey = TextStyle(
    color: Styles.grayColor,
    fontSize: 20.0,
  );
  static const TextStyle smallTextStyleGRey = TextStyle(
    color: Styles.grayColor,
    fontSize: 16.0,
  );
  static const TextStyle smallTextStyle = TextStyle(
    color: Styles.purpleColor,
    fontSize: 16.0,
  );
  static const TextStyle smallTextStyleWhite = TextStyle(
    color: Styles.whiteColor,
    fontSize: 16.0,
  );
  static const TextStyle smallTextStyleBlack = TextStyle(
    color: Styles.blackColor,
    fontSize: 16.0,
  );
  static const TextStyle defaultButtonTextStyle =
      TextStyle(color: Styles.whiteColor, fontSize: 20);

  static const TextStyle profileTextStyleBlack = TextStyle(
    color: Styles.blackColor,
    fontSize: 20.0,
  );
  static const InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    border: InputBorder.none,
    errorBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
  );

  static const TextStyle defaultTextStyleWhite = TextStyle(
    color: Styles.whiteColor,
    fontSize: 20.0,
  );
  static const TextStyle messageRecipientTextStyle = TextStyle(
      color: Styles.blackColor, fontSize: 16.0, fontWeight: FontWeight.bold);

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primaryColor: isDarkTheme ? primary : primary,
      fontFamily: "Poppins",
      applyElevationOverlayColor: true,
      useMaterial3: true,
      
      
      shadowColor: isDarkTheme ? transparent : transparent,
      canvasColor: isDarkTheme ? primary : primary,
      scaffoldBackgroundColor: isDarkTheme ? black : white,
      indicatorColor:
          isDarkTheme ? const Color(0xff0E1D36) : const Color(0xffCBDCF8),
      hintColor:
          isDarkTheme ? const Color(0xff280C0B) : const Color(0xffEECED3),
      highlightColor: isDarkTheme ? transparent : transparent,
      hoverColor: isDarkTheme ? transparent : transparent,
      focusColor: isDarkTheme ? transparent : transparent,
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? const Color(0xFF151515) : Colors.white,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      inputDecorationTheme: inputDecorationTheme,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkTheme ? black : white,
        elevation: 0,
        iconTheme: IconThemeData(color: isDarkTheme ? white : black),
        toolbarTextStyle: const TextTheme().bodyLarge,
        titleTextStyle: const TextTheme().headlineSmall,
      ),
      textTheme: TextTheme(
          titleMedium: TextStyle(
        color: isDarkTheme ? white : grey,
        fontSize: 14,
      )),
      textSelectionTheme: TextSelectionThemeData(
          selectionColor: isDarkTheme ? secondary : primary),
    );
  }
}
