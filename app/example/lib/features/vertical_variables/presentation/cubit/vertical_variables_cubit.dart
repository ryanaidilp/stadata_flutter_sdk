import 'package:injectable/injectable.dart';
import 'package:stadata_example/core/validators/validators.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class VerticalVariablesCubit extends BaseCubit<BaseState> {
  VerticalVariablesCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  String? _domain = '7200';
  DataLanguage _currentLanguage = DataLanguage.id;
  int _currentPage = 1;
  int _totalPages = 1;
  int? _variableID;
  List<VerticalVariable> _verticalVariables = [];

  String? get domain => _domain;
  DataLanguage get currentLanguage => _currentLanguage;
  int get currentPage => _currentPage;
  int get totalPages => _totalPages;
  int? get variableID => _variableID;
  List<VerticalVariable> get verticalVariables => _verticalVariables;

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
    _verticalVariables = [];
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
      final result = await _stadataFlutter.list.verticalVariables(
        domain: _domain!,
        lang: _currentLanguage,
        page: targetPage,
        variableID: _variableID,
      );

      _verticalVariables = result.data;
      _totalPages = result.pagination?.pages ?? 1;
      _currentPage = targetPage;

      emit(LoadedState<List<VerticalVariable>>(_verticalVariables));
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
