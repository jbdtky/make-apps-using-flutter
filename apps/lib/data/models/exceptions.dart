import 'package:thenobody/data/models/request_error.dart';

class APIException implements Exception {
  final RequestError error;

  const APIException(this.error);
}
