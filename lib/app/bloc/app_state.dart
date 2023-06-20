part of 'app_bloc.dart';

enum AppStatus {
  unAuthenticated,
  careRecipient,
  careGiver,
}

class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.user = SCUser.empty,
    // this.userDetails = const Stream<UserDetails>.empty(),
  });

  final AppStatus status;
  final SCUser user;
  // final Stream<UserDetails> userDetails;

  const AppState.unAuthenticated()
      : this._(
          status: AppStatus.unAuthenticated,
          user: SCUser.empty,
          // userDetails: const Stream<UserDetails>.empty()
        );

  const AppState.careRecipient(SCUser user)
      : this._(
          status: AppStatus.careRecipient,
          user: user,
          // userDetails: userDetails
        );

  const AppState.careGiver(SCUser user)
      : this._(
          status: AppStatus.careGiver, user: user,
          // userDetails: userDetails
        );

  @override
  // TODO: implement props
  List<Object?> get props => [status, user];
}
