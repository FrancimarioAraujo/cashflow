// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TransactionController on _TransactionControllerBase, Store {
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
categoriesIncome: ${categoriesIncome},
categoriesExpense: ${categoriesExpense}
    ''';
  }
}
