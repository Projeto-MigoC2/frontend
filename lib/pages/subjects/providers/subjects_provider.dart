import 'package:flutter/material.dart';
import 'package:migoc2/pages/subjects/models/subject_error.dart';
import 'package:migoc2/pages/subjects/models/subjects_list_model.dart';
import 'package:migoc2/pages/subjects/services/api_status.dart';
import 'package:migoc2/pages/subjects/services/subjects_service.dart';

class SubjectsProvider extends ChangeNotifier {
  bool _loading = false;
  List<SubjectModel> _subjectsListModel = [];
  SubjectError? _subjectError;
  SubjectsService service = SubjectsService();

  bool get loading => _loading;
  List<SubjectModel> get subjectsListModel => _subjectsListModel;
  SubjectError? get subjectError => _subjectError;

  Future<void> setLoading({required bool loading}) async {
    _loading = loading;
    notifyListeners();
  }

  void setSubjectsListModel(List<SubjectModel> subjectsListModel) {
    _subjectsListModel = subjectsListModel;
  }

  void setSubjectsError(SubjectError subjectError) {
    _subjectError = subjectError;
  }

  Future<void> getUsers() async {
    setLoading(loading: true);
    final response = await service.getUsers();
    if(response is Success) {
      setSubjectsListModel(response.response as List<SubjectModel>);
    }
    if(response is Failure) {
      final SubjectError subjectError = SubjectError(
        code: response.code,
        message: response.errorResponse,
      );
      setSubjectsError(subjectError);
    }
    setLoading(loading: false);
  }
}

