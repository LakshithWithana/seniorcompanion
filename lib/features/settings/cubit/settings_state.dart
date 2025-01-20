part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState({
    this.firstName = const GeneralField.pure(),
    this.firstNameLastValue = "",
    this.firstNameChanged = false,
    this.lastName = const GeneralField.pure(),
    this.lastNameLastValue = "",
    this.lastNameChanged = false,
    this.birthday = "",
    this.about = const GeneralField.pure(),
    this.aboutLastValue = "",
    this.aboutChanged = false,
    this.gender = "female",
    this.preferences = const <String>[],
    this.preferencesChanged = false,
    this.validated = false,
    this.errorMessage,
    this.profilePicUrl = "",
    this.deleteErrorMessage = "",
  });

  final GeneralField firstName;
  final String firstNameLastValue;
  final bool firstNameChanged;
  final GeneralField lastName;
  final String lastNameLastValue;
  final bool lastNameChanged;
  final String birthday;
  final GeneralField about;
  final String aboutLastValue;
  final bool aboutChanged;
  final String gender;
  final List<String> preferences;
  final bool preferencesChanged;
  final bool validated;
  final String? errorMessage;
  final String profilePicUrl;
  final String deleteErrorMessage;

  @override
  List<Object?> get props => [
        firstName,
        firstNameLastValue,
        firstNameChanged,
        lastName,
        lastNameLastValue,
        lastNameChanged,
        birthday,
        about,
        aboutLastValue,
        aboutChanged,
        gender,
        preferences,
        preferencesChanged,
        validated,
        profilePicUrl,
      ];

  SettingsState copyWith({
    GeneralField? firstName,
    String? firstNameLastValue,
    bool? firstNameChanged,
    GeneralField? lastName,
    String? lastNameLastValue,
    bool? lastNameChanged,
    String? birthday,
    GeneralField? about,
    String? aboutLastValue,
    bool? aboutChanged,
    String? gender,
    List<String>? preferences,
    bool? preferencesChanged,
    bool? validated,
    String? errorMessage,
    String? profilePicUrl,
    String? deleteErrorMessage,
  }) {
    return SettingsState(
      firstName: firstName ?? this.firstName,
      firstNameLastValue: firstNameLastValue ?? this.firstNameLastValue,
      firstNameChanged: firstNameChanged ?? this.firstNameChanged,
      lastName: lastName ?? this.lastName,
      lastNameLastValue: lastNameLastValue ?? this.lastNameLastValue,
      lastNameChanged: lastNameChanged ?? this.lastNameChanged,
      birthday: birthday ?? this.birthday,
      about: about ?? this.about,
      aboutLastValue: aboutLastValue ?? this.aboutLastValue,
      aboutChanged: aboutChanged ?? this.aboutChanged,
      gender: gender ?? this.gender,
      preferences: preferences ?? this.preferences,
      preferencesChanged: preferencesChanged ?? this.preferencesChanged,
      validated: validated ?? this.validated,
      errorMessage: errorMessage ?? this.errorMessage,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      deleteErrorMessage: deleteErrorMessage ?? this.deleteErrorMessage,
    );
  }
}
