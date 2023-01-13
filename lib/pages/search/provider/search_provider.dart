import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:migoc2/pages/conteudo/models/conteudo_model.dart';
import 'package:migoc2/pages/search/services/search_service.dart';

class SearchProvider extends ChangeNotifier {
  bool _loading = false;
  SearchService service = SearchService();
  List<Conteudo> _conteudoList = [];
  bool _isEmpty = false;
  bool _isMathKeyboardEnabled = false;
  String _text = '';
  bool _keyboardIsVisible = false;

  bool get loading => _loading;
  List<Conteudo> get conteudoList => _conteudoList;
  bool get isEmpty => _isEmpty;
  bool get isMathKeyboardEnabled => _isMathKeyboardEnabled;
  String get text => _text;
  bool get keyboardIsVisible => _keyboardIsVisible;

  Future<void> setLoading({required bool loading}) async {
    _loading = loading;
    notifyListeners();
  }

  void setText(String text) {
    _text = text;
    notifyListeners();
  }

  // ignore: avoid_positional_boolean_parameters
  void setKeyboardIsVisible(bool value) {
    _keyboardIsVisible = value;
    notifyListeners();
  }

  void setConteudoListModel(List<Conteudo> conteudoListModel) {
    _conteudoList = conteudoListModel;
    notifyListeners();
  }

  void setIsMathKeyboardEnabled({required bool enabled}) {
    _isMathKeyboardEnabled = enabled;
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

  void cleanData() {
    _conteudoList.clear();
    setIsEmpty(isEmpty: false);
    notifyListeners();
  }
}
