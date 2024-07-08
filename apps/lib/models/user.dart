import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:thenobody/models/user_sub.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  static Serializer<User> get serializer => _$userSerializer;

  String get id;

  String? get fcmToken;

  String? get username;

  String? get dateOfBirth;

  String? get pictureUrl;

  String? get thumbnailPictureUrl;

  String? get optimizedPictureUrl => thumbnailPictureUrl ?? pictureUrl;

  UserSub? get referralUser;

  User._();
  factory User([void Function(UserBuilder) updates]) = _$User;
}
