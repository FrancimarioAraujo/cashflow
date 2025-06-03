import 'package:cashflow/modules/transactions/controllers/transaction_controller.dart';

class TransactionModel {
  final String userId;
  final double valor;
  final String category;
  final DateTime date;
  final String description;
  final String transactionType;

  TransactionModel({
    required this.userId,
    required this.valor,
    required this.category,
    required this.date,
    required this.description,
    required this.transactionType,
  });

  factory TransactionModel.fromJson(
    Map<String, dynamic> json, {
    required TransactionType transactionTypeParam,
  }) {
    return TransactionModel(
      userId: json['userId'] as String,
      valor: (json['valor'] as num).toDouble(),
      category: json['category'] as String,
      date: DateTime.parse(json['date'] as String),
      description: json['description'] as String,
      transactionType: transactionTypeParam.name,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'valor': valor,
      'category': category,
      'date': date.toIso8601String(),
      'description': description,
    };
  }
}
