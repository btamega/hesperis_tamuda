// ignore_for_file: file_names

class User {
  int ? id;
  String ? name;
  String ? email;
  String ? password;
  String ? token;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.token,
  });

  factory User.fromJson(Map<String,dynamic> json){
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      token: json['token'],
    );
  }
}