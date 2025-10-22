import 'package:injectable/injectable.dart';
import 'package:stadata_example/core/validators/validators.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class VariablesCubit extends BaseCubit<BaseState> {
  VariablesCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  String? _domain;
  DataLanguage _currentLanguage = DataLanguage.id;
  int _currentPage = 1;
  int _totalPages = 1;
  List<Variable> _variables = [];

  String? get domain => _domain;
  DataLanguage get currentLanguage => _currentLanguage;
  int get currentPage => _currentPage;
  int get totalPages => _totalPages;
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
    // Initialize with empty state
  }

  void setDomain(String? domain) {
    _domain = domain;
    _currentPage = 1;
    _totalPages = 1;
    _variables = [];
    emit(const InitialState());
  }

  void changeLanguage(DataLanguage language) {
    _currentLanguage = language;
    _currentPage = 1;
    if (canLoadData) {
      loadData();
    }
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
}
