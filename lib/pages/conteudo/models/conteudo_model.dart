class Conteudo {
  String? id;
  String? nome;
  String? corpo;

  Conteudo({
    this.id,
    this.nome,
    this.corpo,
  });

  factory Conteudo.fromJson(Map<String, dynamic> json) => Conteudo(
    id: json["id"] as String?,
    nome: json["nome"] as String?,
    corpo: json["corpo"] as String?,
  );
}