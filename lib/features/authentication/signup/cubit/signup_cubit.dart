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
        status: Formz.validate([email, state.password, state.confirmPassword])
            ? FormzSubmissionStatus.success
            : FormzSubmissionStatus.failure,
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([password, state.email, state.confirmPassword])
            ? FormzSubmissionStatus.success
            : FormzSubmissionStatus.failure,
      ),
    );
  }

  void confirmPasswordChanged(String value) {
    final confirmPassword = Password.dirty(value);
    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
        status: Formz.validate([confirmPassword, state.email, state.password])
            ? FormzSubmissionStatus.success
            : FormzSubmissionStatus.failure,
      ),
    );
  }

  Future<void> registerWithEmailAndPassword() async {
    if (!state.status.isSuccess) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      var result = await _authRepository.registerWithEmailAndPassword(
          email: state.email, password: state.password, role: state.role!);

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
