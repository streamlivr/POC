import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:streamlivr/src/constants/constants.dart';
import 'package:streamlivr/src/routes/router.dart';
import 'package:streamlivr/src/screens/main_screen/main_screen.dart';
import 'package:streamlivr/src/widgets/app_button.dart';
import 'package:streamlivr/src/widgets/vertical_space.dart';

import '../../widgets/build_text.dart';

class VerifyPhoneScreen extends StatelessWidget {
  const VerifyPhoneScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
            textStyle: GoogleFonts.ptMono(color: primary),
            fillColor: white,
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
          Center(
            child: BuildText(
              data: '''Resend''',
              color: primary,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          const Verticalspace(space: 90),
          AppButton(
            text: 'Verify',
            textColor: white,
            onPressed: () {
              push(context: context, page: const MainScreen());
            },
          ),
        ],
      ),
    );
  }
}
