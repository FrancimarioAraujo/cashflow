import 'package:mobx/mobx.dart';
part 'income_controller.g.dart';

class IncomeController = _IncomeControllerBase with _$IncomeController;

abstract class _IncomeControllerBase with Store {
  @observable
  TransactionType transactionTypeSelected = TransactionType.income;

  @action
  void selectTransactionType(TransactionType type) {
    transactionTypeSelected = type;
  }

  @observable
  List<String> categoriesIncome = [
    "salario",
    "investimento",
    "freelance",
    "outros",
  ];
  @observable
  List<String> categoriesExpense = [
    "supermercado",
    "educacao",
    "beleza",
    "saúde",
    "transporte",
    "outros",
  ];

  List<String> getCategories() {
    return transactionTypeSelected == TransactionType.income
        ? categoriesIncome
        : categoriesExpense;
  }
}

enum TransactionType { income, expense }
