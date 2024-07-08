import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:retry/retry.dart';
import 'package:thenobody/data/models/exceptions.dart';
import 'package:thenobody/data/models/request_error.dart';
import 'package:firebase_auth/firebase_auth.dart' as faSdk;

const r = RetryOptions(maxAttempts: 5);

Future<Response> retryRequest(Map<String, String> headers,
        Future<Response> Function(Map<String, String> headers) request) =>
    r.retry(
      () {
        return PackageInfo.fromPlatform().then((packageInfo) {
          return headers
            ..addAll({'thenobody-version': packageInfo.buildNumber});
        }).then(
          (headerWithToken) => request(headers..addAll(headerWithToken)).then(
            (response) {
              if (response.statusCode >= 400) {
                final message = jsonDecode(response.body)['message'];
                throw APIException(RequestError((b) => b
                  ..code = response.statusCode
                  ..message = message));
              }
              return response;
            },
          ),
        );
      },
      // Retry on SocketException or TimeoutException
      retryIf: (e) =>
          e is SocketException || e is TimeoutException || e is ClientException,
    );

Future<Response> retryAuthenticatedRequest(Map<String, String> headers,
        Future<Response> Function(Map<String, String> headers) request) =>
    r.retry(
      () {
        if (faSdk.FirebaseAuth.instance.currentUser == null) {
          throw Exception("Not authenticated");
        }

        return faSdk.FirebaseAuth.instance.currentUser!
            .getIdToken()
            .then((idToken) {
          if (idToken != null) {
            return {
              'firebase-auth-token': idToken,
            };
          }
          return <String, String>{};
        }).then((headerWithToken) {
          return PackageInfo.fromPlatform().then((packageInfo) {
            return headerWithToken
              ..addAll({'thenobody-version': packageInfo.buildNumber});
          });
        }).then(
          (headerWithToken) => request(headers..addAll(headerWithToken)).then(
            (response) {
              if (response.statusCode >= 400) {
                final message = jsonDecode(response.body)['message'];
                throw APIException(RequestError((b) => b
                  ..code = response.statusCode
                  ..message = message));
              }
              return response;
            },
          ),
        );
      },
      // Retry on SocketException or TimeoutException
      retryIf: (e) =>
          e is SocketException || e is TimeoutException || e is ClientException,
    );

Future<StreamedResponse> retryAuthenticatedMultiPartRequest(
        Map<String, String> headers,
        Future<StreamedResponse> Function(Map<String, String> headers)
            request) =>
    r.retry(
      () {
        if (faSdk.FirebaseAuth.instance.currentUser == null) {
          throw Exception("Not authenticated");
        }

        return faSdk.FirebaseAuth.instance.currentUser!
            .getIdToken()
            .then((idToken) {
          if (idToken != null) {
            return {
              'firebase-auth-token': idToken,
            };
          }
          return <String, String>{};
        }).then(
          (headerWithToken) => request(headers..addAll(headerWithToken)).then(
            (response) {
              if (response.statusCode >= 400) {
                throw APIException(RequestError((b) => b
                  ..code = response.statusCode
                  ..message = response.reasonPhrase));
              }
              return response;
            },
          ),
        );
      },
      // Retry on SocketException or TimeoutException
      retryIf: (e) =>
          e is SocketException || e is TimeoutException || e is ClientException,
    );

void handleErrorGracefully(RequestError requestError) {
  switch (requestError.code) {
    default:
      throw APIException(requestError);
  }
}
