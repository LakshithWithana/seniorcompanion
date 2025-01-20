class SignUpWithAppleFailure implements Exception {
  final String message;

  SignUpWithAppleFailure(this.message);

  @override
  String toString() => message;
}
