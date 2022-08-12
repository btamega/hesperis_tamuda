
import 'dart:convert';
import 'package:hesperis_tamuda/models/article.dart';
import 'package:hesperis_tamuda/models/fascicule.dart';
import 'package:hesperis_tamuda/models/volume.dart';
import '../constant.dart';
import '../models/api_response.dart';
import 'package:http/http.dart' as http;

Future<Volume> fetchVolume() async{
    final response = await http.get(Uri.parse(rootURL+'/api/archives'));
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
  Future<Volume> getFascicules(var idVolume) async{
    final response = await http.get(Uri.parse(rootURL+'/api/archive/'+'$idVolume'));
    final volume = volumeFromJson(response.body.toString());
    if (response.statusCode==200) {
      return volume;
    } else {
      return volume;
    }
  }


