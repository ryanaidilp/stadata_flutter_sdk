import 'package:injectable/injectable.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class SubjectCategoriesResultsCubit extends BaseCubit<BaseState> {
  SubjectCategoriesResultsCubit(this._stadataFlutter)
    : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  String? _domain;
  DataLanguage _currentLanguage = DataLanguage.id;
  int _currentPage = 1;

  String? get domain => _domain;
  DataLanguage get currentLanguage => _currentLanguage;
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

  void initialize({required String domain, required DataLanguage language}) {
    _domain = domain;
    _currentLanguage = language;
    _currentPage = 1;
  }

  Future<void> loadData({int page = 1}) async {
    if (!canLoadData) {
      return;
    }

    emit(const LoadingState());

    try {
      final result = await _stadataFlutter.list.subjectCategories(
        domain: _domain!,
        lang: _currentLanguage,
        page: page,
      );

      _currentPage = page;
      emit(LoadedState<List<SubjectCategory>>(result.data));
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
