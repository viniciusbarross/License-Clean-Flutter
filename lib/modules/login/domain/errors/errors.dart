class ExceptionUser implements Exception {
  final String message;

  ExceptionUser(this.message);

  @override
  String toString() => 'ExceptionUser(message: $message)';
}
