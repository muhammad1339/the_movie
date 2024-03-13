import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/localization/app_localizations_setup.dart';
import 'core/localization/lang_bloc/local_cubit.dart';
import 'core/routing/k_routes.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    _applySystemChrome();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => LocalCubit()),
      ],
      child: BlocConsumer<LocalCubit, LocalStates>(
        listener: (BuildContext context, LocalStates state) {},
        buildWhen: (LocalStates previousState, LocalStates currentState) => previousState != currentState,
        builder: (_, LocalStates localeState) => MaterialApp(
          theme: ThemeData(useMaterial3: true),
          title: 'The Movie',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizationSetup.localizationsDelegate,
          supportedLocales: AppLocalizationSetup.supportedLocales,
          locale: localeState.locale,
          onGenerateRoute: KAppRoutes.generateRoute,
          initialRoute: KAppRoutes.splash,
        ),
      ),
    );
  }

  _applySystemChrome() async {
    SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
