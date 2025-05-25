import 'dart:convert';
import 'package:cashflow/modules/auth/auth_repository.dart';
import 'package:cashflow/modules/auth/models/user_model.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final AuthRepository authRepository;

  _AuthControllerBase({required this.authRepository});
  @observable
  UserModel user = UserModel(name: '', email: '', password: '', token: '');

  @observable
  bool loading = false;

  @computed
  bool get isLoggedIn => user.token.isNotEmpty;

  @action
  Future<void> createUser({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      loading = true;
      await authRepository.createUser(
        email: email,
        name: name,
        password: password,
        confirmPassword: confirmPassword,
      );
      loading = false;
    } catch (e) {
      loading = false;
      rethrow;
    }
  }

  @action
  Future<void> makeLogin(String email, String password) async {
    try {
      loading = true;
      var result = json.decode(await authRepository.makeLogin(email, password));
      await setUser(
        email: email,
        token: result["token"],
        targetId: result["targetId"],
      );
      loading = false;
    } catch (e) {
      loading = false;
      rethrow;
    }
  }

  @action
  Future<void> setUser({
    required String email,
    required String token,
    required targetId,
  }) async {
    user.email = email;
    user.token = token;
  }
}
