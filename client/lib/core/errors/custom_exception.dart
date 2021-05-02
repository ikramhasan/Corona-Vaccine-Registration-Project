class CustomException implements Exception {
  final String message;

  CustomException(this.message);

  @override
  String toString() => 'CustomException(message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomException && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
