import 'package:http/http.dart' as http;

class SearchService {
  final baseURL = 'http://3.86.106.14';
  final client = http.Client();

  Future<http.Response> searchSubject(String texto) async {
    final uri = Uri.parse('$baseURL/conteudos').replace(
      queryParameters: {
        'texto': texto,
      },
    );
    final response = await client.get(uri);

    return response;
  }
}
