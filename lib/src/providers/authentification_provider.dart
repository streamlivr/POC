import 'package:flutter/foundation.dart' as state;
import 'package:flutter/material.dart';
import 'package:streamlivr/src/services/auth_service.dart';
import 'package:streamlivr/src/services/user_service.dart';

import '../models/register_user_model.dart';
import '../models/response_model.dart';

class AuthentificationProvider extends state.ChangeNotifier {
  final jobRoleCtrl = TextEditingController();

  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    await AuthService.registerUser(
      email: email,
      password: password,
    ).then((value) async {
      await UserService.createUser(
          userData: RegisterUserModel(
        firstName: "",
        lastName: "",
        dateOfBirth: "",
        emailAddress: email,
        password: password,
        userType: "",
        phoneNumber: "",
        avatar: "",
      ));
    }).onError((error, stackTrace) {
      return Future.error(error.toString());
    });
  }

  Future<ResponseModel> chooseGenre({
    required List<dynamic> genres,
  }) async {
    try {
      var result = await UserService.chooseGenre(genre: genres);
      return ResponseModel(
        data: result,
        status: "success",
      );
    } catch (e) {
      return ResponseModel(
        data: e,
        status: 'error',
      );
    }
  }

  Future<ResponseModel> chooseChannel({
    required List<dynamic> channel,
  }) async {
    try {
      var result = await UserService.chooseChannel(channel: channel);
      return ResponseModel(
        data: result,
        status: "success",
      );
    } catch (e) {
      return ResponseModel(
        data: e,
        status: 'error',
      );
    }
  }
}
