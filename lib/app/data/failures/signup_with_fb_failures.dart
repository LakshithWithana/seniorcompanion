class SignUpWithFacebookFailure implements Exception {
  final String message;

  SignUpWithFacebookFailure(this.message);

  @override
  String toString() => message;
}
