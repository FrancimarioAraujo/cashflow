class IncomeModel {
  final String userId;
  final double valor;
  final String category;
  final DateTime date;
  final String description;

  IncomeModel({
    required this.userId,
    required this.valor,
    required this.category,
    required this.date,
    required this.description,
  });

  factory IncomeModel.fromJson(Map<String, dynamic> json) {
    return IncomeModel(
      userId: json['userId'] as String,
      valor: (json['valor'] as num).toDouble(),
      category: json['category'] as String,
      date: DateTime.parse(json['date'] as String),
      description: json['description'] as String,
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