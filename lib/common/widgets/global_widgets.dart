import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GlobalWidgets {
  static Future<bool?> getToast(
      {required String msg,
      Color? backgroundColor,
      Color? textColor,
      double? fontSize}) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor ?? Colors.red,
        textColor: textColor ?? Colors.white,
        fontSize: fontSize ?? 16.sp);
  }
}
