import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:streamlivr/src/routes/router.dart';
import 'package:streamlivr/src/screens/main_screen/main_screen.dart';
import 'package:streamlivr/src/screens/welcome_screen/welcome_screen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized()
        .addPostFrameCallback((timeStamp) {
  init();
        });
  
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff231459),
    );
  }

  void init() async {
    var user = FirebaseAuth.instance.currentUser;

    print(user);

    if (user != null) {
      pushRemoveAll(context: context, page: const MainScreen());
    } else {
      pushRemoveAll(context: context, page: const WelcomeScreen());
    }
  }
}
