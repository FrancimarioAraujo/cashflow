import 'dart:ui';

import 'package:cashflow/modules/transactions/controllers/transaction_controller.dart';
import 'package:cashflow/shared/util/enums.dart';
import 'package:mobx/mobx.dart';
part 'reports_controller.g.dart';

class ReportsController = _ReportsControllerBase with _$ReportsController;

abstract class _ReportsControllerBase with Store {
  TransactionController transactionController;
  _ReportsControllerBase({required this.transactionController});
  @observable
  late DateTime startDate;
  @observable
  late DateTime endDate;
  @observable
  TransactionReportType transactionReportTypeSelected =
      TransactionReportType.all;

  @action
  void setTransactionReportType(TransactionReportType type) {
    transactionReportTypeSelected = type;
  }

  bool isSelected(TransactionReportType type) {
    return transactionReportTypeSelected == type;
  }

  @action
  void setStartDate(DateTime date) {
    startDate = date;
  }

  @action
  void setEndDate(DateTime date) {
    endDate = date;
  }

  List getCategories() {
    if (transactionReportTypeSelected == TransactionReportType.income) {
      return transactionController.getIncomesByCategory(
        startDate,
        endDate,
      )["categories"];
    } else if (transactionReportTypeSelected == TransactionReportType.expense) {
      return transactionController.getExpensesByCategory(
        startDate,
        endDate,
      )["categories"];
    } else {
      return transactionController.incomesVsExpensesByCategory(
        startDate,
        endDate,
      )["categories"];
    }
  }

  List<Color> getColorsReport() {
    switch (transactionReportTypeSelected) {
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
        return [Color(0xFFC62828), Color(0xFFC62828)];
    }
  }
}
