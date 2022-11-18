import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ModulosService {
  final baseURL = 'http://3.86.106.14';
  final client = http.Client();

  Future<http.Response?> getModulos() async {
    const endpoint = 'modulos';
    final url = Uri.parse("$baseURL/$endpoint");

    try {
      final response = await client.get(url);
      return response;
    } on ClientException catch (error) {
      if (kDebugMode) {
        print(error);
        return null;
      }
    }
    return null;
  }
}
