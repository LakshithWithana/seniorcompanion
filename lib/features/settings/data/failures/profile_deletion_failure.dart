class ProfileDeletionFailure implements Exception {
  /// The associated error message.
  final String message;

  const ProfileDeletionFailure([
    this.message = 'Profile Deletion Failed',
  ]);
}
