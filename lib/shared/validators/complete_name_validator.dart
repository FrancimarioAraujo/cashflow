class CompleteNameValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nome completo não pode estar vazio';
    }

    final words = value.trim().split(' ');
    if (words.length < 2) {
      return 'Por favor, insira seu nome completo';
    }

    for (var word in words) {
      if (word.length < 2) {
        return 'Cada parte do nome deve ter pelo menos 2 letras';
      }
    }

    return null;
  }
}