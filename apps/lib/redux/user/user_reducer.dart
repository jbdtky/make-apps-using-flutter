import 'package:redux/redux.dart';
import 'package:thenobody/redux/user/user_action.dart';
import 'package:thenobody/states/app_state.dart';

final userReducer = <AppState Function(AppState, dynamic)>[
  TypedReducer<AppState, OnUpdatedUserAction>(_onUpdatedUser),
  TypedReducer<AppState, OnUpdatedInitialDeeplink>(_onUpdatedInitialDeeplink),
];

AppState _onUpdatedUser(AppState state, OnUpdatedUserAction action) {
  return state.rebuild((s) => s..user = action.user.toBuilder());
}

AppState _onUpdatedInitialDeeplink(
    AppState state, OnUpdatedInitialDeeplink action) {
  return state.rebuild((s) => s..initialDeeplink = action.deeplink);
}
