import 'package:cashflow/modules/transactions/components/modal_bottom_add_transaction_component.dart';
import 'package:cashflow/modules/home/dashboard_page.dart';
import 'package:cashflow/modules/home/profile_page.dart';
import 'package:cashflow/modules/home/reports_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cashflow/modules/home/home_page.dart';
import 'package:cashflow/shared/guards/auth_guard.dart';

class HomeModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => HomePage(),
      guards: [AuthGuard()],
      children: [
        ChildRoute('/dashboard', child: (context) => DashboardPage()),
        ChildRoute('/reports', child: (context) => ReportsPage()),
        ChildRoute('/profile', child: (context) => ProfilePage()),
      ],
    );
  }
}
