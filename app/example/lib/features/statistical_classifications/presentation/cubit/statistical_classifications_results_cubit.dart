import 'package:injectable/injectable.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class StatisticalClassificationsResultsCubit extends BaseCubit<BaseState> {
  StatisticalClassificationsResultsCubit(this._stadataFlutter)
    : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  ClassificationType _type = KBLIType.y2020;
  ClassificationLevel? _level;
  DataLanguage _currentLanguage = DataLanguage.id;
  int _currentPage = 1;

  ClassificationType get type => _type;
  ClassificationLevel? get level => _level;
  DataLanguage get currentLanguage => _currentLanguage;
  int get currentPage => _currentPage;

  bool get canLoadData {
    return true; // Type is always available
  }

  void initialize({
    required ClassificationType type,
    required DataLanguage language,
    ClassificationLevel? level,
  }) {
    _type = type;
    _currentLanguage = language;
    _level = level;
    _currentPage = 1;
  }

  Future<void> loadData({int page = 1}) async {
    if (!canLoadData) {
      return;
    }

    emit(const LoadingState());

    try {
      final result = await _stadataFlutter.list.statisticClassifications(
        type: _type,
        level: _level,
        lang: _currentLanguage,
        page: page,
      );

      _currentPage = page;
      emit(LoadedState<List<StatisticClassification>>(result.data));
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
