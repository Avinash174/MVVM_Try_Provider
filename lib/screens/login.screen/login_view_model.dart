import 'package:flutter/material.dart';
import 'package:mvvm_try/respository/auth_repository/auth_repository.dart';

class LogInViewModel with ChangeNotifier {
  final _authrepo = AuthRepository();

  Future<void>loginApi()async{
    
  }
}
