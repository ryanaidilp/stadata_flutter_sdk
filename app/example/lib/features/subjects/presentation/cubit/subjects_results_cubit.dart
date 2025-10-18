import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class SubjectsResultsCubit extends BaseCubit<BaseState> {
  SubjectsResultsCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  String? _domain;
  DataLanguage _currentLanguage = DataLanguage.id;
  int? _subjectCategoryID;
  int _currentPage = 1;

  String? get domain => _domain;
  DataLanguage get currentLanguage => _currentLanguage;
  int? get subjectCategoryID => _subjectCategoryID;
  int get currentPage => _currentPage;

  bool get canLoadData {
    return _domain != null && _domain!.trim().isNotEmpty;
  }

  String? get validationError {
    if (_domain == null || _domain!.trim().isEmpty) {
      return 'Domain is required';
    }
    return null;
  }

  void initialize({
    required String domain,
    required DataLanguage language,
    int? subjectCategoryID,
  }) {
    _domain = domain;
    _currentLanguage = language;
    _subjectCategoryID = subjectCategoryID;
    _currentPage = 1;
  }

  Future<void> loadData({int page = 1}) async {
    if (!canLoadData) {
      return;
    }

    emit(const LoadingState());

    try {
      final result = await _stadataFlutter.list.subjects(
        domain: _domain!,
        lang: _currentLanguage,
        subjectCategoryID: _subjectCategoryID,
      );

      _currentPage = page;
      emit(LoadedState<List<Subject>>(result.data));
    } on Exception catch (error) {
      emit(ErrorState(error.toString()));
    }
  }

  Future<void> loadNextPage() async {
    final nextPage = _currentPage + 1;
    await loadData(page: nextPage);
  }

  Future<void> loadPreviousPage() async {
    if (_currentPage > 1) {
      final previousPage = _currentPage - 1;
      await loadData(page: previousPage);
    }
  }

  Future<void> refresh() async {
    await loadData(page: _currentPage);
  }
}
