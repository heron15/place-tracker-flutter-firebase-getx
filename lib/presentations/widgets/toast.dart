import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:m360ict_flutter_task/utils/app_colors.dart';

toastShow({
  required String text,
  required Color color,
  Color textColor = AppColors.white,
  ToastGravity toastPosition = ToastGravity.CENTER,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: toastPosition,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: textColor,
      fontSize: 16.0,
    );
