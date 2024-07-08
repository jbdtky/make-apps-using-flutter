import 'package:built_value/built_value.dart';
import 'package:thenobody/models/deeplink.dart';
import 'package:thenobody/models/user.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  User? get user;

  Deeplink? get initialDeeplink;

  // Login
  String? get email;
  String? get phone;

  AppState._();
  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;
  factory AppState.init() => AppState();
}
