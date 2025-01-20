import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:newseniiorcompaniion/app/data/repository/auth_repository.dart';

import '../../../../../core/form_models/email.dart';
import '../../../../../core/form_models/password.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  LoginCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const LoginState());

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        validated: Formz.validate([email, state.password]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        validated: Formz.validate([password, state.email]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  Future<void> loginWithCredentials() async {
    if (!state.validated) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      var result = await _authRepository.loginWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );

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

  Future<void> loginWithGoogle() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      var result = await _authRepository.loginWithGoogle();

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

  Future<void> loginWithApple() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      var result = await _authRepository.loginWithApple();

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

  Future<void> loginWithFacebook() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      var result = await _authRepository.loginWithFacebook();

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
