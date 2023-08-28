part of 'blocked_status_cubit.dart';

class BlockedStatusState extends Equatable {
  const BlockedStatusState({
    this.userDetails = UserDetails.empty,
  });

  final UserDetails userDetails;

  @override
  List<Object?> get props => [userDetails];

  BlockedStatusState copyWith({
    UserDetails? userDetails,
  }) {
    return BlockedStatusState(
      userDetails: userDetails ?? this.userDetails,
    );
  }
}
