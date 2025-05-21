import 'package:flutter_modular/flutter_modular.dart';
import 'package:cashflow/modules/auth/forgot_password/forgot_password_page.dart';
import 'package:cashflow/modules/auth/signup/signup_page.dart';
import 'login/login_page.dart';

class AuthModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => LoginPage());
    r.child('/signup', child: (context) => SignUpPage());
    r.child('/forgot', child: (context) => ForgotPasswordPage());
  }
}
