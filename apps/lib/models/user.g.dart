// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<User> _$userSerializer = new _$UserSerializer();

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable<Object?> serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.fcmToken;
    if (value != null) {
      result
        ..add('fcmToken')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.username;
    if (value != null) {
      result
        ..add('username')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateOfBirth;
    if (value != null) {
      result
        ..add('dateOfBirth')
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
    value = object.referralUser;
    if (value != null) {
      result
        ..add('referralUser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(UserSub)));
    }
    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserBuilder();

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
        case 'fcmToken':
          result.fcmToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dateOfBirth':
          result.dateOfBirth = serializers.deserialize(value,
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
        case 'referralUser':
          result.referralUser.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserSub))! as UserSub);
          break;
      }
    }

    return result.build();
  }
}

class _$User extends User {
  @override
  final String id;
  @override
  final String? fcmToken;
  @override
  final String? username;
  @override
  final String? dateOfBirth;
  @override
  final String? pictureUrl;
  @override
  final String? thumbnailPictureUrl;
  @override
  final UserSub? referralUser;

  factory _$User([void Function(UserBuilder)? updates]) =>
      (new UserBuilder()..update(updates))._build();

  _$User._(
      {required this.id,
      this.fcmToken,
      this.username,
      this.dateOfBirth,
      this.pictureUrl,
      this.thumbnailPictureUrl,
      this.referralUser})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'User', 'id');
  }

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        id == other.id &&
        fcmToken == other.fcmToken &&
        username == other.username &&
        dateOfBirth == other.dateOfBirth &&
        pictureUrl == other.pictureUrl &&
        thumbnailPictureUrl == other.thumbnailPictureUrl &&
        referralUser == other.referralUser;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, fcmToken.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, dateOfBirth.hashCode);
    _$hash = $jc(_$hash, pictureUrl.hashCode);
    _$hash = $jc(_$hash, thumbnailPictureUrl.hashCode);
    _$hash = $jc(_$hash, referralUser.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'User')
          ..add('id', id)
          ..add('fcmToken', fcmToken)
          ..add('username', username)
          ..add('dateOfBirth', dateOfBirth)
          ..add('pictureUrl', pictureUrl)
          ..add('thumbnailPictureUrl', thumbnailPictureUrl)
          ..add('referralUser', referralUser))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _fcmToken;
  String? get fcmToken => _$this._fcmToken;
  set fcmToken(String? fcmToken) => _$this._fcmToken = fcmToken;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _dateOfBirth;
  String? get dateOfBirth => _$this._dateOfBirth;
  set dateOfBirth(String? dateOfBirth) => _$this._dateOfBirth = dateOfBirth;

  String? _pictureUrl;
  String? get pictureUrl => _$this._pictureUrl;
  set pictureUrl(String? pictureUrl) => _$this._pictureUrl = pictureUrl;

  String? _thumbnailPictureUrl;
  String? get thumbnailPictureUrl => _$this._thumbnailPictureUrl;
  set thumbnailPictureUrl(String? thumbnailPictureUrl) =>
      _$this._thumbnailPictureUrl = thumbnailPictureUrl;

  UserSubBuilder? _referralUser;
  UserSubBuilder get referralUser =>
      _$this._referralUser ??= new UserSubBuilder();
  set referralUser(UserSubBuilder? referralUser) =>
      _$this._referralUser = referralUser;

  UserBuilder();

  UserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _fcmToken = $v.fcmToken;
      _username = $v.username;
      _dateOfBirth = $v.dateOfBirth;
      _pictureUrl = $v.pictureUrl;
      _thumbnailPictureUrl = $v.thumbnailPictureUrl;
      _referralUser = $v.referralUser?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  User build() => _build();

  _$User _build() {
    _$User _$result;
    try {
      _$result = _$v ??
          new _$User._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'User', 'id'),
              fcmToken: fcmToken,
              username: username,
              dateOfBirth: dateOfBirth,
              pictureUrl: pictureUrl,
              thumbnailPictureUrl: thumbnailPictureUrl,
              referralUser: _referralUser?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'referralUser';
        _referralUser?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'User', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
