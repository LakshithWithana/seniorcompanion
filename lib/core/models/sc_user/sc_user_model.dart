import 'package:freezed_annotation/freezed_annotation.dart';

part 'sc_user_model.freezed.dart';

@freezed
class SCUser with _$SCUser {
  const factory SCUser({
    required String uid,
    required String email,
    required String role,
  }) = _SCUser;
  const SCUser._();

  static const empty = SCUser(uid: "", email: "", role: "");

  bool get isEmpty => this == SCUser.empty;

  bool get isNotEmpty => this != SCUser.empty;
}
