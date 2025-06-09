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

  void _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: reportsController.startDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      reportsController.setStartDate(picked);
    }
  }

  void _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: reportsController.endDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      reportsController.setEndDate(picked);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reportsController.setStartDate(DateTime.now().subtract(Duration(days: 30)));
    reportsController.setEndDate(DateTime.now());
  }

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => _selectStartDate(context),
                      icon: Icon(Icons.date_range, color: Colors.white),
                      label: Text(
                        DateFormat(
                          'dd/MM/yyyy',
                        ).format(reportsController.startDate),
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[850],
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => _selectEndDate(context),
                      icon: Icon(Icons.date_range, color: Colors.white),
                      label: Text(
                        DateFormat(
                          'dd/MM/yyyy',
                        ).format(reportsController.endDate),
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[850],
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Botões de filtro
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
                            colors: reportsController.getColorsReport(),
                            categories: reportsController.getCategories(),
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
                                transactionController.totalIncome(
                                  startDate: reportsController.startDate,
                                  endDate: reportsController.endDate,
                                ),
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
                                transactionController.totalExpense(
                                  startDate: reportsController.startDate,
                                  endDate: reportsController.endDate,
                                ),
                                Colors.red,
                              ),
                            if (reportsController
                                    .transactionReportTypeSelected ==
                                TransactionReportType.all)
                              _buildAmount(
                                "Saldo",
                                transactionController.totalBalance(
                                  startDate: reportsController.startDate,
                                  endDate: reportsController.endDate,
                                ),
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
}
