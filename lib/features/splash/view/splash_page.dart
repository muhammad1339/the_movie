import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_movie/core/extension/context_extensions.dart';

import '../../../core/res/assets.dart';
import '../../../core/routing/k_routes.dart';
import '../../../core/widgets/customs/copy_right.dart';
import '../cubit/splash_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()
        ..navigateToHomeScreen(
          onNavigate: () {
            context.navReplaceNamedTo(KAppRoutes.discoverMovie);
          },
        ),
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Center(
                  child: SvgPicture.asset(
                    KAppSvgs.logo,
                    height: 200.h,
                  ),
                ),
                const Spacer(),
                const CopyRightWidget(
                  appName: 'The Movie',
                  bottomMargin: 32,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
