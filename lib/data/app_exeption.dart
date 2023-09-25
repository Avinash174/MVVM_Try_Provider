class AppExecption implements Exception {
  final _message;
  final _prefix;
  AppExecption([this._message, this._prefix]);
  String toString() {
    return '$_prefix$_message';
  }
}

class FetDataExecption extends AppExecption {
  FetDataExecption([String? message])
      : super(message, "Error During Communication");
}

class BadRequestExecption extends AppExecption {
  BadRequestExecption([String? message]) : super(message, "Invalid Request");
}

class UnauthorizeExecption extends AppExecption {
  UnauthorizeExecption([String? message])
      : super(message, "Unauthorize Request");
}
