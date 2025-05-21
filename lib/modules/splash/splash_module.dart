import 'package:flutter_modular/flutter_modular.dart';
import 'package:cashflow/modules/splash/splash_page.dart';

class SplashModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => SplashPage());
  }
}
