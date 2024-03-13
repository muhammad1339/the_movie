import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'app_text_styles.dart';

void showToast({
  required BuildContext context,
  required String message,
  Color backgroundColor = Colors.black,
  int duration = Toast.lengthLong,
}) {
  ToastContext().init(context);
  Toast.show(
    message,
    textStyle: KAppTextStyle.regularTextStyle.copyWith(
      color: Colors.white,
      fontSize: 14,
    ),
    backgroundColor: backgroundColor,
    duration: duration,
  );
}


