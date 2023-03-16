enum ApiClientExceptionType {
  auth,
  network,
  other,
}

class ApiClientException implements Exception {
  ApiClientException(this.type);

  final ApiClientExceptionType type;
}
