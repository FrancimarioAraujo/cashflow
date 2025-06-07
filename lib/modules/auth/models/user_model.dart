class UserModel {
  late String userId;
  late String name;
  late String email;
  late String password;
  late String token;
  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.password,
    required this.token,
  });

  UserModel.setData(
    Map<String, dynamic> json, {
    required String tokenValue,
    required String userIdValue,
  }) {
    name = json['name'] ?? "";
    email = json['email'] ?? "";
    password = json['password'] ?? "";
    token = tokenValue;
    userId = userIdValue;
  }

  UserModel.cleanData() {
    name = "";
    email = "";
    password = "";
    token = "";
    userId = "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['token'] = token;
    data['userId'] = userId;
    return data;
  }
}
