class ApiException implements Exception {
  final String errorMessage;
  ApiException({
    required this.errorMessage,
  });
}
