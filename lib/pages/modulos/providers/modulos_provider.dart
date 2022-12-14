import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:migoc2/pages/modulos/models/assunto_error.dart';
import 'package:migoc2/pages/modulos/models/modulos_model.dart';
import 'package:migoc2/pages/modulos/services/modulos_service.dart';
import 'package:migoc2/pages/modulos/widgets/item_model.dart';

class ModulosProvider extends ChangeNotifier {
  bool _loading = false;
  List<Modulo> _assuntoList = [];
  AssuntoError? _assuntoError;
  ModulosService service = ModulosService();
  List<ItemModel> _listAssuntos = [];

  bool get loading => _loading;

  List<Modulo> get assuntoList => _assuntoList;

  AssuntoError? get assuntoError => _assuntoError;

  List<ItemModel> get assuntoModelList => _listAssuntos;

  Future<void> setLoading({required bool loading}) async {
    _loading = loading;
    notifyListeners();
  }

  void setAssuntoListModel(List<Modulo> assuntoListModel) {
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
    final response = await service.getModulos();
    if (response != null) {
      if (response.statusCode == 200) {
        List<Modulo> assuntos;
        final responseData = response.body;
        assuntos = (json.decode(responseData) as List)
            .map((i) => Modulo.fromJson(i as Map<String, dynamic>))
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

  void setItemModel(List<Modulo> assuntos) {
    final List<ItemModel> listItemModel = [];
    for (var i = 0; i < assuntos.length; i++) {
      final contents = assuntos[i].conteudos?.map<String>((conteudo) => conteudo.nome!).toList();
      // ignore: unused_local_variable
      final contentList = assuntos[i]
          .conteudos
          ?.map<Widget>(
            (conteudo) => Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: (){},
                child: Text(
                    conteudo.nome!,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
          .toList();
      listItemModel.add(
        ItemModel(
            headerItem: assuntos[i].nome ?? '',
            itens: contents!,
            ),
      );
    }
    _listAssuntos = listItemModel;
    notifyListeners();
  }

  void setExpandedData(int index) {
    // ignore: avoid_print
    print(index);
    _listAssuntos[index].expanded = !_listAssuntos[index].expanded;
    // ignore: avoid_print
    print(_listAssuntos[index].headerItem);
    notifyListeners();
  }
}
