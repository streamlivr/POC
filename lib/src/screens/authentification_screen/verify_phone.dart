import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:streamlivr/src/constants/constants.dart';
import 'package:streamlivr/src/routes/router.dart';
import 'package:streamlivr/src/screens/choose_genre/choose_genre_screen.dart';
import 'package:streamlivr/src/screens/main_screen/main_screen.dart';
import 'package:streamlivr/src/widgets/app_button.dart';
import 'package:streamlivr/src/widgets/vertical_space.dart';

import '../../providers/dark_theme_provider.dart';
import '../../theme/style.dart';
import '../../widgets/build_text.dart';

class VerifyPhoneScreen extends StatelessWidget {
  const VerifyPhoneScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView(
        padding: screenPadding,
        children: [
          const BuildText(
            data: 'Verify your phone account',
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
          const Verticalspace(space: 8),
          const BuildText(
            data: '''We sent you a code to verify your phone number''',
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          const Verticalspace(space: 25),
          const BuildText(
            data: '''Sent to godswillclevin@gmail.com''',
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          const Verticalspace(space: 32),
          OtpTextField(
            numberOfFields: 5,
            filled: true,
            textStyle: GoogleFonts.ptMono(color: Styles.primary),
            fillColor: Styles.white,
            decoration: const InputDecoration(),
            showFieldAsBox: true,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            fieldWidth: 50,
          ),
          const Verticalspace(space: 60),
          const Center(
            child: BuildText(
              data: '''I don't receive a code''',
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          const Verticalspace(space: 18),
          const Center(
            child: BuildText(
              data: '''Resend''',
              color: Styles.primary,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          const Verticalspace(space: 90),
          AppButton(
            text: 'Verify',
            textColor: Styles.white,
            onPressed: () {
              push(context: context, page: const ChooseGenreScreen());
            },
          ),
        ],
      ),
    );
  }
}
