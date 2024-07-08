// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sub.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserSub> _$userSubSerializer = new _$UserSubSerializer();

class _$UserSubSerializer implements StructuredSerializer<UserSub> {
  @override
  final Iterable<Type> types = const [UserSub, _$UserSub];
  @override
  final String wireName = 'UserSub';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserSub object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.username;
    if (value != null) {
      result
        ..add('username')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pictureUrl;
    if (value != null) {
      result
        ..add('pictureUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.thumbnailPictureUrl;
    if (value != null) {
      result
        ..add('thumbnailPictureUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UserSub deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserSubBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pictureUrl':
          result.pictureUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'thumbnailPictureUrl':
          result.thumbnailPictureUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$UserSub extends UserSub {
  @override
  final String id;
  @override
  final String? username;
  @override
  final String? pictureUrl;
  @override
  final String? thumbnailPictureUrl;

  factory _$UserSub([void Function(UserSubBuilder)? updates]) =>
      (new UserSubBuilder()..update(updates))._build();

  _$UserSub._(
      {required this.id,
      this.username,
      this.pictureUrl,
      this.thumbnailPictureUrl})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'UserSub', 'id');
  }

  @override
  UserSub rebuild(void Function(UserSubBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserSubBuilder toBuilder() => new UserSubBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserSub &&
        id == other.id &&
        username == other.username &&
        pictureUrl == other.pictureUrl &&
        thumbnailPictureUrl == other.thumbnailPictureUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, pictureUrl.hashCode);
    _$hash = $jc(_$hash, thumbnailPictureUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserSub')
          ..add('id', id)
          ..add('username', username)
          ..add('pictureUrl', pictureUrl)
          ..add('thumbnailPictureUrl', thumbnailPictureUrl))
        .toString();
  }
}

class UserSubBuilder implements Builder<UserSub, UserSubBuilder> {
  _$UserSub? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _pictureUrl;
  String? get pictureUrl => _$this._pictureUrl;
  set pictureUrl(String? pictureUrl) => _$this._pictureUrl = pictureUrl;

  String? _thumbnailPictureUrl;
  String? get thumbnailPictureUrl => _$this._thumbnailPictureUrl;
  set thumbnailPictureUrl(String? thumbnailPictureUrl) =>
      _$this._thumbnailPictureUrl = thumbnailPictureUrl;

  UserSubBuilder();

  UserSubBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _username = $v.username;
      _pictureUrl = $v.pictureUrl;
      _thumbnailPictureUrl = $v.thumbnailPictureUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserSub other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserSub;
  }

  @override
  void update(void Function(UserSubBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserSub build() => _build();

  _$UserSub _build() {
    final _$result = _$v ??
        new _$UserSub._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'UserSub', 'id'),
            username: username,
            pictureUrl: pictureUrl,
            thumbnailPictureUrl: thumbnailPictureUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
