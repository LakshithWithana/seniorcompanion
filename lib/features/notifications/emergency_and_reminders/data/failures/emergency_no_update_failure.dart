class EmergencyNoUpdateFailure implements Exception {
  /// The associated error message.
  final String message;

  const EmergencyNoUpdateFailure([
    this.message =
        'Emergency No update failure. An unknown exception occurred.',
  ]);
}
