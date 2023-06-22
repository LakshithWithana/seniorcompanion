import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:seniorcompanion/features/profile/data/repositories/profile_repository.dart';

import '../../../core/form_models/general_field.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _profileRepository;

  ProfileCubit({required ProfileRepository profileRepository})
      : _profileRepository = profileRepository,
        super(const ProfileState());

  void firstNameChanged(String value) {
    final firstName = GeneralField.dirty(value);
    emit(
      state.copyWith(
        firstName: firstName,
        validated: Formz.validate([
          firstName,
          state.lastName,
          state.birthday,
          state.about,
        ]),
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
          state.birthday,
          state.about,
        ]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void birthdayChanged(String value) {
    final birthday = GeneralField.dirty(value);
    emit(state.copyWith(
      birthday: birthday,
      validated: Formz.validate(
          [birthday, state.firstName, state.lastName, state.about]),
      status: FormzSubmissionStatus.initial,
    ));
  }

  void aboutChanged(String value) {
    final about = GeneralField.dirty(value);
    emit(state.copyWith(
      about: about,
      validated: Formz.validate(
          [about, state.firstName, state.lastName, state.birthday]),
      status: FormzSubmissionStatus.initial,
    ));
  }

  void genderChanged(String gender) {
    emit(state.copyWith(
      gender: gender,
      status: FormzSubmissionStatus.initial,
    ));
  }

  final List<String> preferencesList = [];
  void preferencesSelection(String preferences) {
    preferencesList.add(preferences);
    emit(state.copyWith(
      preferences: preferencesList,
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
}
