import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:newseniiorcompaniion/core/models/user_details_model/user_details_model.dart';
import 'package:newseniiorcompaniion/core/user_details/cubit/cubit/user_details_cubit.dart';
import 'package:newseniiorcompaniion/features/profile/data/repositories/profile_repository.dart';

import '../../../core/form_models/general_field.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _profileRepository;

  ProfileCubit({required ProfileRepository profileRepository})
      : _profileRepository = profileRepository,
        super(const ProfileState());

  void profilePictureURL(String path) {
    emit(state.copyWith(
      profilePicUrl: path,
      status: FormzSubmissionStatus.initial,
      validated: state.birthday == ""
          ? false
          : true && state.preferences.isEmpty
              ? false
              : true &&
                  Formz.validate([
                    state.lastName,
                    state.firstName,
                    state.about,
                  ]),
    ));
  }

  Future<void> profilePictureUpload(File file) async {
    try {
      await _profileRepository.uploadProfileImage(file: file);
    } catch (e) {
      print(e);
    }
  }

  void firstNameChanged(String value) {
    final firstName = GeneralField.dirty(value);
    emit(
      state.copyWith(
        firstName: firstName,
        validated: Formz.validate([
                  firstName,
                  state.lastName,
                  state.about,
                ]) &&
                state.preferences.isEmpty
            ? false
            : true && state.birthday != ""
                ? true
                : false,
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void lastNameChanged(String value) {
    final lastName = GeneralField.dirty(value);
    emit(
      state.copyWith(
        lastName: lastName,
        validated: Formz.validate([
                  lastName,
                  state.firstName,
                  state.about,
                ]) &&
                state.preferences.isEmpty
            ? false
            : true && state.birthday != ""
                ? true
                : false,
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void birthdayChanged(String value) {
    final birthday = value;
    emit(state.copyWith(
      birthday: birthday,
      validated: birthday == "null" || birthday == ""
          ? false
          : true &&
                  Formz.validate([
                    state.lastName,
                    state.firstName,
                    state.about,
                  ]) &&
                  state.preferences.isEmpty
              ? false
              : true,
      status: FormzSubmissionStatus.initial,
    ));
  }

  void aboutChanged(String value) {
    final about = GeneralField.dirty(value);
    emit(state.copyWith(
      about: about,
      validated: Formz.validate([about, state.firstName, state.lastName])
              // &&
              //         state.profilePicUrl == ""
              //     ? false
              //     : true
              &&
              state.preferences.isEmpty
          ? false
          : true && state.birthday != ""
              ? true
              : false,
      status: FormzSubmissionStatus.initial,
    ));
  }

  void genderChanged(String gender) {
    emit(state.copyWith(
      gender: gender,
      status: FormzSubmissionStatus.initial,
    ));
  }

  List<String> preferencesList = [];
  void addPreferencesSelection(String preferences) {
    preferencesList.add(preferences);
    emit(state.copyWith(
      preferences: List.from(preferencesList),
      status: FormzSubmissionStatus.initial,
    ));
  }

  void removePreferencesSelection(String preferences) {
    // List<String> preferencesList = [];
    preferencesList.remove(preferences);
    emit(state.copyWith(
      preferences: List.from(preferencesList),
      status: FormzSubmissionStatus.initial,
    ));
  }

  Future<void> updateUserProfileData() async {
    if (!state.validated) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      var result = await _profileRepository.updateUserProfileData(
          firstName: state.firstName,
          lastName: state.lastName,
          birthday: state.birthday,
          about: state.about,
          gender: state.gender,
          preferences: state.preferences);

      result.fold((l) {
        if (!isClosed) {
          emit(
            state.copyWith(
                status: FormzSubmissionStatus.failure, errorMessage: l),
          );
        }
      }, (r) {
        if (!isClosed) {
          emit(state.copyWith(status: FormzSubmissionStatus.success));
        }
      });
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }

  Future<void> getUserDetails() async {
    try {
      var result = await _profileRepository.getUserDetails();
      result.fold((l) {
        if (!isClosed) {
          emit(
            state.copyWith(userDetailsFetchingError: l),
          );
        }
      }, (r) {
        emit(
          state.copyWith(userDetails: r),
        );
      });
    } catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(userDetailsFetchingError: e.toString()),
        );
      }
    }
  }
}
