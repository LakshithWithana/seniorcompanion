import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newseniiorcompaniion/app/data/repository/auth_repository.dart';
import 'package:newseniiorcompaniion/features/settings/data/repositories/settings_repository.dart';

import '../../../core/form_models/general_field.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository _settingsRepository;
  final AuthRepository _authRepository;

  SettingsCubit(
      {required SettingsRepository settingsRepository,
      required AuthRepository authRepository})
      : _settingsRepository = settingsRepository,
        _authRepository = authRepository,
        super(const SettingsState());

  List<String> preferencesList = [];
  void addPreferencesSelection(String preferences) {
    preferencesList.add(preferences);
    emit(state.copyWith(
      preferences: List.from(preferencesList),
    ));
  }

  void removePreferencesSelection(String preferences) {
    preferencesList.remove(preferences);
    emit(state.copyWith(
      preferences: List.from(preferencesList),
    ));
  }

  Future<void> updatePreferences() async {
    try {
      var result = await _settingsRepository.updateSearchPreferences(
          preferencesList: preferencesList);

      result.fold((l) {
        if (!isClosed) {
          emit(
            state.copyWith(preferencesChanged: false),
          );
        }
      }, (r) {
        if (!isClosed) {
          emit(state.copyWith(preferencesChanged: true));
        }
      });
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(preferencesChanged: false));
      }
    }
  }

  // void profilePictureURL(String path) {
  //   emit(state.copyWith(
  //     profilePicUrl: path,
  //     validated: state.profilePicUrl == "" ? false : true,
  //   ));
  // }

  Future<void> profilePictureUpload(File file) async {
    try {
      await _settingsRepository.uploadProfileImage(file: file);
    } catch (e) {
      print(e);
    }
  }

  void firstNameChanged(
      String value, String lastValue, String lastName, String about) {
    final firstName = GeneralField.dirty(value);
    emit(
      state.copyWith(
        firstName: firstName,
        validated: firstName.value == "" ? false : true,
        firstNameLastValue: lastValue,
        firstNameChanged: true,
        lastNameLastValue: lastName,
        aboutLastValue: about,
      ),
    );
  }

  void lastNameChanged(
      String value, String lastValue, String firstName, String about) {
    final lastName = GeneralField.dirty(value);
    emit(
      state.copyWith(
        lastName: lastName,
        validated: lastName.value == "" ? false : true,
        lastNameLastValue: lastValue,
        firstNameLastValue: firstName,
        aboutLastValue: about,
      ),
    );
  }

  void aboutChanged(
      String value, String lastValue, String firstName, String lastName) {
    final about = GeneralField.dirty(value);
    emit(state.copyWith(
      about: about,
      validated: about.value == "" ? false : true,
      aboutLastValue: lastValue,
      firstNameLastValue: firstName,
      lastNameLastValue: lastName,
    ));
  }

  Future<void> updateUserProfileData() async {
    try {
      var result = await _settingsRepository.updateUserProfileData(
        firstName: state.firstName,
        lastName: state.lastName,
        about: state.about,
        firstNameLastValue: state.firstNameLastValue,
        lastNameLastValue: state.lastNameLastValue,
        aboutLastValue: state.aboutLastValue,
      );

      result.fold((l) {
        if (!isClosed) {
          emit(
            state.copyWith(),
          );
        }
      }, (r) {
        if (!isClosed) {
          emit(state.copyWith());
        }
      });
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith());
      }
    }
  }

  Future<void> deleteAccount() async {
    try {
      var result = await _settingsRepository.deleteAccount();

      result.fold((l) {
        if (!isClosed) {
          emit(
            state.copyWith(
                deleteErrorMessage:
                    "You need to have a recent login for this account deletion. First logout, and then login and request again"),
          );
        }
      }, (r) {
        if (!isClosed) {
          logOut();
          emit(state.copyWith());
        }
      });
    } catch (e) {
      if (!isClosed) {
        state.copyWith(
            deleteErrorMessage:
                "You need to have a recent login for this account deletion. First logout, and then login and request again");
      }
    }
  }

  Future<void> logOut() async {
    try {
      await _authRepository.signOutUser();
    } catch (e) {}
  }
}
