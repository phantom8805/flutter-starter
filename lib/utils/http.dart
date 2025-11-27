import 'dart:convert';

import 'package:flutterstarter/utils/shared_preferences_facade.dart';
import 'package:http/http.dart' as http;

class Http {
  String _host = '';
  String _prefix = '';
  String _scheme = '';

  Http({String host = 'example.com', String apiPrefix = '/', String scheme = ''}) {
    _host = host;
    _prefix = apiPrefix;
    _scheme = scheme;
  }

  String token = '';
  final client = http.Client();

  Future<void> load() async {
    token = (await SharedPreferencesFacade().get('token')) ?? '';
  }

  Future<void> setToken(String val) async {
    await SharedPreferencesFacade().set('token', val);
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
    final response = await client.post(
      _getUri(path, query),
      headers: <String, String>{'Accept': 'application/json'},
      body: body,
    );

    return jsonDecode(response.body);
  }

  Uri _getUri(String path, [String? query]) {
    return Uri(host: _host, path: _prefix + path, query: query, scheme: _scheme);
  }

  Future<dynamic> _handleResponse(http.Response response) async {
    try {
      if (response.body.isEmpty) {
        return null;
      }
      dynamic json = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return json;
      } else {
        return {
          'message': 'Server error',
          'errors': {
            'unknown': ['Server error'],
          },
        };
      }
    } catch (error) {
      return {
        'message': 'Server error',
        'errors': {
          'unknown': ['Server error'],
        },
      };
    }
  }
}
