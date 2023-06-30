import 'package:flutter/foundation.dart' as state;
import 'package:flutter/material.dart';
import 'package:streamlivr/src/services/auth_service.dart';
import 'package:streamlivr/src/services/user_service.dart';

import '../models/register_user_model.dart';
import '../models/response_model.dart';

class AuthentificationProvider extends state.ChangeNotifier {
  final jobRoleCtrl = TextEditingController();

  Future<ResponseModel> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      var model = await AuthService.loginUser(
        email: email,
        password: password,
      );
      return ResponseModel(
        data: model,
        status: 'success',
      );
    } catch (e) {
      return ResponseModel(
        data: e,
        status: 'error',
      );
    }
  }

  Future<ResponseModel> registerUser({
    required String email,
    required String password,
    required String userType,
  }) async {
    ResponseModel? model;
    await AuthService.registerUser(
      email: email,
      password: password,
    ).then((value) async {
      if (value.status == "success") {
        await UserService.createUser(
            userData: RegisterUserModel(
          firstName: "",
          lastName: "",
          dateOfBirth: "",
          emailAddress: email,
          password: password,
          userType: userType,
          phoneNumber: "",
          avatar: "",
        ));
        model = ResponseModel(
          data: value,
          status: "success",
        );
      } else {
        model = ResponseModel(
          data: value,
          status: "error",
        );
      }
    }, onError: (e) {
      model = ResponseModel(
        data: e,
        status: "error",
      );
    });

    return model!;
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
