import 'dart:convert';

List<SubjectModel> subjectsModelFromJson(String str) => (json.decode(str) as List).map((x) => SubjectModel.fromJson(x as Map<String, dynamic>)).toList();

class SubjectModel {
  SubjectModel({
    required this.title,
  });

  String title;

  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel (
    title: json['titulo'] as String,
    );
}
