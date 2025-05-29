// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on _AuthControllerBase, Store {
  Computed<bool>? _$isLoggedInComputed;

  @override
  bool get isLoggedIn =>
      (_$isLoggedInComputed ??= Computed<bool>(() => super.isLoggedIn,
              name: '_AuthControllerBase.isLoggedIn'))
          .value;

  late final _$userAtom =
      Atom(name: '_AuthControllerBase.user', context: context);

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_AuthControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$createUserAsyncAction =
      AsyncAction('_AuthControllerBase.createUser', context: context);

  @override
  Future<void> createUser(
      {required String name,
      required String email,
      required String password,
      required String confirmPassword}) {
    return _$createUserAsyncAction.run(() => super.createUser(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword));
  }

  late final _$loginAsyncAction =
      AsyncAction('_AuthControllerBase.login', context: context);

  @override
  Future<void> login(String email, String password) {
    return _$loginAsyncAction.run(() => super.login(email, password));
  }

  late final _$logoutAsyncAction =
      AsyncAction('_AuthControllerBase.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$getUserByEmailAsyncAction =
      AsyncAction('_AuthControllerBase.getUserByEmail', context: context);

  @override
  Future<UserModel> getUserByEmail(
      {required String email, required String token}) {
    return _$getUserByEmailAsyncAction
        .run(() => super.getUserByEmail(email: email, token: token));
  }

  late final _$deleteUserAsyncAction =
      AsyncAction('_AuthControllerBase.deleteUser', context: context);

  @override
  Future<String> deleteUser() {
    return _$deleteUserAsyncAction.run(() => super.deleteUser());
  }

  late final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase', context: context);

  @override
  void setUser({required UserModel value}) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.setUser');
    try {
      return super.setUser(value: value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
loading: ${loading},
isLoggedIn: ${isLoggedIn}
    ''';
  }
}
