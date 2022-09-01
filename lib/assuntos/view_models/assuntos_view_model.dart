import 'package:flutter/material.dart';
import 'package:migoc2/assuntos/models/assunto_error.dart';
import 'package:migoc2/assuntos/models/assuntos_list_model.dart';
import 'package:migoc2/assuntos/services/api_status.dart';
import 'package:migoc2/assuntos/services/assuntos_service.dart';

class AssuntosViewModel extends ChangeNotifier {
  bool _loading = false;
  List<AssuntosModel> _assuntosListModel = [];
  AssuntoError? _assuntoError;
  AssuntosService service = AssuntosService();

  bool get loading => _loading;
  List<AssuntosModel> get assuntosListModel => _assuntosListModel;
  AssuntoError? get assuntoError => _assuntoError;

  Future<void> setLoading({required bool loading}) async {
    _loading = loading;
    notifyListeners();
  }

  void setAssuntosListModel(List<AssuntosModel> assuntoListModel) {
    _assuntosListModel = assuntoListModel;
  }

  void setAssuntosError(AssuntoError assuntoError) {
    _assuntoError = assuntoError;
  }

  Future<void> getUsers() async {
    setLoading(loading: true);
    final response = await service.getUsers();
    if(response is Success) {
      setAssuntosListModel(response.response as List<AssuntosModel>);
    }
    if(response is Failure) {
      final AssuntoError assuntoError = AssuntoError(
        code: response.code,
        message: response.errorResponse,
      );
      setAssuntosError(assuntoError);
    }
    setLoading(loading: false);
  }
}
