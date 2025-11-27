import 'package:flutterstarter/models/auth/auth.dart';
import 'package:flutterstarter/models/auth/user.dart';
import 'package:flutterstarter/services/auth_service.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore extends _AuthStore with _$AuthStore {
  AuthStore({required super.user});

  factory AuthStore.fromModel(Auth? model) {
    return AuthStore(user: model?.user);
  }

  factory AuthStore.makeDefault() {
    return AuthStore.fromModel(AuthService.getDefault());
  }
}

abstract class _AuthStore with Store {
  _AuthStore({required this.user});

  @observable
  User? user;

  @computed
  bool get isLogin => true;

  Future<Auth?> init() async {
    final data = await AuthService.loadData();
    user = data?.user;
    return data;
  }
}
