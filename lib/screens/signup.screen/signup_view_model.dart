import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_try/respository/auth_repository/auth_repository.dart';
import 'package:mvvm_try/routes/routes.dart';
import 'package:mvvm_try/utils/utils.dart';

class SignUpViewModel with ChangeNotifier {
  final _authrepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;
  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _authrepo.regApi(data).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage('Account Create Successfully', context);
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
