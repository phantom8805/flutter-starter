import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutterstarter/utils/shared_preferences_facade.dart';
import 'package:http/http.dart' as http;

class Http {
  static const host = kReleaseMode ? 'test.com' : 'test.com';
  static const _scheme = 'https';
  static const _prefix = '/app-api/';

  String token = '';
  final client = http.Client();

  load() async {
    token = (await SharedPreferencesFacade().get(SharedPreferenceKey.token)) ?? '';
  }

  setToken(String val) async {
    await SharedPreferencesFacade().set(SharedPreferenceKey.token, val);
    token = val;
  }

  Future<dynamic> get(String path, [String? query]) async {
    final response = await client.get(
      _getUri(path, query),
      headers: <String, String>{'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );

    return await _handleResponse(response);
  }

  Future<dynamic> post({required String path, Object? body, String? query}) async {
    final Map<String, String> headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};

    if (body is String) {
      headers['Content-Type'] = 'application/json';
    }

    final response = await client.post(_getUri(path, query), headers: headers, body: body);

    return await _handleResponse(response);
  }

  Future<dynamic> postWithoutToken({required String path, Object? body, String? query}) async {
    final response =
        await client.post(_getUri(path, query), headers: <String, String>{'Accept': 'application/json'}, body: body);

    return jsonDecode(response.body);
  }

  Uri _getUri(String path, [String? query]) {
    return Uri(host: host, path: _prefix + path, query: query, scheme: _scheme);
  }

  Future<dynamic> _handleResponse(http.Response response) async {
    try {
      if (response.body.isEmpty) {
        return null;
      }
      dynamic json = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return json;
      } else if (response.statusCode == 401) {
        await SharedPreferencesFacade().cleanAll();
        return {
          'message': 'These credentials do not match our records',
          'errors': {
            'unknown': ['These credentials do not match our records']
          }
        };
      } else {
        return {
          'message': 'Server error',
          'errors': {
            'unknown': ['Server error']
          }
        };
      }
    } catch (error) {
      return {
        'message': 'Server error',
        'errors': {
          'unknown': ['Server error']
        }
      };
    }
  }
}
