import 'package:cashflow/shared/constants/app_strings.dart';

class PasswordValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.typePassword;
    }
    if (value.length < 8) {
      return AppStrings.passwordLength;
    }
    if (!RegExp(r"[A-Z]").hasMatch(value)) {
      return AppStrings.passwordUppercase;
    }
    if (!RegExp(r"[0-9]").hasMatch(value)) {
      return AppStrings.passwordNumber;
    }
    if (!RegExp(r"[!@#\$%^&*(),.?\:{}|<>]").hasMatch(value)) {
      return AppStrings.passwordSpecialChar;
    }
    return null;
  }
}
