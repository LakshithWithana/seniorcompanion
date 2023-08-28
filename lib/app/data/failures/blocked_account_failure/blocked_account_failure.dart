class BlockedAccountFailure implements Exception {
  /// The associated error message.
  final String message;

  const BlockedAccountFailure([
    this.message = 'Data loading failed',
  ]);
}
