import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/k_app_const.dart';
import '../core/res/colors.dart';

class KAppTextStyle {
  static TextStyle boldTextStyle = TextStyle(
    color: KAppColors.primaryColor,
    fontSize: 15.sp,
    fontFamily: KAppConst.APP_Font,
    fontWeight: FontWeight.bold,
  );

  static TextStyle regularTextStyle = TextStyle(
    color: KAppColors.primaryColor,
    fontSize: 15.sp,
    fontFamily: KAppConst.APP_Font,
    fontWeight: FontWeight.normal,
  );

  static TextStyle inputStyle = TextStyle(
    color: KAppColors.primaryColor,
    fontSize: 16.sp,
    fontFamily: KAppConst.APP_Font,
    fontWeight: FontWeight.normal,
  );

  static TextStyle hintStyle = TextStyle(
    color: KAppColors.hintColor,
    fontSize: 16.sp,
    fontFamily: KAppConst.APP_Font,
    fontWeight: FontWeight.normal,
  );

  // static TextStyle regularElMessiriTextStyle = TextStyle(
  //   color: KAppColors.primaryColor,
  //   fontSize: 16.sp,
  //   fontFamily: KAppConfig.APP_Font_ElMessiri,
  //   fontWeight: FontWeight.bold,
  // );
}
