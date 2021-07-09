class ExceptionUser implements Exception {
  final String message;

  ExceptionUser(this.message);

  @override
  String toString() => 'ExceptionUser(message: $message)';
}

class ExceptionTokenJwt implements Exception {
  final String message;

  ExceptionTokenJwt(this.message);

  @override
  String toString() => 'ExceptionTokenJwt(message: $message)';
}
