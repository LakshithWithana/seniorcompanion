class ChatFailure implements Exception {
  /// The associated error message.
  final String message;

  const ChatFailure([
    this.message = 'Selected chat room creation failed!',
  ]);
}
