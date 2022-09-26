// To parse this JSON data, do
//
//     final sommaire = sommaireFromJson(jsonString);

import 'dart:convert';

import 'article.dart';

SommaireArticle sommaireFromJson(String str) => SommaireArticle.fromJson(json.decode(str));

String sommaireToJson(SommaireArticle data) => json.encode(data.toJson());

class SommaireArticle {
    SommaireArticle({
        required this.data,
    });

    List<Datum> data;

    factory SommaireArticle.fromJson(Map<String, dynamic> json) => SommaireArticle(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.idSommaire,
        required this.titre,
        required this.articles,
    });

    int idSommaire;
    String titre;
    List<Article> articles;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idSommaire: json["id_sommaire"],
        titre: json["Titre"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id_sommaire": idSommaire,
        "Titre": titre,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
}


