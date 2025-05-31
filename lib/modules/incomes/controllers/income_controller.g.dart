// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IncomeController on _IncomeControllerBase, Store {
  late final _$transactionTypeSelectedAtom = Atom(
      name: '_IncomeControllerBase.transactionTypeSelected', context: context);

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

  late final _$categoriesIncomeAtom =
      Atom(name: '_IncomeControllerBase.categoriesIncome', context: context);

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

  late final _$categoriesExpenseAtom =
      Atom(name: '_IncomeControllerBase.categoriesExpense', context: context);

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

  late final _$_IncomeControllerBaseActionController =
      ActionController(name: '_IncomeControllerBase', context: context);

  @override
  void selectTransactionType(TransactionType type) {
    final _$actionInfo = _$_IncomeControllerBaseActionController.startAction(
        name: '_IncomeControllerBase.selectTransactionType');
    try {
      return super.selectTransactionType(type);
    } finally {
      _$_IncomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
transactionTypeSelected: ${transactionTypeSelected},
categoriesIncome: ${categoriesIncome},
categoriesExpense: ${categoriesExpense}
    ''';
  }
}
