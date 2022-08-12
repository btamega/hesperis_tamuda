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

// class Article {
//     Article({
//         required this.idArticles,
//         required this.idFascicule,
//         required this.idSommaire,
//         required this.titre,
//         required this.nbrePage,
//         required this.lienTelechargement,
//         required this.datePublication,
//     });

//     int idArticles;
//     int idFascicule;
//     int idSommaire;
//     String titre;
//     String nbrePage;
//     String lienTelechargement;
//     String datePublication;

//     factory Article.fromJson(Map<String, dynamic> json) => Article(
//         idArticles: json["id_articles"],
//         idFascicule: json["id_fascicule"],
//         idSommaire: json["id_sommaire"],
//         titre: json["Titre"],
//         nbrePage: json["Nbre_Page"],
//         lienTelechargement: json["Lien_Telechargement"],
//         datePublication: json["Date_Publication"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id_articles": idArticles,
//         "id_fascicule": idFascicule,
//         "id_sommaire": idSommaire,
//         "Titre": titre,
//         "Nbre_Page": nbrePage,
//         "Lien_Telechargement": lienTelechargement,
//         "Date_Publication": datePublication,
//     };
// }

