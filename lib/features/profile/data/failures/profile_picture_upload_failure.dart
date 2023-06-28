class ProfilePictureUploadFailure implements Exception {
  /// The associated error message.
  final String message;

  const ProfilePictureUploadFailure([
    this.message =
        'Profile Picture Upload Failure. An unknown exception occurred.',
  ]);
}
