// To parse this JSON data, do
//
//     final auth = authFromJson(jsonString);

import 'dart:convert';

Auth authFromJson(String str) => Auth.fromJson(json.decode(str));

String authToJson(Auth data) => json.encode(data.toJson());

class Auth {
  Auth({
    required this.user,
  });

  User user;

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.password,
    required this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
  });

  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String password;
  String rememberToken;
  DateTime createdAt;
  DateTime updatedAt;
  String role;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: int.parse(json["id"]),
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        password: json["password"],
        rememberToken: json["remember_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "password": password,
        "remember_token": rememberToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "role": role,
      };
}
