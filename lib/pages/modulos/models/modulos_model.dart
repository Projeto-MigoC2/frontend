

import 'package:migoc2/pages/conteudo/models/conteudo_model.dart';
class Modulo {
  String? id;
  String? nome;
  String? exemplo;
  List<Conteudo>? conteudos;

  Modulo({
    this.id,
    this.nome,
    this.exemplo,
    this.conteudos,
  });

  factory Modulo.fromJson(Map<String, dynamic> json) => Modulo(
        id: json['id'] as String?,
        nome: json['nome'] as String?,
        exemplo: json['exemplo'] as String?,
        // ignore: avoid_dynamic_calls
        conteudos: json['conteudos'] != null ? json['conteudos'].map<Conteudo>((json) => Conteudo.fromJson(json as Map<String, dynamic>)).toList() as List<Conteudo>?  : null,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['nome'] = nome;
    json['exemplo'] = exemplo;
    json['conteudos'] = conteudos;
    return json;
  }
}
