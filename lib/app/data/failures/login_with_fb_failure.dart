class LogInWithFacebookFailure implements Exception {
  /// The associated error message.
  final String message;

  /// {@macro log_in_with_email_and_password_failure}
  const LogInWithFacebookFailure([
    this.message = 'Facebook failed to login',
  ]);

  factory LogInWithFacebookFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const LogInWithFacebookFailure(
          'An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.',
        );
      case 'invalid-credential':
        return const LogInWithFacebookFailure(
          'The supplied auth credential is malformed or has expired. Please try again with valid credentials.',
        );
      case 'operation-not-allowed':
        return const LogInWithFacebookFailure(
          'Sign in with Facebook is not enabled. Enable it in the Firebase console under the sign-in method tab of the Auth section.',
        );
      case 'user-disabled':
        return const LogInWithFacebookFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithFacebookFailure(
          'User does not exist. Please create an account.',
        );
      case 'wrong-password':
        return const LogInWithFacebookFailure(
          'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return const LogInWithFacebookFailure(
          'The SMS verification code used is invalid. Please resend the verification code SMS and be sure to use the verification code provided by the user.',
        );
      case 'invalid-verification-id':
        return const LogInWithFacebookFailure(
          'The verification ID used is invalid. Please try again with a valid verification ID.',
        );
      default:
        return const LogInWithFacebookFailure();
    }
  }
}
