import 'package:thenobody/redux/auth/auth_action.dart';
import 'package:redux/redux.dart';

import '../../states/app_state.dart';

final authReducer = <AppState Function(AppState, dynamic)>[
  TypedReducer<AppState, LoginWithEmailAction>(_onLoginWithEmailAction),
];

AppState _onLoginWithEmailAction(AppState state, LoginWithEmailAction action) {
  return state.rebuild((s) => s..email = action.email);
}
