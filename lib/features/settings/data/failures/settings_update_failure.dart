class SettingsUpdateFailure implements Exception {
  /// The associated error message.
  final String message;

  const SettingsUpdateFailure([
    this.message = 'Settings Update Failure. An unknown exception occurred.',
  ]);
}
