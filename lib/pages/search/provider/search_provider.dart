import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:migoc2/models/conteudo_model.dart';
import 'package:migoc2/pages/search/services/search_service.dart';

class SearchProvider extends ChangeNotifier {
  bool _loading = false;
  SearchService service = SearchService();
  List<Conteudo> _conteudoList = [];
  bool _isEmpty = false;

  bool get loading => _loading;
  List<Conteudo> get conteudoList => _conteudoList;
  bool get isEmpty => _isEmpty;

  Future<void> setLoading({required bool loading}) async {
    _loading = loading;
    notifyListeners();
  }

  void setConteudoListModel(List<Conteudo> conteudoListModel) {
    _conteudoList = conteudoListModel;
    notifyListeners();
  }

  void searchConteudo(String conteudo) {
    getSearchConteudos(conteudo);
  }

  void setIsEmpty({required bool isEmpty}) {
    _isEmpty = isEmpty;
    notifyListeners();
  }

  Future<void> getSearchConteudos(String conteudo) async {
    setLoading(loading: true);
    final response = await service.searchSubject(conteudo);
    if (response.statusCode == 200) {
      List<Conteudo> conteudos;
      final responseData = response.body;
      conteudos = (json.decode(responseData) as List)
          .map((i) => Conteudo.fromJson(i as Map<String, dynamic>))
          .toList();
      setIsEmpty(isEmpty: conteudos.isEmpty);
      setConteudoListModel(conteudos);
    }
    setLoading(loading: false);
  }
}
