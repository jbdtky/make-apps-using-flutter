import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_sub.g.dart';

abstract class UserSub implements Built<UserSub, UserSubBuilder> {
  static Serializer<UserSub> get serializer => _$userSubSerializer;

  String get id;

  String? get username;

  String? get pictureUrl;

  String? get thumbnailPictureUrl;

  String? get optimizedPictureUrl => thumbnailPictureUrl ?? pictureUrl;

  UserSub._();
  factory UserSub([void Function(UserSubBuilder) updates]) = _$UserSub;
}
