class LoginRequest {
  String? email;
  String? password;

  LoginRequest({
    this.email, this.password
  });

  LoginRequest copyWith({
    String? email, String? password
  }) =>
      LoginRequest(
          email: email ?? this.email, password: password ?? this.password);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
    };
    map["email"] = email;
    map["password"] = password;
    return map;
  }

  LoginRequest.fromJson(dynamic json) {
    email = json["email"] ?? "";
    password = json["password"] ?? "";
  }
}