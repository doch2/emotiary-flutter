import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EmoitalyToast {
  showToast(String message) => Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color(0xE6FFFFFF),
      textColor: Colors.black,
      fontSize: 13.0);
}