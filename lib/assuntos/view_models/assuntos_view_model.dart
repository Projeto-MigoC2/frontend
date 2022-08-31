import 'package:flutter/material.dart';
import 'package:migoc2/assuntos/models/assuntos_list_model.dart';
import 'package:migoc2/assuntos/models/assunto_error.dart';
import 'package:migoc2/assuntos/services/api_status.dart';
import 'package:migoc2/assuntos/services/assuntos_service.dart';

class AssuntosViewModel extends ChangeNotifier {
  bool _loading = false;
  List<AssuntosModel> _assuntosListModel = [];
  AssuntoError? _assuntoError;

  bool get loading => _loading;
  List<AssuntosModel> get assuntosListModel => _assuntosListModel;
  AssuntoError? get assuntoError => _assuntoError;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setAssuntosListModel(List<AssuntosModel> assuntoListModel) {
    _assuntosListModel = assuntoListModel;
  }

  setAssuntosError(AssuntoError assuntoError) {
    _assuntoError = assuntoError;
  }

  getUsers() async {
    setLoading(true);
    var response = await AssuntosService.getUsers();
    if(response is Success) {
      setAssuntosListModel(response.response as List<AssuntosModel>);
    }
    if(response is Failure) {
      AssuntoError assuntoError = AssuntoError(
        code: response.code,
        message: response.errorResponse,
      );
      setAssuntosError(assuntoError);
    }
    setLoading(false);
  }
}