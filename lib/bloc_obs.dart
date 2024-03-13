import 'package:bloc/bloc.dart';
import 'utils/logger.dart';


class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logger.d('onCreate 🔋 ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.d('onChange 🔁 ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.d('onTransition  👉 ${bloc.runtimeType}, $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.e('onError ⛔️ ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    logger.d('onClose 🪫 ${bloc.runtimeType}');
  }
}
