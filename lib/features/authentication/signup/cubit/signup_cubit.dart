import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:seniorcompanion/app/data/repository/auth_repository.dart';

import '../../../../core/form_models/email.dart';
import '../../../../core/form_models/password.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository _authRepository;
  SignupCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const SignupState());

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        validated:
            Formz.validate([email, state.password, state.confirmPassword]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        validated:
            Formz.validate([password, state.email, state.confirmPassword]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void confirmPasswordChanged(String value) {
    final confirmPassword = Password.dirty(value);
    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
        validated:
            Formz.validate([confirmPassword, state.email, state.password]) &&
                confirmPassword == state.password,
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void roleChanged(String role) {
    emit(
      state.copyWith(
        role: role,
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  Future<void> registerWithEmailAndPassword() async {
    if (!state.validated) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      var result = await _authRepository.registerWithEmailAndPassword(
          email: state.email, password: state.password, role: state.role);

      result.fold((l) {
        if (!isClosed) {
          emit(
            state.copyWith(
                status: FormzSubmissionStatus.failure, errorMessage: l),
          );
        }
      }, (r) {
        if (!isClosed) {
          emit(
            state.copyWith(status: FormzSubmissionStatus.success),
          );
        }
      });
    } catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(status: FormzSubmissionStatus.failure),
        );
      }
    }
  }
}
