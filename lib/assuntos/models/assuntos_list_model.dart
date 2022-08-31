// To parse this JSON data, do
//
//     final assuntosModel = assuntosModelFromJson(jsonString);

import 'dart:convert';

List<AssuntosModel> assuntosModelFromJson(String str) => List<AssuntosModel>.from(json.decode(str).map((x) => AssuntosModel.fromJson(x)));

String assuntosModelToJson(List<AssuntosModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AssuntosModel {
  AssuntosModel({
    required this.titulo,
  });

  String titulo;

  factory AssuntosModel.fromJson(Map<String, dynamic> json) => AssuntosModel(
    titulo: json["titulo"],
  );

  Map<String, dynamic> toJson() => {
    "titulo": titulo,
  };
}
