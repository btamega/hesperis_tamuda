

import 'dart:convert';

import 'package:hesperis_tamuda/constant.dart';

import '../models/user.dart';
import '../models/api_response.dart';
import 'package:http/http.dart' as http;
Future<ApiResponse> login(String email, String password) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(
      Uri.parse(loginURL),
      headers: {'Accept' : 'application/json'},
      body: {'email':email,'password':password}
    );
    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
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