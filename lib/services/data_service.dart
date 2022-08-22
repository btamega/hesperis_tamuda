import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/models/commentaire.dart';
import 'package:hesperis_tamuda/models/volume.dart';
import '../constant.dart';
import 'package:http/http.dart' as http;

Future<Volume> fetchVolume() async{
    final response = await http.get(Uri.parse(rootURL+'/api/recentArchives'));
    final volume = volumeFromJson(response.body.toString());
    if (response.statusCode==200) {
      return volume;
    } else {
      return volume;
    }
  }
  Future<Volume> getArchives(var annee1,var annee2) async{
    final response = await http.get(Uri.parse(rootURL+'/api/archives-'+'$annee1'+'-'+'$annee2'));
    final volume = volumeFromJson(response.body.toString());
    if (response.statusCode==200) {
      return volume;
    } else {
      return volume;
    }
  }
  Future createCommentaire(String email,String userName, String body) async {
  final response = await http.post(
    Uri.parse(rootURL+'/api/commentaires'),
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
  }else if(response.statusCode==200){
    return jsonDecode(response.body);
  }
   else {
    throw Exception('Failed to create Commentaire.');
  }
}


   
