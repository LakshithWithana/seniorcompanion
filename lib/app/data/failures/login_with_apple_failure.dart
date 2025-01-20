class LogInWithAppleFailure implements Exception {
  /// The associated error message.
  final String message;

  /// {@macro log_in_with_email_and_password_failure}
  const LogInWithAppleFailure([
    this.message = 'Apple failed to login',
  ]);

  factory LogInWithAppleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const LogInWithAppleFailure(
          'An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.',
        );
      case 'invalid-credential':
        return const LogInWithAppleFailure(
          'The supplied auth credential is malformed or has expired. Please try again with valid credentials.',
        );
      case 'operation-not-allowed':
        return const LogInWithAppleFailure(
          'Sign in with Apple is not enabled. Enable it in the Firebase console under the sign-in method tab of the Auth section.',
        );
      case 'user-disabled':
        return const LogInWithAppleFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithAppleFailure(
          'User does not exist. Please create an account.',
        );
      case 'wrong-password':
        return const LogInWithAppleFailure(
          'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return const LogInWithAppleFailure(
          'The SMS verification code used is invalid. Please resend the verification code SMS and be sure to use the verification code provided by the user.',
        );
      case 'invalid-verification-id':
        return const LogInWithAppleFailure(
          'The verification ID used is invalid. Please try again with a valid verification ID.',
        );
      default:
        return const LogInWithAppleFailure();
    }
  }
}
