// ignore_for_file: file_names

class Volume {
  int  idVolume;
  String  titre;
  String  annee;
  String  imageCouverture;
  String  nomVolume;

  Volume({
    required this.idVolume,
    required this.titre,
    required this.annee,
    required this.imageCouverture,
    required this.nomVolume
  });
  
  factory Volume.fromJson(Map<String,dynamic> json){
    return Volume(
      idVolume: json['id_volume'],
      titre: json['Titre'],
      annee: json['Année'],
      imageCouverture: json['cover'],
      nomVolume: json['Nom_Volume'],
    );
  }
}