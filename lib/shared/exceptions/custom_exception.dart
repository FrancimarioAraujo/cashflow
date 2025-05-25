class CustomException implements Exception {
  String tag = "";
  String title;
  String message;

  CustomException({required this.title, required this.message, this.tag = ""});
}
