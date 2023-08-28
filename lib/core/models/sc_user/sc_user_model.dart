import 'package:freezed_annotation/freezed_annotation.dart';

part 'sc_user_model.freezed.dart';

@freezed
class SCUser with _$SCUser {
  const factory SCUser({
    required String uid,
    required String email,
    required String role,
    required bool profileUpdated,
    required bool tmpBlock,
    required bool pmtBlock,
  }) = _SCUser;
  const SCUser._();

  static const empty = SCUser(
      uid: "",
      email: "",
      role: "",
      profileUpdated: false,
      tmpBlock: false,
      pmtBlock: false);

  bool get isEmpty => this == SCUser.empty;

  bool get isNotEmpty => this != SCUser.empty;
}
