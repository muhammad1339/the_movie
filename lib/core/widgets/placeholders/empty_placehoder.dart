import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_movie/core/res/assets.dart';
import 'package:the_movie/core/widgets/customs/custom_button.dart';
import 'package:the_movie/utils/utils.dart';

class EmptyPlaceHolder extends StatelessWidget {
  const EmptyPlaceHolder({
    super.key,
    this.message,
    this.asset,
    this.showRetryButton = false,
    this.onRetry,
  });
  final String? message;
  final String? asset;
  final bool showRetryButton;
  final Function()? onRetry;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          asset ?? KAppSvgs.movieRoll,
          height: 100.h,
        ),
        20.verticalSpace,
        Text(
          message ?? 'No Movies to discover yet!',
          style: KAppTextStyle.boldTextStyle,
        ),
        if (showRetryButton) 20.verticalSpace,
        if (showRetryButton)
         CustomButton(onPressed: onRetry, text: 'Retry'),
      ],
    );
  }
}
