import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/'); // Redirect if not authorized

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    bool isAuthenticated = await checkUserAuthentication() || true;
    return isAuthenticated;
  }

  Future<bool> checkUserAuthentication() async {
    return true;
  }
}
