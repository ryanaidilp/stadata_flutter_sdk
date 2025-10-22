import 'package:injectable/injectable.dart';
import 'package:stadata_example/core/validators/validators.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class VariablesCubit extends BaseCubit<BaseState> {
  VariablesCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  String? _domain = '7200';
  DataLanguage _currentLanguage = DataLanguage.id;
  int _currentPage = 1;
  int _totalPages = 1;
  bool _showExistingVariables = false;
  int? _year;
  int? _subjectID;
  List<Variable> _variables = [];

  String? get domain => _domain;
  DataLanguage get currentLanguage => _currentLanguage;
  int get currentPage => _currentPage;
  int get totalPages => _totalPages;
  bool get showExistingVariables => _showExistingVariables;
  int? get year => _year;
  int? get subjectID => _subjectID;
  List<Variable> get variables => _variables;

  bool get canLoadData {
    return DomainValidator.isValid(_domain);
  }

  String? get validationError {
    return DomainValidator.validate(_domain);
  }

  bool get hasNextPage {
    return _currentPage < _totalPages;
  }

  bool get hasPreviousPage {
    return _currentPage > 1;
  }

  void initialize() {
    // No need to pre-load subjects, SearchableDropdown handles pagination
  }

  void setDomain(String? domain) {
    _domain = domain;
    _currentPage = 1;
    _totalPages = 1;
    _variables = [];
    _subjectID = null;
    emit(const InitialState());
  }

  void changeLanguage(DataLanguage language) {
    _currentLanguage = language;
    _currentPage = 1;
    emit(const InitialState());
  }

  void setShowExistingVariables(bool value) {
    _showExistingVariables = value;
    emit(const InitialState());
  }

  void setYear(int? year) {
    _year = year;
    emit(const InitialState());
  }

  void setSubjectID(int? subjectID) {
    _subjectID = subjectID;
    emit(const InitialState());
  }

  Future<void> loadData({int? page}) async {
    if (!canLoadData) {
      return;
    }

    final targetPage = page ?? _currentPage;
    emit(const LoadingState());

    try {
      final result = await _stadataFlutter.list.variables(
        domain: _domain!,
        lang: _currentLanguage,
        page: targetPage,
        showExistingVariables: _showExistingVariables,
        year: _year,
        subjectID: _subjectID,
      );

      _variables = result.data;
      _totalPages = result.pagination?.pages ?? 1;
      _currentPage = targetPage;

      emit(LoadedState<List<Variable>>(_variables));
    } on Exception catch (error) {
      emit(ErrorState(error.toString()));
    }
  }

  Future<void> nextPage() async {
    if (hasNextPage) {
      await loadData(page: _currentPage + 1);
    }
  }

  Future<void> previousPage() async {
    if (hasPreviousPage) {
      await loadData(page: _currentPage - 1);
    }
  }

  Future<void> refresh() async {
    await loadData(page: _currentPage);
  }

  /// Fetch subjects with pagination support for SearchableDropdown
  /// Returns the exact list from API without client-side filtering
  /// to ensure proper pagination (package uses item count to detect last page)
  Future<List<Subject>> fetchSubjects({
    required int page,
    String? searchText,
  }) async {
    if (!DomainValidator.isValid(_domain)) {
      return [];
    }

    try {
      final result = await _stadataFlutter.list.subjects(
        domain: _domain!,
        lang: _currentLanguage,
        page: page,
      );

      // The searchable_paginated_dropdown package determines the last page
      // by checking if returned items < requestItemCount (10).
      if (result.pagination != null) {
        final pagination = result.pagination!;

        // If requesting a page beyond available pages, return empty
        if (page > pagination.pages) {
          return [];
        }

        // If on last page with exactly 10 items, remove one to signal last page
        if (page == pagination.pages && result.data.length == 10) {
          return result.data.take(9).toList();
        }
      }

      return result.data;
    } catch (error) {
      return [];
    }
  }
}
