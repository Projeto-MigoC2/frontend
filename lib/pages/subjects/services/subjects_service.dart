import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:migoc2/pages/subjects/models/subjects_list_model.dart';
import 'package:migoc2/pages/subjects/services/api_status.dart';

class SubjectsService {
  Future<Object> getUsers() async {
    try {
      final url = Uri.parse("");
      final response = await http.get(url);

      if (200 == response.statusCode) {
        return Success(response: subjectsModelFromJson(response.body));
      }
      return Failure(code: 100, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: 101, errorResponse: 'No Internet');
    } catch (e) {
      return Failure(code: 103, errorResponse: 'Unknown Error');
    }
  }
}
