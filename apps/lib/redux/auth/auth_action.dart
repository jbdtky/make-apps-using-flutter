import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as faSdk;

@immutable
class LoginWithPhoneAction {
  final String phoneNumber;
  final Completer completer;

  LoginWithPhoneAction(this.phoneNumber, {Completer? completer})
      : completer = completer ?? Completer();
}

@immutable
class OnCodeSentAction {
  final String phoneNumber;
  final String verificationId;

  const OnCodeSentAction(this.phoneNumber, this.verificationId);
}

@immutable
class LoginWithEmailAction {
  final String email;
  final Completer completer;

  LoginWithEmailAction(this.email, {Completer? completer})
      : completer = completer ?? Completer();
}

class VerifyEmailAction {
  final String code;
  final Completer completer;

  VerifyEmailAction(this.code, {Completer? completer})
      : completer = completer ?? Completer();
}

@immutable
class VerifyPhoneAction {
  final String code;
  final Completer completer;

  VerifyPhoneAction(this.code, {Completer? completer})
      : completer = completer ?? Completer();
}

@immutable
class LoginWithCredentialAction {
  final faSdk.AuthCredential credential;
  final Completer completer;

  LoginWithCredentialAction(this.credential, {Completer? completer})
      : completer = completer ?? Completer();
}

@immutable
class CreateCustomTokenAction {
  final Completer completer;

  CreateCustomTokenAction({Completer? completer})
      : completer = completer ?? Completer();
}
