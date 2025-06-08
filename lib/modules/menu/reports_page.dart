import 'package:cashflow/modules/menu/components/reports/pie_chart_component.dart';
import 'package:cashflow/modules/transactions/controllers/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class ReportsPage extends StatefulWidget {
  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  TransactionController transactionController =
      Modular.get<TransactionController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Relatórios',
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: 'Mensal',
              dropdownColor: Colors.grey[900],
              style: TextStyle(color: Colors.white),
              items:
                  ['Mensal', 'Semanal']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
              onChanged: (_) {},
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
                  ['Visão Geral', 'Despesa', 'Receita']
                      .map(
                        (e) => ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[800],
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                          child: Text(e),
                        ),
                      )
                      .toList(),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Text(
                      'Balanço Mensal',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text('Abril 2025', style: TextStyle(color: Colors.white70)),
                    const SizedBox(height: 10),
                    Expanded(child: PieChartComponent()),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildAmount(
                          "Receitas",
                          NumberFormat.currency(
                            locale: 'pt_BR',
                            symbol: 'R\$',
                          ).format(transactionController.totalIncome),
                          Colors.green,
                        ),
                        _buildAmount(
                          "Despesas",
                          NumberFormat.currency(
                            locale: 'pt_BR',
                            symbol: 'R\$',
                          ).format(transactionController.totalExpense),
                          Colors.red,
                        ),
                        _buildAmount(
                          "Saldo",
                          NumberFormat.currency(
                            locale: 'pt_BR',
                            symbol: 'R\$',
                          ).format(transactionController.totalBalance),
                          Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmount(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
        Text(value, style: TextStyle(color: color, fontSize: 16)),
      ],
    );
  }
}
