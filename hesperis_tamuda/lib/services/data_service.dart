import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:hesperis_tamuda/models/statut.dart';
import 'package:hesperis_tamuda/models/volume.dart';
import 'package:hesperis_tamuda/services/exceptions.dart';
import '../constant.dart';
import 'package:http/http.dart' as http;

Future<dynamic> fetchVolume(BuildContext context) async {
  try {
    final response = await http.get(Uri.parse(rootURL + '/api/recentArchives'));
    switch (response.statusCode) {
      case 200:
        final volume = volumeFromJson(response.body.toString());
        return volume;
      case 400: //Bad request
        throw BadRequestException(jsonDecode(response.body)['message']);
      case 401: //Unauthorized
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 403: //Forbidden
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 404: //Resource Not Found
        throw NotFoundException(jsonDecode(response.body)['message']);
      case 500: //Internal Server Error
      default:
        throw FetchDataException(
            'Something went wrong! ${response.statusCode}');
    }
  } catch (e) {
    throw ExceptionHandlers().getExceptionString(e, context);
  }
}

Future<dynamic> getArchives(
    var annee1, var annee2, BuildContext context) async {
  try {
    final response = await http.get(
        Uri.parse(rootURL + '/api/archives-' + '$annee1' + '-' + '$annee2'));
    switch (response.statusCode) {
      case 200:
        final volume = volumeFromJson(response.body.toString());
        return volume;
      case 400: //Bad request
        throw BadRequestException(jsonDecode(response.body)['message']);
      case 401: //Unauthorized
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 403: //Forbidden
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 404: //Resource Not Found
        throw NotFoundException(jsonDecode(response.body)['message']);
      case 500: //Internal Server Error
      default:
        throw FetchDataException(
            'Something went wrong! ${response.statusCode}');
    }
  } catch (e) {
    throw ExceptionHandlers().getExceptionString(e, context);
  }
}

Future createCommentaire(
    String email, String userName, String body, BuildContext context) async {
  try {
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
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400: //Bad request
        throw BadRequestException(jsonDecode(response.body)['message']);
      case 401: //Unauthorized
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 403: //Forbidden
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 404: //Resource Not Found
        throw NotFoundException(jsonDecode(response.body)['message']);
      case 500: //Internal Server Error
      default:
        throw FetchDataException(
            'Something went wrong! ${response.statusCode}');
    }
  } catch (e) {
    throw ExceptionHandlers().getExceptionString(e, context);
  }

  // if (response.statusCode == 201) {
  //   return jsonDecode(response.body);
  // } else if (response.statusCode == 200) {
  //   return jsonDecode(response.body);
  // } else {
  //   throw Exception('Failed to create Commentaire.');
  // }
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
