// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReportsController on _ReportsControllerBase, Store {
  late final _$transactionReportTypeSelectedAtom = Atom(
      name: '_ReportsControllerBase.transactionReportTypeSelected',
      context: context);

  @override
  TransactionReportType get transactionReportTypeSelected {
    _$transactionReportTypeSelectedAtom.reportRead();
    return super.transactionReportTypeSelected;
  }

  @override
  set transactionReportTypeSelected(TransactionReportType value) {
    _$transactionReportTypeSelectedAtom
        .reportWrite(value, super.transactionReportTypeSelected, () {
      super.transactionReportTypeSelected = value;
    });
  }

  late final _$_ReportsControllerBaseActionController =
      ActionController(name: '_ReportsControllerBase', context: context);

  @override
  void setTransactionReportType(TransactionReportType type) {
    final _$actionInfo = _$_ReportsControllerBaseActionController.startAction(
        name: '_ReportsControllerBase.setTransactionReportType');
    try {
      return super.setTransactionReportType(type);
    } finally {
      _$_ReportsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
transactionReportTypeSelected: ${transactionReportTypeSelected}
    ''';
  }
}
