import 'package:cashflow/shared/util/enums.dart';
import 'package:mobx/mobx.dart';
part 'reports_controller.g.dart';

class ReportsController = _ReportsControllerBase with _$ReportsController;

abstract class _ReportsControllerBase with Store {
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
}
