import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String msg) {
    Fluttertoast.showToast(msg: msg);
  }

  static void flushBarErrorMessage(String msg, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: msg,
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
      )..show(context),
    );
  }

  static snackBar(String msg, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }
}
