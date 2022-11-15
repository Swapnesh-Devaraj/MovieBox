import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(String message, BuildContext context) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
  );
}
