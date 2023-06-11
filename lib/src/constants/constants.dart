import 'package:flutter/material.dart';

String appName = "shop more";
String baseUrl = "https://backend-service-qo4m.onrender.com";

EdgeInsetsGeometry screenPadding = const EdgeInsets.symmetric(horizontal: 23);

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
