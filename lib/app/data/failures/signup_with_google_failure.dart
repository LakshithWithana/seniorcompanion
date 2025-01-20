class SignUpWithGoogleFailure implements Exception {
  final String message;

  SignUpWithGoogleFailure(this.message);

  @override
  String toString() => message;
}
