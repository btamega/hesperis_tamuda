// To parse this JSON data, do
//
//     final search = searchFromJson(jsonString);

// ignore_for_file: constant_identifier_names, duplicate_ignore

import 'dart:convert';

Search? searchFromJson(String str) => Search.fromJson(json.decode(str));

String searchToJson(Search? data) => json.encode(data!.toJson());

class Search {
  Search({
    this.articles,
    this.auteurs,
    this.searcharticles,
    this.searchAuteurs,
    this.sommaire,
  });

  List<Article?>? articles;
  List<Auteur?>? auteurs;
  List<Article?>? searcharticles;
  List<dynamic>? searchAuteurs;
  List<Sommaire?>? sommaire;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        articles: json["articles"] == null
            ? []
            : List<Article?>.from(
                json["articles"]!.map((x) => Article.fromJson(x))),
        auteurs: json["auteurs"] == null
            ? []
            : List<Auteur?>.from(
                json["auteurs"]!.map((x) => Auteur.fromJson(x))),
        searcharticles: json["Searcharticles"] == null
            ? []
            : List<Article?>.from(
                json["Searcharticles"]!.map((x) => Article.fromJson(x))),
        searchAuteurs: json["SearchAuteurs"] == null
            ? []
            : List<dynamic>.from(json["SearchAuteurs"]!.map((x) => x)),
        sommaire: json["sommaire"] == null
            ? []
            : List<Sommaire?>.from(
                json["sommaire"]!.map((x) => Sommaire.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "articles": articles == null
            ? []
            : List<dynamic>.from(articles!.map((x) => x!.toJson())),
        "auteurs": auteurs == null
            ? []
            : List<dynamic>.from(auteurs!.map((x) => x!.toJson())),
        "Searcharticles": searcharticles == null
            ? []
            : List<dynamic>.from(searcharticles!.map((x) => x!.toJson())),
        "SearchAuteurs": searchAuteurs == null
            ? []
            : List<dynamic>.from(searchAuteurs!.map((x) => x)),
        "sommaire": sommaire == null
            ? []
            : List<dynamic>.from(sommaire!.map((x) => x!.toJson())),
      };
}

class Article {
  Article({
    this.idArticles,
    this.createdAt,
    this.updatedAt,
    this.idFascicule,
    this.idSommaire,
    this.titre,
    this.nbrePage,
    this.lienTelechargement,
    this.datePublication,
  });

  String? idArticles;
  dynamic createdAt;
  dynamic updatedAt;
  String? idFascicule;
  String? idSommaire;
  String? titre;
  String? nbrePage;
  String? lienTelechargement;
  String? datePublication;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        idArticles: json["id_articles"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        idFascicule: json["id_fascicule"],
        idSommaire: json["id_sommaire"],
        titre: json["Titre"],
        nbrePage: json["Nbre_Page"],
        lienTelechargement: json["Lien_Telechargement"],
        datePublication: json["Date_Publication"],
      );

  Map<String, dynamic> toJson() => {
        "id_articles": idArticles,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "id_fascicule": idFascicule,
        "id_sommaire": idSommaire,
        "Titre": titre,
        "Nbre_Page": nbrePage,
        "Lien_Telechargement": lienTelechargement,
        "Date_Publication": datePublication,
      };
}

// ignore: constant_identifier_names
enum CreatedAtEnum { THE_00000000000000 }

final createdAtEnumValues =
    EnumValues({"0000-00-00 00:00:00": CreatedAtEnum.THE_00000000000000});

class Auteur {
  Auteur({
    this.idEditer,
    this.createdAt,
    this.updatedAt,
    this.idArticles,
    this.idAuteur,
    this.nom,
    this.prenom,
    this.stat,
  });

  String? idEditer;
  String? createdAt;
  String? updatedAt;
  String? idArticles;
  String? idAuteur;
  String? nom;
  String? prenom;
  String? stat;

  factory Auteur.fromJson(Map<String, dynamic> json) => Auteur(
        idEditer: json["id_editer"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        idArticles: json["id_articles"],
        idAuteur: json["id_auteur"],
        nom: json["Nom"],
        prenom: json["Prenom"],
        stat: json["stat"],
      );

  Map<String, dynamic> toJson() => {
        "id_editer": idEditer,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "id_articles": idArticles,
        "id_auteur": idAuteur,
        "Nom": nom,
        "Prenom": prenom,
        "stat": stat,
      };
}

enum Stat {
  EMPTY,
  CORD,
  DIRS,
  DIR,
  COORDS,
  ET_AL,
  ED,
  COOR_DIR,
  COORD,
  EDS,
  TANSQ,
  COOR,
  DIRASAT,
  TARJAMAT,
  ICHRF_WA_TAQDM,
  STAT_DIR,
  STAT_EDS
}

final statValues = EnumValues({
  "(coor)": Stat.COOR,
  "(coord)": Stat.COORD,
  "(coords)": Stat.COORDS,
  "(coor. & dir)": Stat.COOR_DIR,
  "(cord.)": Stat.CORD,
  "(dir)": Stat.DIR,
  "(dirasat)": Stat.DIRASAT,
  "(dirs.)": Stat.DIRS,
  "(ed)": Stat.ED,
  "(eds)": Stat.EDS,
  "": Stat.EMPTY,
  "et al.": Stat.ET_AL,
  "(Ichrāf wa taqdīm)": Stat.ICHRF_WA_TAQDM,
  "(dir.)": Stat.STAT_DIR,
  "(eds.)": Stat.STAT_EDS,
  "(tansīq)": Stat.TANSQ,
  "(tarjamat)": Stat.TARJAMAT
});

class Sommaire {
  Sommaire({
    this.idSommaire,
    this.createdAt,
    this.updatedAt,
    this.titre,
  });

  String? idSommaire;
  String? createdAt;
  String? updatedAt;
  String? titre;

  factory Sommaire.fromJson(Map<String, dynamic> json) => Sommaire(
        idSommaire: json["id_sommaire"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        titre: json["Titre"],
      );

  Map<String, dynamic> toJson() => {
        "id_sommaire": idSommaire,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "Titre": titre,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
