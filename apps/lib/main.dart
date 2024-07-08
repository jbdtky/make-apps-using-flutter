import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:thenobody/constants.dart';
import 'package:thenobody/data/repositories/user_repository.dart';
import 'package:thenobody/firebase_options.dart';
import 'package:thenobody/redux/auth/auth_middleware.dart';
import 'package:thenobody/redux/auth/auth_reducer.dart';
import 'package:thenobody/redux/user/user_action.dart';
import 'package:thenobody/redux/user/user_middleware.dart';
import 'package:thenobody/redux/user/user_reducer.dart';
import 'package:thenobody/routes.dart';
import 'package:thenobody/states/app_state.dart';
import 'package:thenobody/ui/pages/home_page.dart';
import 'package:thenobody/ui/pages/login_page.dart';
import 'package:thenobody/ui/pages/splash_page.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static final _navigatorKey = GlobalKey<NavigatorState>();
  static final _userRepository = UserRepository(apiUrl: kAPIUrl);

  final Store<AppState> _store =
      Store<AppState>(combineReducers(authReducer..addAll(userReducer)),
          initialState: AppState.init(),
          middleware: createAuthMiddleware(_navigatorKey, _userRepository)
            ..addAll(
              createUserMiddleware(_navigatorKey, _userRepository),
            ));

  @override
  void initState() {
    super.initState();

    // Notifies about changes to the user's sign-in state (such as sign-in or sign-out).
    firebase.FirebaseAuth.instance.authStateChanges().listen((user) {
      _store.dispatch(VerifyUserStateAction());
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: _store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TheNobody',
        // localizationsDelegates: L10n.localizationsDelegates,
        // supportedLocales: L10n.supportedLocales,
        themeMode: ThemeMode.light,
        theme: ThemeData(
          fontFamily: 'Fluro',
          scaffoldBackgroundColor: const Color(0xFF3B3B3B),
          colorScheme: const ColorScheme.dark(
            primary: Colors.white,
          ),
        ),
        navigatorKey: _navigatorKey,
        routes: {
          Routes.splash: (context) => const SplashPage(),
          Routes.login: (context) => const LoginPage(),
          Routes.home: (context) => const HomePage(),
        },
      ),
    );
  }
}
