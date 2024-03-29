import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:day_night_themed_switch/day_night_themed_switch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamlivr/src/constants/constants.dart';
import 'package:streamlivr/src/providers/authentification_provider.dart';
import 'package:streamlivr/src/providers/basic_provider.dart';
import 'package:streamlivr/src/routes/router.dart';
import 'package:streamlivr/src/screens/authentification_screen/signin_screen.dart';
import 'package:streamlivr/src/screens/choose_genre/choose_genre_screen.dart';
import 'package:streamlivr/src/widgets/app_button.dart';
import 'package:streamlivr/src/widgets/app_password_textfield.dart';
import 'package:streamlivr/src/widgets/app_textfield.dart';
import 'package:streamlivr/src/widgets/build_text.dart';
import 'package:streamlivr/src/widgets/processing_dialogue.dart';
import 'package:streamlivr/src/widgets/vertical_space.dart';

import '../../providers/dark_theme_provider.dart';
import '../../theme/style.dart';
import '../../widgets/app_message.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var emailTextEditingCOntroller = TextEditingController();
  var passwordTextEditingCOntroller = TextEditingController();
  var userType = "";

  @override
  void dispose() {
    super.dispose();
    emailTextEditingCOntroller.dispose();
    passwordTextEditingCOntroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthentificationProvider>(builder: (context, provider, _) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
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
        body: ListView(
          padding: screenPadding,
          children: [
            const BuildText(
              data: 'Create your free account',
              fontSize: 24,
            ),
            InkWell(
              onTap: () {
                push(context: context, page: const SignInScreen());
              },
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Do you already have an account?",
                    style: Theme.of(context).textTheme.titleSmall),
                const TextSpan(
                  text: ' Sign in',
                  style: TextStyle(
                    color: Styles.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ])),
            ),
            const Verticalspace(space: 36),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildText(
                  data: 'E-mail',
                  fontSize: 14,
                  color: Theme.of(context)
                      .appBarTheme
                      .iconTheme!
                      .color!
                      .withOpacity(0.5),
                ),
                const Verticalspace(space: 8),
                AppTextField(
                    hint: "Email",
                    prefix: const Icon(
                      Icons.person_outline,
                      color: Styles.grey,
                    ),
                    controller: emailTextEditingCOntroller),
              ],
            ),
            const Verticalspace(space: 26),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildText(
                  data: 'Password',
                  fontSize: 14,
                  color: Theme.of(context)
                      .appBarTheme
                      .iconTheme!
                      .color!
                      .withOpacity(0.5),
                ),
                const Verticalspace(space: 8),
                AppPasswordTextField(
                    hint: "Password",
                    controller: passwordTextEditingCOntroller),
              ],
            ),
            // const Verticalspace(space: 31),
            // CustomDropdown(
            //   hintText: 'Select job role',
            //   listItemStyle: const TextStyle(
            //     color: Styles.black,
            //   ),
            //   selectedStyle: const TextStyle(
            //     color: Styles.black,
            //   ),
            //   borderRadius: BorderRadius.circular(0),
            //   items: const ['Creator', 'Fan'],
            //   controller: provider.jobRoleCtrl,
            //   onChanged: (p0) {
            //     setState(() {
            //       userType = p0;
            //     });
            //   },
            // ),
            const Verticalspace(space: 54),
            Row(
              children: [
                Consumer<BasicProvider>(
                  builder: (context, provider, child) {
                    return Checkbox(
                      side: const BorderSide(
                        color: Styles.primary,
                        width: 3,
                      ),
                      activeColor: Styles.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      value: provider.check,
                      onChanged: (value) => provider.checkBox(!value!),
                    );
                  },
                ),
                const BuildText(
                  data: 'I accept the terms and privacy policy',
                  fontSize: 14,
                )
              ],
            ),
            const Verticalspace(space: 43),
            AppButton(
              text: 'Continue',
              textColor: Styles.white,
              onPressed: () {
                if (emailTextEditingCOntroller.text.isEmpty) {
                  AppMessage.showMessage("email field cannot be empty");
                  return;
                }
                if (passwordTextEditingCOntroller.text.isEmpty) {
                  AppMessage.showMessage("password field cannot be empty");
                  return;
                }
                if (!Provider.of<BasicProvider>(context, listen: false).check) {
                  AppMessage.showMessage(
                      "Please check Accept term and privacy");
                  return;
                }
                ProcessingDialog.showProcessingDialog(context: context);
                provider
                    .registerUser(
                        email: emailTextEditingCOntroller.text,
                        password: passwordTextEditingCOntroller.text,
                        )
                    .then((value) async {
                  Navigator.pop(context);

                  await FirebaseAuth.instance.currentUser!
                      .sendEmailVerification()
                      .then((value) {
                    AppMessage.showMessage("Go to your mail to verify email");
                    pushRemoveAll(
                        context: context, page: const ChooseGenreScreen());
                  });
                }).onError((error, stackTrace) {
                  AppMessage.showMessage(error.toString());
                });
              },
            ),
          ],
        ),
      );
    });
  }
}
