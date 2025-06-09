// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReportsController on _ReportsControllerBase, Store {
  late final _$startDateAtom =
      Atom(name: '_ReportsControllerBase.startDate', context: context);

  @override
  DateTime get startDate {
    _$startDateAtom.reportRead();
    return super.startDate;
  }

  bool _startDateIsInitialized = false;

  @override
  set startDate(DateTime value) {
    _$startDateAtom.reportWrite(
        value, _startDateIsInitialized ? super.startDate : null, () {
      super.startDate = value;
      _startDateIsInitialized = true;
    });
  }

  late final _$endDateAtom =
      Atom(name: '_ReportsControllerBase.endDate', context: context);

  @override
  DateTime get endDate {
    _$endDateAtom.reportRead();
    return super.endDate;
  }

  bool _endDateIsInitialized = false;

  @override
  set endDate(DateTime value) {
    _$endDateAtom
        .reportWrite(value, _endDateIsInitialized ? super.endDate : null, () {
      super.endDate = value;
      _endDateIsInitialized = true;
    });
  }

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
  void setStartDate(DateTime date) {
    final _$actionInfo = _$_ReportsControllerBaseActionController.startAction(
        name: '_ReportsControllerBase.setStartDate');
    try {
      return super.setStartDate(date);
    } finally {
      _$_ReportsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEndDate(DateTime date) {
    final _$actionInfo = _$_ReportsControllerBaseActionController.startAction(
        name: '_ReportsControllerBase.setEndDate');
    try {
      return super.setEndDate(date);
    } finally {
      _$_ReportsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
startDate: ${startDate},
endDate: ${endDate},
transactionReportTypeSelected: ${transactionReportTypeSelected}
    ''';
  }
}
