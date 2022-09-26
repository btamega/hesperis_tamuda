import 'dart:convert';

List<Auteur> auteurFromJson(String str) => List<Auteur>.from(json.decode(str).map((x) => Auteur.fromJson(x)));

String auteurToJson(List<Auteur> data) => json.encode(List<Auteur>.from(data.map((e) => e.toJson())));

class Auteur {
    Auteur({
        required this.idAuteur,
        required this.nom,
        required this.prenom,
        required this.stat,
    });

    int idAuteur;
    String nom;
    String prenom;
    String stat;

    factory Auteur.fromJson(Map<String, dynamic> json) => Auteur(
        idAuteur: json["id_auteur"],
        nom: json["Nom"],
        prenom: json["Prenom"],
        stat: json["stat"],
    );

    Map<String, dynamic> toJson() => {
        "id_auteur": idAuteur,
        "Nom": nom,
        "Prenom": prenom,
        "stat": stat,
    };
}