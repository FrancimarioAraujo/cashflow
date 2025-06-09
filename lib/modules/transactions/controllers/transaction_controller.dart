import 'dart:convert';

import 'package:cashflow/modules/auth/auth_controller.dart';
import 'package:cashflow/modules/auth/models/user_model.dart';
import 'package:cashflow/modules/transactions/models/transaction_model.dart';
import 'package:cashflow/modules/transactions/repositories/transaction_repository.dart';
import 'package:cashflow/shared/util/enums.dart';
import 'package:mobx/mobx.dart';
part 'transaction_controller.g.dart';

class TransactionController = _TransactionControllerBase
    with _$TransactionController;

abstract class _TransactionControllerBase with Store {
  final TransactionRepository transactionRepository;
  final AuthController authController;
  _TransactionControllerBase({
    required this.transactionRepository,
    required this.authController,
  });
  @observable
  TransactionType transactionTypeSelected = TransactionType.income;

  @observable
  String? selectedCategory;

  @observable
  bool isLoading = false;
  @observable
  ObservableList<TransactionModel> incomes = ObservableList<TransactionModel>();

  @observable
  ObservableList<TransactionModel> expenses =
      ObservableList<TransactionModel>();

  @observable
  ObservableList<TransactionModel> transactions =
      ObservableList<TransactionModel>();

  @action
  void selectTransactionType(TransactionType type) {
    transactionTypeSelected = type;
    selectCategory(null);
  }

  @action
  void selectCategory(String? category) {
    selectedCategory = category;
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

  double totalIncome({DateTime? startDate, DateTime? endDate}) {
    if (startDate == null || endDate == null) {
      return incomes.fold(0.0, (prev, element) => prev + element.valor);
    } else {
      final start = DateTime(startDate.year, startDate.month, startDate.day);
      final end = DateTime(
        endDate.year,
        endDate.month,
        endDate.day,
        23,
        59,
        59,
        999,
      );

      List<TransactionModel> filtered =
          incomes.where((income) {
            return (income.date.isAtSameMomentAs(start) ||
                income.date.isAtSameMomentAs(end) ||
                (income.date.isAfter(start) && income.date.isBefore(end)));
          }).toList();

      return filtered.fold(0.0, (prev, element) => prev + element.valor);
    }
  }

  double totalExpense({DateTime? startDate, DateTime? endDate}) {
    if (startDate == null || endDate == null) {
      return expenses.fold(0.0, (prev, element) => prev + element.valor);
    } else {
      // Ajusta datas para o dia (começo e fim)
      final start = DateTime(startDate.year, startDate.month, startDate.day);
      final end = DateTime(
        endDate.year,
        endDate.month,
        endDate.day,
        23,
        59,
        59,
        999,
      );

      List<TransactionModel> filtered =
          expenses.where((expense) {
            return (expense.date.isAtSameMomentAs(start) ||
                expense.date.isAtSameMomentAs(end) ||
                (expense.date.isAfter(start) && expense.date.isBefore(end)));
          }).toList();

      return filtered.fold(0.0, (prev, element) => prev + element.valor);
    }
  }

  double totalBalance({DateTime? startDate, DateTime? endDate}) {
    return totalIncome(startDate: startDate, endDate: endDate) -
        totalExpense(startDate: startDate, endDate: endDate);
  }

  Map<String, dynamic> getExpensesByCategory(
    DateTime startDate,
    DateTime endDate,
  ) {
    return _calculateByCategory(expenses, 'category', startDate, endDate);
  }

  Map<String, dynamic> getIncomesByCategory(
    DateTime startDate,
    DateTime endDate,
  ) {
    return _calculateByCategory(incomes, 'category', startDate, endDate);
  }

  Map<String, dynamic> incomesVsExpensesByCategory(
    DateTime startDate,
    DateTime endDate,
  ) {
    var filteredIncomes =
        incomes.where((income) {
          return income.date.isAfter(startDate.subtract(Duration(days: 1))) &&
              income.date.isBefore(endDate.add(Duration(days: 1)));
        }).toList();

    var filteredExpenses =
        expenses.where((expense) {
          return expense.date.isAfter(startDate.subtract(Duration(days: 1))) &&
              expense.date.isBefore(endDate.add(Duration(days: 1)));
        }).toList();

    double totalIncome = filteredIncomes.fold(
      0.0,
      (prev, element) => prev + element.valor,
    );
    double totalExpense = filteredExpenses.fold(
      0.0,
      (prev, element) => prev + element.valor,
    );

    double total = totalIncome + totalExpense;

    Map<String, dynamic> result = {
      "categories": [
        {
          "name": "Receitas",
          "value": total == 0 ? 0.0 : (totalIncome / total) * 100,
        },
        {
          "name": "Despesas",
          "value": total == 0 ? 0.0 : (totalExpense / total) * 100,
        },
      ],
    };
    if (total == 0) {
      return {"categories": [
        
      ],
    };
    }

    return result;
  }

  Map<String, dynamic> _calculateByCategory(
    List<TransactionModel> transactions,
    String categoryKey,
    DateTime startDate,
    DateTime endDate,
  ) {
    // Filtra as transações entregues dentro do período
    var filteredTransactions =
        transactions.where((transaction) {
          return transaction.date.isAfter(
                startDate.subtract(Duration(days: 1)),
              ) &&
              transaction.date.isBefore(endDate.add(Duration(days: 1)));
        }).toList();

    Map<String, dynamic> categoryTotals = {"categories": []};

    double totalAmount = filteredTransactions.fold(
      0,
      (acc, transaction) => acc + transaction.valor,
    );

    for (var transaction in filteredTransactions) {
      if (categoryTotals["categories"].any(
        (element) => element["name"] == transaction.category,
      )) {
        var category = categoryTotals["categories"].firstWhere(
          (element) => element["name"] == transaction.category,
        );
        category["value"] =
            category["value"] + (transaction.valor / totalAmount) * 100;
      } else {
        categoryTotals["categories"].add({
          "name": transaction.category,
          "value": (transaction.valor / totalAmount) * 100,
        });
      }
    }
    return categoryTotals;
  }

  List<String> getCategories() {
    return transactionTypeSelected == TransactionType.income
        ? categoriesIncome
        : categoriesExpense;
  }

  bool isSelectedCategory(String? category) {
    return selectedCategory == category;
  }

  @action
  Future<void> fetchTransactions() async {
    isLoading = true;
    transactions = ObservableList<TransactionModel>();
    await fetchIncomes();
    await fetchExpenses();
    transactions.addAll(incomes);
    transactions.addAll(expenses);

    transactions.sort((a, b) => b.date.compareTo(a.date));
    isLoading = false;
  }

  @action
  Future<void> fetchIncomes() async {
    incomes.clear();
    dynamic result = await transactionRepository.getIncomes(
      user: authController.user,
    );
    List resultDecoded = json.decode(result);
    for (int i = 0; i < resultDecoded.length; i++) {
      TransactionModel transaction = TransactionModel.fromJson(
        key: resultDecoded[i]["key"],
        resultDecoded[i]["value"],
        transactionTypeParam: TransactionType.income,
      );
      incomes.add(transaction);
    }
  }

  @action
  Future<void> fetchExpenses() async {
    expenses.clear();
    dynamic result = await transactionRepository.getExpenses(
      user: authController.user,
    );
    List resultDecoded = json.decode(result);
    for (int i = 0; i < resultDecoded.length; i++) {
      TransactionModel transaction = TransactionModel.fromJson(
        key: resultDecoded[i]["key"],
        resultDecoded[i]["value"],
        transactionTypeParam: TransactionType.expense,
      );
      expenses.add(transaction);
    }
  }

  @action
  Future<void> addTransaction({
    required double value,
    required String description,
    required String category,
  }) async {
    try {
      await transactionRepository.addTransaction(
        value: value,
        description: description,
        category: category,
        user: authController.user,
        transactionType: transactionTypeSelected.name,
      );
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<void> updateTransaction({
    required double value,
    required String description,
    required String category,
    required TransactionModel transaction,
    required String transactionType,
  }) async {
    try {
      await transactionRepository.updateTransaction(
        value: value,
        description: description,
        category: category,
        transaction: transaction,
        user: authController.user,
        transactionType: transactionType,
      );
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<void> deleteTransaction({
    required TransactionModel transaction,
  }) async {
    try {
      await transactionRepository.deleteTransaction(
        transaction: transaction,
        user: authController.user,
        transactionType: transaction.transactionType,
      );
      await fetchTransactions();
    } catch (e) {
      rethrow;
    }
  }
}
