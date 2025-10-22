import 'package:injectable/injectable.dart';
import 'package:stadata_example/core/validators/validators.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class UnitsCubit extends BaseCubit<BaseState> {
  UnitsCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  String? _domain = '7200';
  DataLanguage _currentLanguage = DataLanguage.id;
  int _currentPage = 1;
  int _totalPages = 1;
  int? _variableID;
  List<UnitData> _units = [];

  String? get domain => _domain;
  DataLanguage get currentLanguage => _currentLanguage;
  int get currentPage => _currentPage;
  int get totalPages => _totalPages;
  int? get variableID => _variableID;
  List<UnitData> get units => _units;

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

  void setDomain(String? domain) {
    _domain = domain;
    _currentPage = 1;
    _totalPages = 1;
    _units = [];
    emit(const InitialState());
  }

  void changeLanguage(DataLanguage language) {
    _currentLanguage = language;
    _currentPage = 1;
    emit(const InitialState());
  }

  void setVariableID(int? variableID) {
    _variableID = variableID;
    emit(const InitialState());
  }

  Future<void> loadData({int? page}) async {
    if (!canLoadData) {
      return;
    }

    final targetPage = page ?? _currentPage;
    emit(const LoadingState());

    try {
      final result = await _stadataFlutter.list.units(
        domain: _domain!,
        lang: _currentLanguage,
        page: targetPage,
        variableID: _variableID,
      );

      _units = result.data;
      _totalPages = result.pagination?.pages ?? 1;
      _currentPage = targetPage;

      emit(LoadedState<List<UnitData>>(_units));
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

  /// Fetch variables with pagination support for SearchableDropdown
  /// Returns the exact list from API without client-side filtering
  /// to ensure proper pagination (package uses item count to detect last page)
  Future<List<Variable>> fetchVariables({
    required int page,
    String? searchText,
  }) async {
    if (!DomainValidator.isValid(_domain)) {
      return [];
    }

    try {
      final result = await _stadataFlutter.list.variables(
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
