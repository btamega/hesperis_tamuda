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
    });

    String? error;
    String? success;

    factory Statut.fromJson(Map<String, dynamic> json) => Statut(
        error: json["error"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "success": success,
    };
}
