class EmailValidator {
  static String? validate(String? value) {
   
    if (value == null || value.isEmpty) {
      return "Digite um e-mail";
    }

    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(emailPattern);

    
    if (!regex.hasMatch(value)) {
      return "Por favor, digite um e-mail válido";
    }

    return null;
  }
}
