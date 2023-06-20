part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.authStatusChanged({SCUser? user}) = _AuthStatusChanged;

  const factory AppEvent.logoutRequested() = _LogoutRequested;
}
