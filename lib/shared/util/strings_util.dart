import 'package:cashflow/shared/exceptions/custom_exception.dart';

class StringsUtil {
  double textToDouble(String? value) {
    if (!isValidNumber(value)) {
      throw CustomException(
        title: "Número inválido",
        message: "Por favor, insira um número válido.",
      );
    }
    String normalizedValue = value!.replaceAll(',', '.');
    double doubleValue = double.parse(normalizedValue);
    return doubleValue;
  }

  bool isValidNumber(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    // Normaliza o valor substituindo vírgulas por pontos antes de validar.
    String normalizedValue = value.replaceAll(',', '.');
    return double.tryParse(normalizedValue) != null;
  }
}
