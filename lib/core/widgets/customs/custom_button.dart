import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_text_styles.dart';
import '../../res/colors.dart';
import 'loading_widget.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.textSize,
    this.radius,
    this.horizontalPadding,
    this.verticalPadding,
    this.width,
    required this.onPressed,
    required this.text,
    this.hMargin,
    this.vMargin,
    this.elevation = 0,
    this.borderRadius,
    this.borderColor = Colors.transparent,
    this.isLoading = false,
    this.gradientColor,
    this.shadowColor = Colors.grey,
    this.backgroundColor = KAppColors.primaryColor,
  });

  final double? textSize;
  final double? radius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double elevation;
  final double? hMargin;
  final double? vMargin;
  final double? width;
  final Function() onPressed;
  final String text;
  final bool isLoading;
  final double? borderRadius;
  final Color borderColor;
  final Color backgroundColor;
  final Color shadowColor;
  final Gradient? gradientColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      margin: EdgeInsets.symmetric(horizontal: hMargin ?? 20.w, vertical: vMargin ?? 0.h),
      decoration: BoxDecoration(
        gradient: gradientColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 18.r),
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ButtonStyle(
          // overlayColor: MaterialStateProperty.all(overlayColor),
          // splashFactory: NoSplash.splashFactory,
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: horizontalPadding ?? 16.w, vertical: verticalPadding ?? 20.h),
          ),
          elevation: MaterialStateProperty.all(elevation),
          shadowColor: MaterialStateProperty.all(shadowColor),
          backgroundColor: MaterialStateProperty.all((gradientColor != null)? Colors.transparent : backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 18.r),
              side: BorderSide(color: borderColor),
            ),
          ),
        ),
        child: isLoading
            ? LoadingWidget(color: Colors.white, size: 30.r)
            : Text(
                text,
                style: KAppTextStyle.boldTextStyle.copyWith(fontSize: textSize ?? 18.sp, color: Colors.white),
              ),
      ),
    );
  }
}
