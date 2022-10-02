import 'dart:convert';
import 'package:hesperis_tamuda/models/statut.dart';
import 'package:hesperis_tamuda/models/volume.dart';
import '../constant.dart';
import 'package:http/http.dart' as http;

Future<Volume> fetchVolume() async {
  final response = await http.get(Uri.parse(rootURL + '/api/recentArchives'));
  final volume = volumeFromJson(response.body.toString());
  if (response.statusCode == 200) {
    return volume;
  } else if (response.statusCode == 500) {
    throw Exception('Erreur interne du serveur');
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Volume> getArchives(var annee1, var annee2) async {
  final response = await http
      .get(Uri.parse(rootURL + '/api/archives-' + '$annee1' + '-' + '$annee2'));
  final volume = volumeFromJson(response.body.toString());
  if (response.statusCode == 200) {
    return volume;
  } else {
    return volume;
  }
}

Future createCommentaire(String email, String userName, String body) async {
  final response = await http.post(
    Uri.parse(rootURL + '/api/commentaires'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'userName': userName,
      'message': body,
      'created_at': DateTime.now().toString(),
    }),
  );
  if (response.statusCode == 201) {
    return jsonDecode(response.body);
  } else if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to create Commentaire.');
  }
}

Future<Statut> createUser(String name, String email, String password) async {
  final response = await http.post(
    Uri.parse(rootURL + '/api/register'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'userName': name,
      'password': password,
      'created_at': DateTime.now().toString(),
    }),
  );

  if (response.statusCode == 200) {
    final statut = statutFromJson(response.body.toString());
    return statut;
  } else if (response.statusCode == 201) {
    return statutFromJson(response.body.toString());
  } else {
    throw Exception('Failed to create your account.');
  }
}

Future<Statut> authenticate(String email, String password) async {
  final response = await http.post(
    Uri.parse(rootURL + '/api/login'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    final statut = statutFromJson(response.body.toString());
    return statut;
  } else if (response.statusCode == 201) {
    return statutFromJson(response.body.toString());
  } else {
    throw Exception('Failed to log in.');
  }
}
