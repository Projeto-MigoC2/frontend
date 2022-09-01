import 'dart:convert';

List<AssuntosModel> assuntosModelFromJson(String str) => (json.decode(str) as List).map((x) => AssuntosModel.fromJson(x as Map<String, dynamic>)).toList();

class AssuntosModel {
  AssuntosModel({
    required this.titulo,
  });

  String titulo;

  factory AssuntosModel.fromJson(Map<String, dynamic> json) => AssuntosModel (
    titulo: json['titulo'] as String,
    );

}
