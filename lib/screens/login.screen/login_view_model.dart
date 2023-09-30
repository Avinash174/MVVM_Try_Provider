import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_try/respository/auth_repository/auth_repository.dart';
import 'package:mvvm_try/routes/routes.dart';
import 'package:mvvm_try/utils/utils.dart';

class LogInViewModel with ChangeNotifier {
  final _authrepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _authrepo.loginApi(data).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage('Log In Successfully', context);
      Navigator.pushNamed(context, RoutesName.home);

      if (kDebugMode) {
        log(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        log(error.toString());
      }
    });
  }
}
