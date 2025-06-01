import 'package:cashflow/modules/transactions/pages/add_page.dart';
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
        ChildRoute('/add', child: (context) => AddPage()),
        ChildRoute('/reports', child: (context) => ReportsPage()),
        ChildRoute('/profile', child: (context) => ProfilePage()),
      ],
    );
  }
}
