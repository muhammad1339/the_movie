import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app.dart';
import 'bloc_obs.dart';
import 'core/constants/k_app_const.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  runApp(
    ScreenUtilInit(
      designSize: Size(
        KAppConst.designScreenW,
        KAppConst.designScreenH,
      ),
      minTextAdapt: false,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? child) {
        return const App();
      },
    ),
  );
}
