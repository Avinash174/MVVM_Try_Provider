import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_try/model/user_model.dart';
import 'package:mvvm_try/routes/routes.dart';
import 'package:mvvm_try/screens/login.screen/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthantication(BuildContext context) async {
    getUserData().then((value) async {
      if (value.token == 'null' || value.token == '') {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.signUp);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        log(error.toString());
      }
    });
  }
}
