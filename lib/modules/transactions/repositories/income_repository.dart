import 'dart:convert';
import 'package:cashflow/modules/auth/models/user_model.dart';
import 'package:cashflow/shared/constants/urls_util.dart';
import 'package:cashflow/shared/exceptions/custom_exception.dart';
import 'package:http/http.dart' as http;

class TransactionRepository {
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
}
