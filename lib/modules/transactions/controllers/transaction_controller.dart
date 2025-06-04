import 'dart:convert';

import 'package:cashflow/modules/auth/auth_controller.dart';
import 'package:cashflow/modules/transactions/models/transaction_model.dart';
import 'package:cashflow/modules/transactions/repositories/transaction_repository.dart';
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

  bool isSelectedCategory(String? category) {
    return selectedCategory == category;
  }

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

  @computed
  double get totalIncome {
    return incomes.fold(0.0, (prev, element) => prev + element.valor);
  }

  @computed
  double get totalExpense {
    return expenses.fold(0.0, (prev, element) => prev + element.valor);
  }

  @computed
  double get totalBalance {
    return totalIncome - totalExpense;
  }

  List<String> getCategories() {
    return transactionTypeSelected == TransactionType.income
        ? categoriesIncome
        : categoriesExpense;
  }

  @action
  Future<void> fetchTransactions() async {
    isLoading = true;
    transactions = ObservableList<TransactionModel>();
    await fetchIncomes();
    await fetchExpenses();
    transactions = ObservableList<TransactionModel>.of([
      ...incomes,
      ...expenses,
    ]);
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
  Future<void> deleteTransaction({
    required TransactionModel transaction,
  }) async {
    try {
      if (transaction.transactionType == TransactionType.income.name) {
        await transactionRepository.deleteIncome(
          income: transaction,
          user: authController.user,
        );
      } else {
        await transactionRepository.deleteExpense(
          expense: transaction,
          user: authController.user,
        );
      }
      await fetchTransactions();
    } catch (e) {
      rethrow;
    }
  }
}

enum TransactionType { income, expense }
