import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamlivr/src/constants/constants.dart';
import 'package:streamlivr/src/providers/authentification_provider.dart';
import 'package:streamlivr/src/providers/basic_provider.dart';
import 'package:streamlivr/src/routes/router.dart';
import 'package:streamlivr/src/screens/authentification_screen/signin_screen.dart';
import 'package:streamlivr/src/screens/authentification_screen/verify_phone.dart';
import 'package:streamlivr/src/widgets/app_button.dart';
import 'package:streamlivr/src/widgets/app_password_textfield.dart';
import 'package:streamlivr/src/widgets/app_textfield.dart';
import 'package:streamlivr/src/widgets/build_text.dart';
import 'package:streamlivr/src/widgets/vertical_space.dart';

import '../../theme/style.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthentificationProvider>(builder: (context, provider, _) {
      return Scaffold(
        appBar: AppBar(),
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
                  text: const TextSpan(children: [
                TextSpan(
                    text: "Do you already have an account?",
                    style: TextStyle(
                      color: Styles.grey,
                      fontSize: 14,
                    )),
                TextSpan(
                  text: 'Sign in',
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
                  color: Styles.black.withOpacity(0.5),
                ),
                const Verticalspace(space: 8),
                AppTextField(
                    hint: "Email",
                    prefix: const Icon(
                      Icons.person_outline,
                      color: Styles.grey,
                    ),
                    controller: TextEditingController()),
              ],
            ),
            const Verticalspace(space: 26),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildText(
                  data: 'Password',
                  fontSize: 14,
                  color: Styles.black.withOpacity(0.5),
                ),
                const Verticalspace(space: 8),
                AppPasswordTextField(
                    hint: "Password", controller: TextEditingController()),
              ],
            ),
            const Verticalspace(space: 31),
            CustomDropdown(
              hintText: 'Select job role',
              borderRadius: BorderRadius.circular(0),
              items: const ['Creator', 'Fan'],
              controller: provider.jobRoleCtrl,
            ),
            const Verticalspace(space: 54),
            Row(
              children: [
                Consumer<BasicProvider>(
                  builder: (context, provider, child) {
                    return Checkbox(
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
                push(context: context, page: const VerifyPhoneScreen());
              },
            ),
          ],
        ),
      );
    });
  }
}
