import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:thenobody/data/request.dart';
import 'package:thenobody/models/serializers.dart';
import 'package:thenobody/models/user.dart';

class UserRepository {
  static final _defaultHeaders = {'Content-Type': 'application/json'};
  final http.Client _client = http.Client();
  final String apiUrl;

  UserRepository({
    required this.apiUrl,
  });

  Future<User> login({String? shareId, String? locale}) async {
    final payload = jsonEncode({
      'shareId': shareId,
      'locale': locale,
    });

    final response = await retryAuthenticatedRequest(
        _defaultHeaders,
        (headers) => _client.post(Uri.parse('$apiUrl/auth/login'),
            headers: headers, body: payload));

    final decodedData = jsonDecode(response.body);
    return serializers.deserializeWith(User.serializer, decodedData["user"])!;
  }
}
