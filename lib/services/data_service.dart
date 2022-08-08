
import 'dart:convert';
import 'package:hesperis_tamuda/models/article.dart';
import 'package:hesperis_tamuda/models/fascicule.dart';
import 'package:hesperis_tamuda/models/volume.dart';
import '../constant.dart';
import '../models/api_response.dart';
import 'package:http/http.dart' as http;

Future<List<Volume>> getVolumes() async {
    final response = await http.get(
      Uri.parse(rootURL+'/api/lastIssues'),
    );
    var jsonData = jsonDecode(response.body);
      if (jsonData!=null) {
        List<Volume> volumes=[];
        for (var item in jsonData) {
          Volume volume = Volume(
            idVolume: item['id_volume'], 
            titre: item['Titre'], 
            annee: item['Année'], 
            imageCouverture: item['cover'], 
            nomVolume: item['Nom_Volume']
            );
          volumes.add(volume);
        }
        return volumes;
      } else {
        throw Exception('Failed to load volume');
      }
  }
Future<List<Volume>> getArchives(var annee1,var annee2) async {
    final response = await http.get(
      Uri.parse(rootURL+'/api/archives-'+'$annee1'+'-'+'$annee2'),
    );
    var jsonData = jsonDecode(response.body);
      if (jsonData!=null) {
        List<Volume> volumes=[];
        for (var item in jsonData) {
          Volume volume = Volume(
            idVolume: item['id_volume'], 
            titre: item['Titre'], 
            annee: item['Année'], 
            imageCouverture: item['cover'], 
            nomVolume: item['Nom_Volume']
            );
          volumes.add(volume);
        }
        return volumes;
      } else {
        throw Exception('Failed to load volume');
      }
  }
  Future<List<Fascicule>> getFascicules() async {
    final response = await http.get(
      Uri.parse(rootURL+'/api/lastIssues'),
    );
    var jsonData = jsonDecode(response.body);
      if (jsonData!=null) {
         List<Fascicule> fascicules=[];
        for (var item in jsonData) {
          Fascicule fascicule = Fascicule(
            idFascicule: item['id_fascicule'], 
            idVolume: item['id_volume'], 
            nom: item['Nom'],
            annee: item['Année'], 
            titreFascicule: item['Titre_Fascicule'], 
            numero: item['numero'],
            cover: item['couverture'],
            );
           fascicules.add(fascicule);
        }
        return fascicules;
      } else {
        throw Exception('Failed to load Fascicule');
      }
  }

Future<ApiResponse> getVolumeDetails() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.get(
      Uri.parse(volumeURL),
    );
    switch (response.statusCode) {
      case 200:
        apiResponse.data =jsonDecode(response.body);
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.errors = errors[errors.keys.elementAt(0)][0];
        break;
      case 403:
        apiResponse.errors = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.errors = somethingWrong;
        break;
    }
  } catch (e) {
        apiResponse.errors = serverError;
  }
  return apiResponse;
}

Future<ApiResponse> getFasciculeDetails() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.get(
      Uri.parse(fasciculeURL),
    );
    switch (response.statusCode) {
      case 200:
        apiResponse.data =jsonDecode(response.body);
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.errors = errors[errors.keys.elementAt(0)][0];
        break;
      case 403:
        apiResponse.errors = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.errors = somethingWrong;
        break;
    }
  } catch (e) {
        apiResponse.errors = serverError;
  }
  return apiResponse;
}

Future<ApiResponse> getParticularData() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.get(
      Uri.parse(rootURL+'/volume/10/fascicule/list'),
    );
    switch (response.statusCode) {
      case 200:
        apiResponse.data =jsonDecode(response.body);
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.errors = errors[errors.keys.elementAt(0)][0];
        break;
      case 403:
        apiResponse.errors = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.errors = somethingWrong;
        break;
    }
  } catch (e) {
        apiResponse.errors = serverError;
  }
  return apiResponse;
}

