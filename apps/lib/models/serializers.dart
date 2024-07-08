import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:thenobody/data/models/request_error.dart';
import 'package:thenobody/models/user.dart';
import 'package:thenobody/models/user_sub.dart';

part 'serializers.g.dart';

@SerializersFor([
  RequestError,
  User,
  UserSub,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
