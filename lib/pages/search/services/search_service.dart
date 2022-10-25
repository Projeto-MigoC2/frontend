import 'package:http/http.dart' as http;

class SearchService {
  final baseURL = 'http://3.86.106.14';
  final client = http.Client();

  Future<http.Response> searchSubject(String conteudo) async {
    const endpoint = 'conteudos/pesquisa';
    final url = Uri.parse("$baseURL/$endpoint?texto=$conteudo");
    final response = await client.get(url);

    return response;
  }
}
