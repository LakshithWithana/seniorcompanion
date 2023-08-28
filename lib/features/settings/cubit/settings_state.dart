part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState({
    this.firstName = const GeneralField.pure(),
    this.lastName = const GeneralField.pure(),
    this.birthday = "",
    this.about = const GeneralField.pure(),
    this.gender = "female",
    this.preferences = const <String>[],
    this.preferencesChanged = false,
    this.validated = false,
    this.errorMessage,
    this.profilePicUrl = "",
  });

  final GeneralField firstName;
  final GeneralField lastName;
  final String birthday;
  final GeneralField about;
  final String gender;
  final List<String> preferences;
  final bool preferencesChanged;
  final bool validated;
  final String? errorMessage;
  final String profilePicUrl;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        birthday,
        about,
        gender,
        preferences,
        preferencesChanged,
        validated,
        profilePicUrl,
      ];

  SettingsState copyWith({
    GeneralField? firstName,
    GeneralField? lastName,
    String? birthday,
    GeneralField? about,
    String? gender,
    List<String>? preferences,
    bool? preferencesChanged,
    bool? validated,
    String? errorMessage,
    String? profilePicUrl,
  }) {
    return SettingsState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthday: birthday ?? this.birthday,
      about: about ?? this.about,
      gender: gender ?? this.gender,
      preferences: preferences ?? this.preferences,
      preferencesChanged: preferencesChanged ?? this.preferencesChanged,
      validated: validated ?? this.validated,
      errorMessage: errorMessage ?? this.errorMessage,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
    );
  }
}
