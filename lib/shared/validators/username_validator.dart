class UsernameValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nome de usuário não pode estar vazio';
    }

  
    if (value.length < 3 || value.length > 30) {
      return 'Nome de usuário deve ter entre 3 e 30 caracteres';
    }

  
    final validCharacters = RegExp(r'^[a-zA-Z0-9._-]+$');
    if (!validCharacters.hasMatch(value)) {
      return 'Nome de usuário pode conter apenas letras, números, pontos, sublinhados e traços';
    }

  
    if (RegExp(r'^[._-]').hasMatch(value) || RegExp(r'[._-]$').hasMatch(value)) {
      return 'Nome de usuário não pode começar ou terminar com ponto, sublinhado ou traço';
    }

    if (value.contains('..') || value.contains('__') || value.contains('--')) {
      return 'Nome de usuário não pode conter dois pontos, sublinhados ou traços consecutivos';
    }

    return null;
  }
}