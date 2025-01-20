part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.firstName = const GeneralField.pure(),
    this.lastName = const GeneralField.pure(),
    this.birthday = "",
    this.about = const GeneralField.pure(),
    this.gender = "female",
    this.preferences = const <String>[],
    this.validated = false,
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage,
    this.profilePicUrl = "",
    this.userDetails = UserDetails.empty,
    this.userDetailsFetchingError = "",
  });

  final GeneralField firstName;
  final GeneralField lastName;
  final String birthday;
  final GeneralField about;
  final String gender;
  final List<String> preferences;
  final FormzSubmissionStatus status;
  final bool validated;
  final String? errorMessage;
  final String profilePicUrl;
  final UserDetails userDetails;
  final String userDetailsFetchingError;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        birthday,
        about,
        gender,
        preferences,
        status,
        validated,
        profilePicUrl,
        userDetails,
        userDetailsFetchingError,
      ];

  ProfileState copyWith({
    GeneralField? firstName,
    GeneralField? lastName,
    String? birthday,
    GeneralField? about,
    String? gender,
    List<String>? preferences,
    FormzSubmissionStatus? status,
    bool? validated,
    String? errorMessage,
    String? profilePicUrl,
    UserDetails? userDetails,
    String? userDetailsFetchingError,
  }) {
    return ProfileState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthday: birthday ?? this.birthday,
      about: about ?? this.about,
      gender: gender ?? this.gender,
      preferences: preferences ?? this.preferences,
      status: status ?? this.status,
      validated: validated ?? this.validated,
      errorMessage: errorMessage ?? this.errorMessage,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      userDetails: userDetails ?? this.userDetails,
      userDetailsFetchingError:
          userDetailsFetchingError ?? this.userDetailsFetchingError,
    );
  }
}
