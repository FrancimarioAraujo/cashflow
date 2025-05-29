import 'dart:convert';
import 'package:cashflow/modules/auth/models/user_model.dart';
import 'package:cashflow/shared/constants/urls_util.dart';
import 'package:cashflow/shared/exceptions/custom_exception.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<String> createUser({
    required String email,
    required String password,
    required String name,
    required String confirmPassword,
  }) async {
    try {
      String requestBody = json.encode({
        "name": name,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
      });
      var response = await http.post(
        Uri.parse("${UrlsUtil().getUrlApp()}/user"),
        headers: {"Content-Type": "application/json"},
        body: requestBody,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else if (response.statusCode == 400) {
        throw CustomException(
          title: "Usuário já existe",
          message: "Essa conta já existe na nossa base de dados",
        );
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

  Future<String> login(String email, String senha) async {
    try {
      var response = await http.post(
        Uri.parse("${UrlsUtil().getUrlApp()}/login"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"email": email, "password": senha}),
      );
      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 404) {
        throw CustomException(
          title: 'Email ou senha inválidos',
          message: "Verifique se você digitou o email e senha corretamente.",
        );
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

  Future<String> getUserByEmail(String email) async {
    try {
      var response = await http.get(
        Uri.parse("${UrlsUtil().getUrlApp()}/user/$email"),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 404) {
        throw CustomException(
          title: 'Usuário não encontrado',
          message: "Não encontramos um usuário com esse email.",
        );
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

  Future<String> deleteUser(UserModel user) async {
    try {
      var response = await http.delete(
        Uri.parse("${UrlsUtil().getUrlApp()}/user"),
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

  // Future<String> resetPassword(String email) async {
  //   try {
  //     var response = await http.post(
  //         Uri.parse("${UrlsUtil().getUrlAppSei()}/taxes/users/resetpassword/"),
  //         headers: {"Content-Type": "application/json"},
  //         body: json.encode({
  //           "email": email,
  //         }));
  //     if (response.statusCode == 200 || response.statusCode == 404) {
  //       return response.body;
  //     } else {
  //       throw "Deu um erro na requisição";
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
