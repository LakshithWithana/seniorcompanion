import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:seniorcompanion/app/data/repository/auth_repository.dart';

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
        status: Formz.validate([email, state.password])
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
        status: Formz.validate([password, state.email])
            ? FormzSubmissionStatus.success
            : FormzSubmissionStatus.failure,
      ),
    );
  }

  Future<void> loginWithCredentials() async {
    if (!state.status.isSuccess) return;
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
}
