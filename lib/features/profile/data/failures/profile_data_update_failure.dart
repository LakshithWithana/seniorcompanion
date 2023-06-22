class ProfileDataUpdateFailure implements Exception {
  /// The associated error message.
  final String message;

  const ProfileDataUpdateFailure([
    this.message =
        'Profile Data Update Failure. An unknown exception occurred.',
  ]);
}
