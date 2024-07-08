import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'request_error.g.dart';

abstract class RequestError
    implements Built<RequestError, RequestErrorBuilder> {
  static Serializer<RequestError> get serializer => _$requestErrorSerializer;

  int? get code;

  String get message;

  RequestError._();
  factory RequestError([void Function(RequestErrorBuilder) updates]) =
      _$RequestError;
}
