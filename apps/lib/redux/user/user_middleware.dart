import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:thenobody/data/repositories/user_repository.dart';
import 'package:thenobody/redux/user/user_action.dart';
import 'package:thenobody/routes.dart';
import 'package:thenobody/states/app_state.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

List<Middleware<AppState>> createUserMiddleware(
  GlobalKey<NavigatorState> navigatorKey,
  UserRepository userRepository,
) {
  return [
    TypedMiddleware<AppState, VerifyUserStateAction>(
      _verifyUserState(navigatorKey, userRepository),
    ),
  ];
}

void Function(
  Store<AppState> store,
  VerifyUserStateAction action,
  NextDispatcher next,
) _verifyUserState(
  GlobalKey<NavigatorState> navigatorKey,
  UserRepository userRepository,
) {
  return (store, action, next) async {
    next(action);

    // var initialLink = await getInitialLink();

    // Deeplink? deeplink;
    // if (initialLink != null) {
    //   try {
    //     final Uri link = Uri.parse(initialLink);
    //     deeplink = await DeeplinkHandler.parse(link);

    //     if (deeplink != null) {
    //       // Save the deeplink to be opened post authentification if necessary like restaurant
    //       store.dispatch(OnUpdatedInitialDeeplink(deeplink));
    //     }
    //   } catch (_) {}
    // }

    final fUser = firebase.FirebaseAuth.instance.currentUser;
    if (fUser != null) {
      try {
        final user = await userRepository.login();

        // Setup Mixpanel
        // kMixpanel.identify(user.id);
        // kMixpanel.getPeople().set("locale", locale);

        // Setup Crashlytics
        FirebaseCrashlytics.instance.setUserIdentifier(user.id);

        // Save user
        store.dispatch(OnUpdatedUserAction(user));

        navigatorKey.currentState
            ?.pushNamedAndRemoveUntil(Routes.home, (r) => false);
        return;
      } catch (err) {
        if (kDebugMode) print(err);
        // if (err is APIException) {
        //   if (err.error.code == 426) {
        //     navigatorKey.currentState?.pushAndRemoveUntil(
        //       MaterialPageRoute<void>(
        //         builder: (context) => UpgradeRequiredPage(),
        //       ),
        //       (r) => false,
        //     );
        //     return;
        //   }
        // }

        // navigatorKey.currentState?.pushAndRemoveUntil(
        //     MaterialPageRoute(
        //         builder: (context) => const ErrorBootPage(),
        //         settings: const RouteSettings(name: '/', arguments: null)),
        //     (r) => false);
        // return;
      }
    }

    navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(Routes.login, (r) => false);
  };
}
