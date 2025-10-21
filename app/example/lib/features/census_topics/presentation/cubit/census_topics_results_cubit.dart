import 'package:injectable/injectable.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class CensusTopicsResultsCubit extends BaseCubit<BaseState> {
  CensusTopicsResultsCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  String? _censusID;
  int _currentPage = 1;
  int _totalPages = 1;

  String? get censusID => _censusID;
  int get currentPage => _currentPage;
  int get totalPages => _totalPages;

  bool get canLoadData {
    return _censusID != null && _censusID!.trim().isNotEmpty;
  }

  String? get validationError {
    if (_censusID == null || _censusID!.trim().isEmpty) {
      return 'Census ID is required';
    }
    return null;
  }

  void initialize({required String censusID}) {
    _censusID = censusID;
    _currentPage = 1;
  }

  Future<void> loadData({int page = 1}) async {
    if (!canLoadData) {
      return;
    }

    emit(const LoadingState());

    try {
      final result = await _stadataFlutter.list.censusTopics(
        censusID: _censusID!,
      );

      _currentPage = page;
      _totalPages = result.pagination?.pages ?? 1;
      emit(LoadedState<List<CensusTopic>>(result.data));
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
