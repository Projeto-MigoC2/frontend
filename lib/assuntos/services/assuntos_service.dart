import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:migoc2/assuntos/models/assuntos_list_model.dart';
import 'package:migoc2/assuntos/services/api_status.dart';

class AssuntosService {
  static Future<Object> getUsers() async {
    try {
      var url = Uri.parse("");
      var response = await http.get(url);

      if (200 == response.statusCode) {
        return Success(response: assuntosModelFromJson(response.body));
      }
      return Failure(code: 100, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: 101, errorResponse: 'No Internet');
    } catch (e) {
      return Failure(code: 103, errorResponse: 'Unknown Error');
    }
  }
}