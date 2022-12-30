import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:migoc2/pages/modulos/models/assunto_error.dart';
import 'package:migoc2/pages/modulos/models/modulos_model.dart';
import 'package:migoc2/pages/modulos/services/modulos_service.dart';
import 'package:migoc2/pages/modulos/widgets/item_model.dart';

class ModulosProvider extends ChangeNotifier {
  bool _loading = false;
  List<Modulo> _moduloList = [];
  ModuloError? _moduloError;
  ModulosService service = ModulosService();
  List<ItemModel> _listModulos = [];

  bool get loading => _loading;

  List<Modulo> get moduloList => _moduloList;

  ModuloError? get moduloError => _moduloError;

  List<ItemModel> get moduloModelList => _listModulos;

  Future<void> setLoading({required bool loading}) async {
    _loading = loading;
    notifyListeners();
  }

  void setModuloListModel(List<Modulo> moduloListModel) {
    _moduloList = moduloListModel;
    notifyListeners();
    setItemModel(moduloListModel);
  }

  void setModuloError(ModuloError subjectError) {
    _moduloError = subjectError;
    notifyListeners();
  }

  Future<void> getModulos() async {
    setLoading(loading: true);
    final response = await service.getModulos();
    if (response != null) {
      if (response.statusCode == 200) {
        List<Modulo> modulos;
        final responseData = response.body;
        modulos = (json.decode(responseData) as List)
            .map((i) => Modulo.fromJson(i as Map<String, dynamic>))
            .toList();
        modulos.sort((a, b) {
          return compareAsciiUpperCase(a.nome ?? "", b.nome ?? "");
        });
        setModuloListModel(modulos);
      }
      if (response.statusCode >= 400) {
        final ModuloError subjectError = ModuloError(
          code: response.statusCode,
          message: 'Não foi possível carregar',
        );
        setModuloError(subjectError);
      }
    } else {
      final ModuloError subjectError = ModuloError(
        code: 0,
        message:
            'Não foi possível carregar. Não há conexão disponível com a internet.',
      );
      setModuloError(subjectError);
    }
    setLoading(loading: false);
  }

  void setItemModel(List<Modulo> assuntos) {
    final List<ItemModel> listItemModel = [];
    for (var i = 0; i < assuntos.length; i++) {
      final contents = assuntos[i]
          .conteudos
          ?.map<String>((conteudo) => conteudo.nome!)
          .toList();
      // ignore: unused_local_variable
      final contentList = assuntos[i]
          .conteudos
          ?.map<Widget>(
            (conteudo) => Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {},
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
    _listModulos = listItemModel;
    notifyListeners();
  }

  void setExpandedData(int index) {
    _listModulos[index].expanded = !_listModulos[index].expanded;
    notifyListeners();
  }
}
