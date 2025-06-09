import 'package:cashflow/modules/menu/components/reports/pie_chart_component.dart';
import 'package:cashflow/modules/menu/controllers/reports_controller.dart';
import 'package:cashflow/modules/transactions/controllers/transaction_controller.dart';
import 'package:cashflow/shared/theme/constants/app_colors.dart';
import 'package:cashflow/shared/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class ReportsPage extends StatefulWidget {
  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  TransactionController transactionController =
      Modular.get<TransactionController>();
  ReportsController reportsController = Modular.get<ReportsController>();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            title: Text(
              'Relatórios',
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        reportsController.setTransactionReportType(
                          TransactionReportType.all,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            reportsController.isSelected(
                                  TransactionReportType.all,
                                )
                                ? AppColors.darkBlue
                                : Colors.grey[800],
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      child: Text("Visão Geral"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        reportsController.setTransactionReportType(
                          TransactionReportType.expense,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            reportsController.isSelected(
                                  TransactionReportType.expense,
                                )
                                ? AppColors.red
                                : Colors.grey[800],
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      child: Text("Despesa"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        reportsController.setTransactionReportType(
                          TransactionReportType.income,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            reportsController.isSelected(
                                  TransactionReportType.income,
                                )
                                ? AppColors.emeraldGreen
                                : Colors.grey[800],
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      child: Text("Receita"),
                    ),
                  ],
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
                        const SizedBox(height: 10),
                        Expanded(
                          child: PieChartComponent(
                            colors: _getColorsReport(
                              reportsController.transactionReportTypeSelected,
                            ),
                            categories: _getCategories(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            if (reportsController
                                        .transactionReportTypeSelected ==
                                    TransactionReportType.all ||
                                reportsController
                                        .transactionReportTypeSelected ==
                                    TransactionReportType.income)
                              _buildAmount(
                                "Receitas",
                                transactionController.totalIncome,
                                Colors.green,
                              ),
                            if (reportsController
                                        .transactionReportTypeSelected ==
                                    TransactionReportType.all ||
                                reportsController
                                        .transactionReportTypeSelected ==
                                    TransactionReportType.expense)
                              _buildAmount(
                                "Despesas",
                                transactionController.totalExpense,
                                Colors.red,
                              ),
                            if (reportsController
                                    .transactionReportTypeSelected ==
                                TransactionReportType.all)
                              _buildAmount(
                                "Saldo",
                                transactionController.totalBalance,
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
      },
    );
  }

  Widget _buildAmount(String label, double value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
        Text(
          NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(value),
          style: TextStyle(color: color),
        ),
      ],
    );
  }

  List _getCategories() {
    if (reportsController.transactionReportTypeSelected ==
        TransactionReportType.income) {
      return transactionController.incomesByCategory["categories"];
    } else if (reportsController.transactionReportTypeSelected ==
        TransactionReportType.expense) {
      return transactionController.expensesByCategory["categories"];
    } else {
      return transactionController.incomesVsExpensesByCategory["categories"];
    }
  }

  List<Color> _getColorsReport(TransactionReportType typeReport) {
    switch (typeReport) {
      case TransactionReportType.income:
        return [
          Color(0xFF2C6E49),
          Color(0xFFFF8C00),
          Color(0xFF00008B),
          Color(0xFFD4AF37),
        ];
      case TransactionReportType.expense:
        return [
          Color(0xFFC62828),
          Color(0xFFEF6C00),
          Color(0xFF424242),
          Color(0xFF77216F),
          Color(0xFF795548),
          Color(0xFFFFC107),
        ];
      default:
        return [Color(0xFF2C6E49), Color(0xFFC62828)];
    }
  }
}
