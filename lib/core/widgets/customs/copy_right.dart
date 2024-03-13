import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_text_styles.dart';
import '../../localization/app_localization.dart';
import '../../res/colors.dart';

class CopyRightWidget extends StatelessWidget {
  const CopyRightWidget({
    super.key,
    required this.appName,
    this.bottomMargin = 32,
  });

  final String appName;
  final double bottomMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: bottomMargin.h),
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: '${AppLocalizations.of(context)?.translate('all_rights_reserved')} $appName',
              style: KAppTextStyle.boldTextStyle.copyWith(fontSize: 14.sp),
            ),
            TextSpan(
              text: ' © ${DateTime.now().year.toString()}',
              style: KAppTextStyle.boldTextStyle.copyWith(
                fontSize: 14.sp,
                color: KAppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
