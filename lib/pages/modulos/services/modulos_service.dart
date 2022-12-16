import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:migoc2/resources/commons/urls.dart';

class ModulosService {
  final baseURL = CommonURLs.server;
  final client = http.Client();

  Future<http.Response?> getModulos() async {
    const endpoint = 'modulos';
    final url = Uri.parse("$baseURL/$endpoint");

    try {
      final response = await client.get(url);
      return response;
    } on http.ClientException catch (error) {
      if (kDebugMode) {
        print(error);
        return null;
      }
    }
    return null;
  }
}
