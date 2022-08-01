// ignore_for_file: file_names

class Fascicule {
  int  idFascicule;
  int  idVolume;
  String  nom;
  String  annee;
  String  titreFascicule;
  String  numero;

  Fascicule({
    required this.idFascicule,
    required this.idVolume,
    required this.nom,
    required this.annee,
    required this.titreFascicule,
    required this.numero
  });
  
  factory Fascicule.fromJson(Map<String,dynamic> json){
    return Fascicule(
      idFascicule: json['id_fascicule'],
      idVolume: json['id_volume'],
      nom: json['Nom'],
      annee: json['Année'],
      titreFascicule: json['Titre_Fascicule'],
      numero: json['numero'],
    );
  }
}