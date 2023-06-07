import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String appName = "shop more";
String baseUrl = "https://backend-service-qo4m.onrender.com";

ThemeData appTheme = ThemeData(
    useMaterial3: true,
    inputDecorationTheme: inputDecorationTheme,
    fontFamily: GoogleFonts.ubuntu().fontFamily,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: backGround,
    splashColor: primary.withOpacity(0.5));

var inputDecorationTheme = const InputDecorationTheme(
  border: InputBorder.none,
  errorBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  focusedBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
);

EdgeInsetsGeometry screenPadding = const EdgeInsets.symmetric(horizontal: 23);

// colors
Color black = Colors.black;
Color white = Colors.white;
Color primary = const Color(0xff41BAF7);
Color transparent = Colors.transparent;
Color secondary = const Color(0xffffb703);
Color backGround = const Color(0xffF7FAFD);
Color grey = const Color(0xff0A0A0A);
Color grey2 = const Color(0xffcccccc);
Color lightGrey = const Color(0xffd9d9d9);
Color green = const Color(0xff219653);
Color blue = const Color(0xff2f80ed);
Color yellow = const Color(0xfff2c94c);
Color red = const Color(0xffed5757);

// sizes
double dp32 = 32.0;
double dp20 = 20.0;
double dp14 = 14.0;

// Form Error
final RegExp emailValidatorRegExp = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
final RegExp passwordValidatorRegExp = RegExp(r"(?=.*[A-Z])(?=.*[a-z])\w+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kInvalidPasswordError =
    "Password should contain at least \n1 uppercase, 1 lowercase,\n1 symbol and 1 number,";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
const String FIELD_REQUIRED_MSG = "This field is required";
