import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_try/respository/auth_repository/auth_repository.dart';
import 'package:mvvm_try/utils/utils.dart';

class LogInViewModel with ChangeNotifier {
  final _authrepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    _authrepo.loginApi(data).then((value) {
      Utils.flushBarErrorMessage('Log In Successfully', context);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(value.toString(), context);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);
      }
    });
  }
}
