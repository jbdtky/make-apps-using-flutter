import 'dart:async';

import 'package:flutter/material.dart';
import 'package:thenobody/models/deeplink.dart';
import 'package:thenobody/models/user.dart';

@immutable
class VerifyUserStateAction {}

@immutable
class OnUpdatedInitialDeeplink {
  final Deeplink? deeplink;
  final Completer completer;

  OnUpdatedInitialDeeplink(this.deeplink, {Completer? completer})
      : completer = completer ?? Completer();
}

@immutable
class OnUpdatedUserAction {
  final User user;

  const OnUpdatedUserAction(
    this.user,
  );
}
