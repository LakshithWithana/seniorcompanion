import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_details_model.freezed.dart';

part 'user_details_model.g.dart';

@Freezed(toJson: true, fromJson: true)
class UserDetails with _$UserDetails {
  const factory UserDetails({
    @JsonKey(name: 'uid') required String uid,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'firstName') required String firstName,
    @JsonKey(name: 'lastName') required String lastName,
    @JsonKey(name: 'role') required String role,
    @JsonKey(name: 'birthday') required String birthday,
    @JsonKey(name: 'about') required String about,
    @JsonKey(name: 'gender') required String gender,
    @JsonKey(name: 'preferences') required List<String> preferences,
    @JsonKey(name: 'profilePicURL') required String profilePicURL,
  }) = _UserDetails;

  static const empty = UserDetails(
    uid: "",
    email: "",
    firstName: "",
    lastName: "",
    role: "",
    birthday: "",
    about: "",
    gender: "",
    preferences: [],
    profilePicURL: "",
  );

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);
}
