// ignore_for_file: file_names

class Volume {
  int ? idVolume;
  String ? titre;
  String ? annee;
  String ? imageCouverture;
  String ? nomVolume;

  Volume({
    this.idVolume,
    this.titre,
    this.annee,
    this.imageCouverture,
    this.nomVolume
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