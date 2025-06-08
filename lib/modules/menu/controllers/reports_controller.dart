import 'package:cashflow/shared/util/enums.dart';
import 'package:mobx/mobx.dart';
part 'reports_controller.g.dart';

class ReportsController = _ReportsControllerBase with _$ReportsController;

abstract class _ReportsControllerBase with Store {
  @observable
  TransactionReportType transactionReportType = TransactionReportType.all;

  @action
  void setTransactionReportType(TransactionReportType type) {
    transactionReportType = type;
  }
}
