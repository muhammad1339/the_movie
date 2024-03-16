import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_movie/app_injection.dart';
import 'package:the_movie/features/discover_movie/domain/entities/discover_movies_entity.dart';

import '../app.dart';
import 'bloc_obs.dart';
import 'core/constants/k_app_const.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setupLocator();
   await Hive.initFlutter();
  Hive.registerAdapter(MovieItemEntityAdapter());
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
