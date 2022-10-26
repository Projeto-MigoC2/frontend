class Conteudo {
  String? id;
  String? titulo;
  String? resumo;
  String? elaboracao;
  String? assuntoID;
  String? criadoEm;
  String? atualizadoEm;

  Conteudo({
    this.id,
    this.titulo,
    this.resumo,
    this.elaboracao,
    this.assuntoID,
    this.criadoEm,
    this.atualizadoEm,
  });

  // ignore: avoid_dynamic_calls
  factory Conteudo.fromJson(Map<String, dynamic> json) => Conteudo(
        id: json["id"] as String?,
        titulo: json['titulo'] as String?,
        resumo: json['resumo'] as String?,
        elaboracao: json['elaboracao'] as String?,
        assuntoID: json['assunto_id'] as String?,
        criadoEm: json['criado_em'] as String?,
        atualizadoEm: json['atualizado_em'] as String?,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['titulo'] = titulo;
    json['resumo'] = resumo;
    json['elaboracao'] = elaboracao;
    json['assunto_id'] = assuntoID;
    json['criado_em'] = criadoEm;
    json['atualizado_em'] = atualizadoEm;
    return json;
  }
}
