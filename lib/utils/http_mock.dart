import 'package:flutterstarter/utils/http.dart';

class HttpMock extends Http {
  @override
  Future post({required String path, Object? body, String? query}) {
    dynamic res = {};

    final testUser = {"id": 1, "name": "test", "email": "test@gmail.com"};

    if (path == 'get-token') {
      res = {"token": "test token", "user": testUser};
    }

    return Future.delayed(const Duration(milliseconds: 500), () => {"data": res});
  }

  @override
  Future<dynamic> get(String path, [String? query]) async {
    dynamic res = {};

    final testUser = {"id": 1, "name": "test", "email": "test@gmail.com"};

    if (path == 'users/current') {
      res = testUser;
      res = {};
    }

    return Future.delayed(const Duration(milliseconds: 500), () => {"data": res});
  }
}
