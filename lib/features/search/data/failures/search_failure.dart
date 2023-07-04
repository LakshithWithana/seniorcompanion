class SearchFailure implements Exception {
  /// The associated error message.
  final String message;

  const SearchFailure([
    this.message = 'User searching failed. An unknown exception occurred.',
  ]);
}
