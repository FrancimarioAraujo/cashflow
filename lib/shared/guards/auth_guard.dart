import 'package:cashflow/modules/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/');

  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    return Modular.get<AuthController>().isLoggedIn;
  }
}
