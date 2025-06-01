import 'package:cashflow/modules/auth/auth_controller.dart';
import 'package:cashflow/modules/transactions/repositories/income_repository.dart';
import 'package:mobx/mobx.dart';
part 'transaction_controller.g.dart';

class TransactionController = _TransactionControllerBase
    with _$TransactionController;

abstract class _TransactionControllerBase with Store {
  final TransactionRepository incomeRepository;
  final AuthController authController;
  _TransactionControllerBase({
    required this.incomeRepository,
    required this.authController,
  });
  @observable
  TransactionType transactionTypeSelected = TransactionType.income;

  @observable
  String? selectedCategory;

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

  List<String> getCategories() {
    return transactionTypeSelected == TransactionType.income
        ? categoriesIncome
        : categoriesExpense;
  }

  @action
  Future<void> addTransaction({
    required double value,
    required String description,
    required String category,
  }) async {
    try {
      await incomeRepository.addTransaction(
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
}

enum TransactionType { income, expense }
