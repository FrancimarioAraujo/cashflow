import 'package:cashflow/modules/auth/auth_controller.dart';
import 'package:cashflow/modules/auth/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cashflow/modules/home/home_module.dart';
import 'package:cashflow/modules/splash/splash_module.dart';
import 'modules/auth/auth_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(AuthRepository.new);
    i.addSingleton(AuthController.new);
  }

  @override
  void routes(r) {
    r.module('/', module: SplashModule());
    r.module('/auth', module: AuthModule());
    r.module('/home', module: HomeModule());
  }
}
