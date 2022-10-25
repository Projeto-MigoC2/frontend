class Assunto {
  String? id;
  String? titulo;

  Assunto({
    this.id,
    this.titulo,
  });

  factory Assunto.fromJson(Map<String, dynamic> json) => Assunto(
        id: json["id"] as String?,
        titulo: json["titulo"] as String?,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['titulo'] = titulo;
    return json;
  }
}
