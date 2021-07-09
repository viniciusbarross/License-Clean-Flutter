class ExceptionCliente implements Exception {
  final String message;

  ExceptionCliente(this.message);

  @override
  String toString() => 'ExceptionCliente(message: $message)';
}
