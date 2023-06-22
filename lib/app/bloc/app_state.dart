part of 'app_bloc.dart';

enum AppStatus {
  unAuthenticated,
  careRecipient,
  careGiver,
  incompleteProfile,
}

class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.user = SCUser.empty,
  });

  final AppStatus status;
  final SCUser user;

  const AppState.unAuthenticated()
      : this._(
          status: AppStatus.unAuthenticated,
          user: SCUser.empty,
        );

  const AppState.incompleteProfile(SCUser user)
      : this._(
          status: AppStatus.incompleteProfile,
          user: user,
        );

  const AppState.careRecipient(SCUser user)
      : this._(
          status: AppStatus.careRecipient,
          user: user,
        );

  const AppState.careGiver(SCUser user)
      : this._(
          status: AppStatus.careGiver,
          user: user,
        );

  @override
  // TODO: implement props
  List<Object?> get props => [status, user];
}
