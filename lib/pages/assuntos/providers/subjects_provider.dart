import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:migoc2/pages/assuntos/models/assunto_error.dart';
import 'package:migoc2/pages/assuntos/models/assunto_model.dart';
import 'package:migoc2/pages/assuntos/services/assuntos_service.dart';
import 'package:migoc2/pages/assuntos/widgets/item_model.dart';

class SubjectsProvider extends ChangeNotifier {
  bool _loading = false;
  List<Assunto> _assuntoList = [];
  AssuntoError? _assuntoError;
  AssuntoService service = AssuntoService();
  List<ItemModel> _listAssuntos = [];

  bool get loading => _loading;
  List<Assunto> get assuntoList => _assuntoList;
  AssuntoError? get assuntoError => _assuntoError;
  List<ItemModel> get assuntoModelList => _listAssuntos;

  Future<void> setLoading({required bool loading}) async {
    _loading = loading;
    notifyListeners();
  }

  void setAssuntoListModel(List<Assunto> assuntoListModel) {
    _assuntoList = assuntoListModel;
    notifyListeners();
    setItemModel(assuntoListModel);
  }

  void setAssuntoError(AssuntoError subjectError) {
    _assuntoError = subjectError;
    notifyListeners();
  }

  Future<void> getAssuntos() async {
    setLoading(loading: true);
    final response = await service.getAssuntos();
    if (response != null) {
      if (response.statusCode == 200) {
        List<Assunto> assuntos;
        final responseData = response.body;
        assuntos = (json.decode(responseData) as List)
            .map((i) => Assunto.fromJson(i as Map<String, dynamic>))
            .toList();
        setAssuntoListModel(assuntos);
      }
      if (response.statusCode >= 400) {
        final AssuntoError subjectError = AssuntoError(
          code: response.statusCode,
          message: 'Não foi possível carregar',
        );
        setAssuntoError(subjectError);
      }
    } else {
      final AssuntoError subjectError = AssuntoError(
        code: 0,
        message:
            'Não foi possível carregar. Não há conexão disponível com a internet.',
      );
      setAssuntoError(subjectError);
    }
    setLoading(loading: false);
  }

  void setItemModel(List<Assunto> assuntos) {
    final List<ItemModel> listItemModel = [];
    for (var i = 0; i < assuntos.length; i++) {
      listItemModel.add(
        ItemModel(headerItem: assuntos[i].titulo ?? '', itens: Column()),
      );
    }
    _listAssuntos = listItemModel;
    notifyListeners();
  }
}
