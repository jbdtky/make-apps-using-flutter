// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_error.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RequestError> _$requestErrorSerializer =
    new _$RequestErrorSerializer();

class _$RequestErrorSerializer implements StructuredSerializer<RequestError> {
  @override
  final Iterable<Type> types = const [RequestError, _$RequestError];
  @override
  final String wireName = 'RequestError';

  @override
  Iterable<Object?> serialize(Serializers serializers, RequestError object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  RequestError deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RequestErrorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$RequestError extends RequestError {
  @override
  final int? code;
  @override
  final String message;

  factory _$RequestError([void Function(RequestErrorBuilder)? updates]) =>
      (new RequestErrorBuilder()..update(updates))._build();

  _$RequestError._({this.code, required this.message}) : super._() {
    BuiltValueNullFieldError.checkNotNull(message, r'RequestError', 'message');
  }

  @override
  RequestError rebuild(void Function(RequestErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RequestErrorBuilder toBuilder() => new RequestErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RequestError &&
        code == other.code &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RequestError')
          ..add('code', code)
          ..add('message', message))
        .toString();
  }
}

class RequestErrorBuilder
    implements Builder<RequestError, RequestErrorBuilder> {
  _$RequestError? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  RequestErrorBuilder();

  RequestErrorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RequestError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RequestError;
  }

  @override
  void update(void Function(RequestErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RequestError build() => _build();

  _$RequestError _build() {
    final _$result = _$v ??
        new _$RequestError._(
            code: code,
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'RequestError', 'message'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
