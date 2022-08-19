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
  


