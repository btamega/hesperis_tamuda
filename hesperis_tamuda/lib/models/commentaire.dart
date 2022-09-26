class Commentaire {
  int id;
  String email;
  String userName;
  String message;
  String createdAt;


  Commentaire({required this.id, required this.email, required this.userName, required this.message, required this.createdAt});

  factory Commentaire.fromJson(Map<String, dynamic> json) {
    return Commentaire(
      id: json['id'],
      email: json['Email'],
      userName: json['Nom'],
      message: json['Message'],
      createdAt: json['created_at'],
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt,
        "Message": message,
        "Email": email,
        "Nom": userName,
    };
}