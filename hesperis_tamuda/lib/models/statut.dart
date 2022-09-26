// To parse this JSON data, do
//
//     final statut = statutFromJson(jsonString);

import 'dart:convert';

Statut statutFromJson(String str) => Statut.fromJson(json.decode(str));

String statutToJson(Statut data) => json.encode(data.toJson());

class Statut {
    Statut({
        this.error,
        this.success,
        this.user,
    });

    String? error;
    String? success;
    User? user;

    factory Statut.fromJson(Map<String, dynamic> json) => Statut(
        error: json["error"],
        success: json["success"],
        user: json["user"]!=null? User.fromJson(json["user"]):json["user"],
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "success": success,
        "user": user!.toJson(),
    };
}
class User {
    User({
        required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.createdAt,
        this.password,
    });

    int id;
    String name;
    String email;
    String? password;
    dynamic emailVerifiedAt;
    DateTime createdAt;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
    };
}
