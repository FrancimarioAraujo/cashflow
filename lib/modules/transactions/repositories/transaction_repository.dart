import 'dart:convert';
import 'package:cashflow/modules/auth/models/user_model.dart';
import 'package:cashflow/modules/transactions/models/transaction_model.dart';
import 'package:cashflow/shared/constants/urls_util.dart';
import 'package:cashflow/shared/exceptions/custom_exception.dart';
import 'package:http/http.dart' as http;

class TransactionRepository {
  Future<String> getIncomes({required UserModel user}) async {
    try {
      var response = await http.get(
        Uri.parse("${UrlsUtil().getUrlApp()}/income/${user.userId}"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${user.token}",
        },
      );
      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 404) {
        return "[]";
      } else {
        throw CustomException(
          title: "Problema",
          message: "Deu um erro na requisição: Status ${response.statusCode}",
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getExpenses({required UserModel user}) async {
    try {
      var response = await http.get(
        Uri.parse("${UrlsUtil().getUrlApp()}/expense/${user.userId}"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${user.token}",
        },
      );
      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 404) {
        return "[]";
      } else {
        throw CustomException(
          title: "Problema",
          message: "Deu um erro na requisição: Status ${response.statusCode}",
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> addTransaction({
    required double value,
    required String description,
    required String category,
    required UserModel user,
    required String transactionType,
  }) async {
    try {
      String url =
          transactionType == "income"
              ? "${UrlsUtil().getUrlApp()}/income"
              : "${UrlsUtil().getUrlApp()}/expense";
      String requestBody = json.encode({
        "value": value,
        "description": description,
        "category": category,
      });
      var response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${user.token}",
        },
        body: requestBody,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        throw CustomException(
          title: "Problema",
          message: "Deu um erro na requisição",
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> deleteTransaction({
    required TransactionModel transaction,
    required UserModel user,
    required String transactionType,
  }) async {
    try {
      String url =
          transactionType == "income"
              ? "${UrlsUtil().getUrlApp()}/income"
              : "${UrlsUtil().getUrlApp()}/expense";
      var response = await http.delete(
        Uri.parse("$url/${transaction.key}"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${user.token}",
        },
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw CustomException(title: response.body, message: "");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> updateTransaction({
    required double value,
    required String description,
    required String category,
    required TransactionModel transaction,
    required UserModel user,
    required String transactionType,
  }) async {
    try {
      String requestBody = json.encode({
        "value": value,
        "description": description,
        "category": category,
      });
      String url =
          transactionType == "income"
              ? "${UrlsUtil().getUrlApp()}/income"
              : "${UrlsUtil().getUrlApp()}/expense";
      var response = await http.put(
        Uri.parse("$url/${transaction.key}"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${user.token}",
        },
        body: requestBody,
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw CustomException(title: response.body, message: "");
      }
    } catch (e) {
      rethrow;
    }
  }
}
