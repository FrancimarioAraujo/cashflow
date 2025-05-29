import 'dart:convert';
import 'package:cashflow/modules/auth/auth_repository.dart';
import 'package:cashflow/modules/auth/models/user_model.dart';
import 'package:cashflow/shared/exceptions/custom_exception.dart';
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
  Future<void> login(String email, String password) async {
    try {
      loading = true;
      var result = json.decode(await authRepository.login(email, password));
      UserModel user = await getUserByEmail(
        email: email,
        token: result["token"],
      );
      setUser(value: user);
      loading = false;
    } catch (e) {
      loading = false;
      rethrow;
    }
  }

  @action
  Future<void> logout() async {
    loading = true;
    setUser(value: UserModel.cleanData());
    loading = false;
  }

  @action
  Future<UserModel> getUserByEmail({
    required String email,
    required String token,
  }) async {
    dynamic result = await authRepository.getUserByEmail(email);
    UserModel user = UserModel.setData(
      json.decode(result)["value"],
      tokenValue: token,
    );
    return user;
  }

  @action
  void setUser({required UserModel value}) {
    user = value;
  }

  @action
  Future<String> deleteUser() async {
    try {
      loading = true;
      String result = await authRepository.deleteUser(user);
      loading = false;
      return result;
    } catch (e) {
      loading = false;
      rethrow;
    }
  }
}
