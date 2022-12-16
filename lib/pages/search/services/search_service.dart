import 'package:http/http.dart' as http;
import 'package:migoc2/resources/commons/urls.dart';

class SearchService {
  final baseURL = CommonURLs.server;
  final client = http.Client();

  Future<http.Response> searchSubject(String texto) async {
    final uri = Uri.parse('$baseURL/conteudos/pesquisa').replace(
      queryParameters: {
        'texto': texto,
      },
    );
    final response = await client.get(uri);

    return response;
  }
}
