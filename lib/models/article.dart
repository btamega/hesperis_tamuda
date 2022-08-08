
class Article {
  int idArticle;
  int idFascicule;
  int idSommaire;
  String titre;
  String nbrePage;
  String lienTelechargement;
  String datePublication;

  Article({
    required this.idArticle,
    required this.idFascicule,
    required this.idSommaire,
    required this.titre,
    required this.nbrePage,
    required this.lienTelechargement,
    required this.datePublication,
  });

  factory Article.fromJson(Map<String,dynamic> json){
    return Article(
      idArticle: json['id_articles'], 
      idFascicule: json['id_fascicule'], 
      idSommaire: json['id_sommaire'],
      titre: json['Titre'], 
      nbrePage:json['Nbre_Page'], 
      lienTelechargement: json['Lien_Telechargement'], 
      datePublication: json['Date_Publication']
      );
  }
}