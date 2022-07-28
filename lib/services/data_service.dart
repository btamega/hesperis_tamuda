
import 'dart:convert';
import 'package:hesperis_tamuda/models/volume.dart';
import '../constant.dart';
import '../models/api_response.dart';
import 'package:http/http.dart' as http;

Future<List<Volume>> getVolumes() async {
    final response = await http.get(
      Uri.parse(volumeURL),
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
Future<ApiResponse> getArticleDetails() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.get(
      Uri.parse(articleURL),
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