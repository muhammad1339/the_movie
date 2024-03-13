import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../res/colors.dart';

class LoadingWidget extends StatelessWidget {
  final double size;
  final Color color;

  const LoadingWidget({
    super.key,
    this.size = 48,
    this.color = KAppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitDoubleBounce(
        color: color,
        size: size.r,
      ),
    );
  }
}
