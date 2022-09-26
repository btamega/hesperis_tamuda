// To parse this JSON data, do
//
//     final fascicule = fasciculeFromJson(jsonString);

import 'dart:convert';

Fascicule fasciculeFromJson(String str) => Fascicule.fromJson(json.decode(str));

String fasciculeToJson(Fascicule data) => json.encode(data.toJson());

class Fascicule {
    Fascicule({
        required this.data,
    });

    List<Datum> data;

    factory Fascicule.fromJson(Map<String, dynamic> json) => Fascicule(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.idFascicule,
        required this.idVolume,
        required this.nom,
        required this.anne,
        required this.numero,
        required this.titreFascicule,
        required this.sommaires,
        required this.vignettes,
    });

    int idFascicule;
    int idVolume;
    String nom;
    String anne;
    String numero;
    String titreFascicule;
    List<Sommaire> sommaires;
    List<Vignette> vignettes;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idFascicule: json["id_fascicule"],
        idVolume: int.parse(json["id_volume"]),
        nom: json["Nom"],
        anne: json["Année"],
        numero: json["numero"],
        titreFascicule: json["Titre_Fascicule"],
        sommaires: List<Sommaire>.from(json["sommaires"].map((x) => Sommaire.fromJson(x))),
        vignettes: List<Vignette>.from(json["vignettes"].map((x) => Vignette.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id_fascicule": idFascicule,
        "id_volume": idVolume,
        "Nom": nom,
        "Année": anne,
        "numero": numero,
        "Titre_Fascicule": titreFascicule,
        "sommaires": List<dynamic>.from(sommaires.map((x) => x.toJson())),
        "vignettes": List<dynamic>.from(vignettes.map((x) => x.toJson())),
    };
}

class Sommaire {
    Sommaire({
        required this.idSommaire,
        required this.titre,
    });

    int idSommaire;
    String titre;

    factory Sommaire.fromJson(Map<String, dynamic> json) => Sommaire(
        idSommaire: json["id_sommaire"],
        titre: json["Titre"],
    );

    Map<String, dynamic> toJson() => {
        "id_sommaire": idSommaire,
        "Titre": titre,
    };
}

class Vignette {
    Vignette({
        required this.idVignette,
        required this.path,
        required this.idFascicule,
        required this.type,
    });

    int idVignette;
    String path;
    int idFascicule;
    String type;

    factory Vignette.fromJson(Map<String, dynamic> json) => Vignette(
        idVignette: int.parse(json["id_vignette"]),
        path: json["Path"],
        idFascicule: int.parse(json["id_fascicule"]),
        type: json["Type"],
    );

    Map<String, dynamic> toJson() => {
        "id_vignette": idVignette,
        "Path": path,
        "id_fascicule": idFascicule,
        "Type": type,
    };
}

