part of 'signup_cubit.dart';

class SignupState extends Equatable {
  const SignupState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.role,
    this.errorMessage,
  });

  final Email email;
  final Password password;
  final Password confirmPassword;
  final String? role;
  final String? errorMessage;
  final FormzSubmissionStatus status;

  @override
  List<Object?> get props => [email, password, confirmPassword, role, status];

  SignupState copyWith({
    Email? email,
    Password? password,
    Password? confirmPassword,
    String? role,
    FormzSubmissionStatus? status,
    String? errorMessage,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      role: role ?? this.role,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
