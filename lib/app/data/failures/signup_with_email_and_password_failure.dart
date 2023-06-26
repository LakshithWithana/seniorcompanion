class SignUpWithEmailAndPasswordFailure implements Exception {
  /// The associated error message.
  final String message;

  /// {@macro log_in_with_email_and_password_failure}
  const SignUpWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
          'This email already exists in the system. Please use another email to register.',
        );
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
          'The email address is already in use by another account. Please use another email to register.',
        );

      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
