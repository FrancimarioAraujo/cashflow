// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TransactionController on _TransactionControllerBase, Store {
  Computed<double>? _$totalIncomeComputed;

  @override
  double get totalIncome =>
      (_$totalIncomeComputed ??= Computed<double>(() => super.totalIncome,
              name: '_TransactionControllerBase.totalIncome'))
          .value;
  Computed<double>? _$totalExpenseComputed;

  @override
  double get totalExpense =>
      (_$totalExpenseComputed ??= Computed<double>(() => super.totalExpense,
              name: '_TransactionControllerBase.totalExpense'))
          .value;
  Computed<double>? _$totalBalanceComputed;

  @override
  double get totalBalance =>
      (_$totalBalanceComputed ??= Computed<double>(() => super.totalBalance,
              name: '_TransactionControllerBase.totalBalance'))
          .value;
  Computed<Map<String, dynamic>>? _$expensesByCategoryComputed;

  @override
  Map<String, dynamic> get expensesByCategory =>
      (_$expensesByCategoryComputed ??= Computed<Map<String, dynamic>>(
              () => super.expensesByCategory,
              name: '_TransactionControllerBase.expensesByCategory'))
          .value;
  Computed<Map<String, dynamic>>? _$incomesByCategoryComputed;

  @override
  Map<String, dynamic> get incomesByCategory => (_$incomesByCategoryComputed ??=
          Computed<Map<String, dynamic>>(() => super.incomesByCategory,
              name: '_TransactionControllerBase.incomesByCategory'))
      .value;
  Computed<Map<String, dynamic>>? _$incomesVsExpensesByCategoryComputed;

  @override
  Map<String, dynamic> get incomesVsExpensesByCategory =>
      (_$incomesVsExpensesByCategoryComputed ??= Computed<Map<String, dynamic>>(
              () => super.incomesVsExpensesByCategory,
              name: '_TransactionControllerBase.incomesVsExpensesByCategory'))
          .value;

  late final _$transactionTypeSelectedAtom = Atom(
      name: '_TransactionControllerBase.transactionTypeSelected',
      context: context);

  @override
  TransactionType get transactionTypeSelected {
    _$transactionTypeSelectedAtom.reportRead();
    return super.transactionTypeSelected;
  }

  @override
  set transactionTypeSelected(TransactionType value) {
    _$transactionTypeSelectedAtom
        .reportWrite(value, super.transactionTypeSelected, () {
      super.transactionTypeSelected = value;
    });
  }

  late final _$selectedCategoryAtom = Atom(
      name: '_TransactionControllerBase.selectedCategory', context: context);

  @override
  String? get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(String? value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_TransactionControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$incomesAtom =
      Atom(name: '_TransactionControllerBase.incomes', context: context);

  @override
  ObservableList<TransactionModel> get incomes {
    _$incomesAtom.reportRead();
    return super.incomes;
  }

  @override
  set incomes(ObservableList<TransactionModel> value) {
    _$incomesAtom.reportWrite(value, super.incomes, () {
      super.incomes = value;
    });
  }

  late final _$expensesAtom =
      Atom(name: '_TransactionControllerBase.expenses', context: context);

  @override
  ObservableList<TransactionModel> get expenses {
    _$expensesAtom.reportRead();
    return super.expenses;
  }

  @override
  set expenses(ObservableList<TransactionModel> value) {
    _$expensesAtom.reportWrite(value, super.expenses, () {
      super.expenses = value;
    });
  }

  late final _$transactionsAtom =
      Atom(name: '_TransactionControllerBase.transactions', context: context);

  @override
  ObservableList<TransactionModel> get transactions {
    _$transactionsAtom.reportRead();
    return super.transactions;
  }

  @override
  set transactions(ObservableList<TransactionModel> value) {
    _$transactionsAtom.reportWrite(value, super.transactions, () {
      super.transactions = value;
    });
  }

  late final _$categoriesIncomeAtom = Atom(
      name: '_TransactionControllerBase.categoriesIncome', context: context);

  @override
  List<String> get categoriesIncome {
    _$categoriesIncomeAtom.reportRead();
    return super.categoriesIncome;
  }

  @override
  set categoriesIncome(List<String> value) {
    _$categoriesIncomeAtom.reportWrite(value, super.categoriesIncome, () {
      super.categoriesIncome = value;
    });
  }

  late final _$categoriesExpenseAtom = Atom(
      name: '_TransactionControllerBase.categoriesExpense', context: context);

  @override
  List<String> get categoriesExpense {
    _$categoriesExpenseAtom.reportRead();
    return super.categoriesExpense;
  }

  @override
  set categoriesExpense(List<String> value) {
    _$categoriesExpenseAtom.reportWrite(value, super.categoriesExpense, () {
      super.categoriesExpense = value;
    });
  }

  late final _$fetchTransactionsAsyncAction = AsyncAction(
      '_TransactionControllerBase.fetchTransactions',
      context: context);

  @override
  Future<void> fetchTransactions() {
    return _$fetchTransactionsAsyncAction.run(() => super.fetchTransactions());
  }

  late final _$fetchIncomesAsyncAction =
      AsyncAction('_TransactionControllerBase.fetchIncomes', context: context);

  @override
  Future<void> fetchIncomes() {
    return _$fetchIncomesAsyncAction.run(() => super.fetchIncomes());
  }

  late final _$fetchExpensesAsyncAction =
      AsyncAction('_TransactionControllerBase.fetchExpenses', context: context);

  @override
  Future<void> fetchExpenses() {
    return _$fetchExpensesAsyncAction.run(() => super.fetchExpenses());
  }

  late final _$addTransactionAsyncAction = AsyncAction(
      '_TransactionControllerBase.addTransaction',
      context: context);

  @override
  Future<void> addTransaction(
      {required double value,
      required String description,
      required String category}) {
    return _$addTransactionAsyncAction.run(() => super.addTransaction(
        value: value, description: description, category: category));
  }

  late final _$updateTransactionAsyncAction = AsyncAction(
      '_TransactionControllerBase.updateTransaction',
      context: context);

  @override
  Future<void> updateTransaction(
      {required double value,
      required String description,
      required String category,
      required TransactionModel transaction,
      required String transactionType}) {
    return _$updateTransactionAsyncAction.run(() => super.updateTransaction(
        value: value,
        description: description,
        category: category,
        transaction: transaction,
        transactionType: transactionType));
  }

  late final _$deleteTransactionAsyncAction = AsyncAction(
      '_TransactionControllerBase.deleteTransaction',
      context: context);

  @override
  Future<void> deleteTransaction({required TransactionModel transaction}) {
    return _$deleteTransactionAsyncAction
        .run(() => super.deleteTransaction(transaction: transaction));
  }

  late final _$_TransactionControllerBaseActionController =
      ActionController(name: '_TransactionControllerBase', context: context);

  @override
  void selectTransactionType(TransactionType type) {
    final _$actionInfo = _$_TransactionControllerBaseActionController
        .startAction(name: '_TransactionControllerBase.selectTransactionType');
    try {
      return super.selectTransactionType(type);
    } finally {
      _$_TransactionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectCategory(String? category) {
    final _$actionInfo = _$_TransactionControllerBaseActionController
        .startAction(name: '_TransactionControllerBase.selectCategory');
    try {
      return super.selectCategory(category);
    } finally {
      _$_TransactionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
transactionTypeSelected: ${transactionTypeSelected},
selectedCategory: ${selectedCategory},
isLoading: ${isLoading},
incomes: ${incomes},
expenses: ${expenses},
transactions: ${transactions},
categoriesIncome: ${categoriesIncome},
categoriesExpense: ${categoriesExpense},
totalIncome: ${totalIncome},
totalExpense: ${totalExpense},
totalBalance: ${totalBalance},
expensesByCategory: ${expensesByCategory},
incomesByCategory: ${incomesByCategory},
incomesVsExpensesByCategory: ${incomesVsExpensesByCategory}
    ''';
  }
}
