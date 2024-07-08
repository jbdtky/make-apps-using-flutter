import 'package:thenobody/data/repositories/user_repository.dart';
import 'package:thenobody/redux/auth/auth_action.dart';
import 'package:firebase_auth/firebase_auth.dart' as faSdk;
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:thenobody/states/app_state.dart';

List<Middleware<AppState>> createAuthMiddleware(
    GlobalKey<NavigatorState> navigatorKey, UserRepository userRepository) {
  return [
    TypedMiddleware<AppState, LoginWithCredentialAction>(
      _loginWithCredential(navigatorKey),
    ),
  ];
}

void Function(
  Store<AppState> store,
  LoginWithCredentialAction action,
  NextDispatcher next,
) _loginWithCredential(
  GlobalKey<NavigatorState> navigatorKey,
) {
  return (store, action, next) async {
    next(action);

    try {
      await faSdk.FirebaseAuth.instance.signInWithCredential(action.credential);
      action.completer.complete();
    } catch (error) {
      action.completer.completeError(error);
    }
  };
}
