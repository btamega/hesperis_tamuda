// To parse this JSON data, do
//
//     final article = articleFromJson(jsonString);

import 'dart:convert';

Article articleFromJson(String str) => Article.fromJson(json.decode(str));

String articleToJson(Article data) => json.encode(data.toJson());

class Article {
  Article({
    required this.data,
  });

  List<Datum> data;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.idArticles,
    required this.idFascicule,
    required this.idSommaire,
    required this.titre,
    required this.nbrePage,
    required this.lienTelechargement,
    required this.datePublication,
    required this.auteurs,
  });

  int idArticles;
  int idFascicule;
  int idSommaire;
  String titre;
  String nbrePage;
  String lienTelechargement;
  String datePublication;
  List<Auteur> auteurs;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idArticles: json["id_articles"],
        idFascicule: int.parse(json["id_fascicule"]),
        idSommaire: int.parse(json["id_sommaire"]),
        titre: json["Titre"],
        nbrePage: json["Nbre_Page"],
        lienTelechargement: json["Lien_Telechargement"],
        datePublication: json["Date_Publication"],
        auteurs:
            List<Auteur>.from(json["auteurs"].map((x) => Auteur.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id_articles": idArticles,
        "id_fascicule": idFascicule,
        "id_sommaire": idSommaire,
        "Titre": titre,
        "Nbre_Page": nbrePage,
        "Lien_Telechargement": lienTelechargement,
        "Date_Publication": datePublication,
        "auteurs": List<dynamic>.from(auteurs.map((x) => x.toJson())),
      };
}

class Auteur {
  Auteur({
    required this.idAuteur,
    required this.nom,
    required this.prenom,
    this.stat,
  });

  int idAuteur;
  String nom;
  String prenom;
  String? stat;

  factory Auteur.fromJson(Map<String, dynamic> json) => Auteur(
        idAuteur: json["id_auteur"],
        nom: json["Nom"],
        prenom: json["Prenom"],
        stat: json["stat"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id_auteur": idAuteur,
        "Nom": nom,
        "Prenom": prenom,
        "stat": stat,
      };
}
