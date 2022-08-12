// To parse this JSON data, do
//
//     final volume = volumeFromJson(jsonString);

import 'dart:convert';

Volume volumeFromJson(String str) => Volume.fromJson(json.decode(str));

String volumeToJson(Volume data) => json.encode(data.toJson());

class Volume {
    Volume({
        required this.data,
    });

    List<Datum> data;

    factory Volume.fromJson(Map<String, dynamic> json) => Volume(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.idVolume,
        required this.titre,
        required this.anne,
        required this.cover,
        required this.nomVolume,
        this.fascicules,
    });

    int idVolume;
    String titre;
    String anne;
    String cover;
    String nomVolume;
    List<Fascicule>? fascicules;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idVolume: json["id_volume"],
        titre: json["Titre"],
        anne: json["Année"],
        cover: json["cover"],
        nomVolume: json["Nom_Volume"],
        fascicules: List<Fascicule>.from(json["fascicules"].map((x) => Fascicule.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id_volume": idVolume,
        "Titre": titre,
        "Année": anne,
        "cover": cover,
        "Nom_Volume": nomVolume,
        "fascicules": List<dynamic>.from(fascicules!.map((x) => x.toJson())),
    };
}

class Fascicule {
    Fascicule({
        required this.idFascicule,
        required this.idVolume,
        required this.nom,
        required this.anne,
        required this.numero,
        required this.titreFascicule,
    });

    int idFascicule;
    int idVolume;
    String nom;
    String anne;
    String numero;
    String titreFascicule;

    factory Fascicule.fromJson(Map<String, dynamic> json) => Fascicule(
        idFascicule: json["id_fascicule"],
        idVolume: json["id_volume"],
        nom: json["Nom"],
        anne: json["Année"],
        numero: json["numero"],
        titreFascicule: json["Titre_Fascicule"],
    );

    Map<String, dynamic> toJson() => {
        "id_fascicule": idFascicule,
        "id_volume": idVolume,
        "Nom": nom,
        "Année": anne,
        "numero": numero,
        "Titre_Fascicule": titreFascicule,
    };
}




