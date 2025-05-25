// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on _AuthControllerBase, Store {
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

  late final _$makeLoginAsyncAction =
      AsyncAction('_AuthControllerBase.makeLogin', context: context);

  @override
  Future<void> makeLogin(String email, String password) {
    return _$makeLoginAsyncAction.run(() => super.makeLogin(email, password));
  }

  @override
  String toString() {
    return '''
user: ${user},
loading: ${loading}
    ''';
  }
}
