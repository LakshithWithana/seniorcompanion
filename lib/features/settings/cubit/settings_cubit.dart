import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:seniorcompanion/features/settings/data/repositories/settings_repository.dart';

import '../../../core/form_models/general_field.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository _settingsRepository;

  SettingsCubit({required SettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository,
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

  void profilePictureURL(String path) {
    emit(state.copyWith(
      profilePicUrl: path,
      validated: state.profilePicUrl == "" ? false : true,
    ));
  }

  Future<void> profilePictureUpload(File file) async {
    try {
      // await _settingsRepository.uploadProfileImage(file: file);
    } catch (e) {
      print(e);
    }
  }

  void firstNameChanged(String value) {
    final firstName = GeneralField.dirty(value);
    emit(
      state.copyWith(
        firstName: firstName,
        validated: firstName.value == "" ? false : true,
      ),
    );
  }

  void lastNameChanged(String value) {
    final lastName = GeneralField.dirty(value);
    emit(
      state.copyWith(
        lastName: lastName,
        validated: lastName.value == "" ? false : true,
      ),
    );
  }

  void aboutChanged(String value) {
    final about = GeneralField.dirty(value);
    emit(state.copyWith(
      about: about,
      validated: about.value == "" ? false : true,
    ));
  }

  Future<void> updateUserProfileData() async {
    try {
      var result = await _settingsRepository.updateUserProfileData(
        firstName: state.firstName,
        lastName: state.lastName,
        about: state.about,
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
}
