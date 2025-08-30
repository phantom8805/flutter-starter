// ignore_for_file: library_private_types_in_public_api

import 'package:flutterstarter/models/auth/user.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  User? user;

  @computed
  bool get isLogin => true;
}
