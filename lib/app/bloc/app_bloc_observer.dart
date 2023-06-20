import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    if (true) {
      print("Event $bloc$event Event");
    }

    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    if (true) {
      print("Error in $bloc$error Error");
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    if (true) {
      print("Change in $bloc$change Change");
    }
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }
}
