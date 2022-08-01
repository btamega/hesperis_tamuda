// ignore_for_file: file_names

class Vignette {
  int  idVignette;
  int  idFascicule;
  String  path;
  Enum  type;

  Vignette({
    required this.idVignette,
    required this.idFascicule,
    required this.path,
    required this.type
  });
  
  factory Vignette.fromJson(Map<String,dynamic> json){
    return Vignette(
      idVignette: json['id_vignette'],
      idFascicule: json['id_fascicule'],
      path: json['Path'],
      type: json['Type'],
    );
  }
}