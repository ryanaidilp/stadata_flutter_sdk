import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class PressReleasesResultsCubit extends BaseCubit<BaseState> {
  PressReleasesResultsCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  String? _domain;
  DataLanguage _currentLanguage = DataLanguage.id;
  String? _keyword;
  int? _month;
  int? _year;
  int _currentPage = 1;

  String? get domain => _domain;
  DataLanguage get currentLanguage => _currentLanguage;
  String? get keyword => _keyword;
  int? get month => _month;
  int? get year => _year;
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
    String? keyword,
    int? month,
    int? year,
  }) {
    _domain = domain;
    _currentLanguage = language;
    _keyword = keyword;
    _month = month;
    _year = year;
    _currentPage = 1;
  }

  Future<void> loadData({int page = 1}) async {
    if (!canLoadData) {
      return;
    }

    emit(const LoadingState());

    try {
      final result = await _stadataFlutter.list.pressReleases(
        domain: _domain!,
        lang: _currentLanguage,
        page: page,
        keyword: _keyword,
        month: _month,
        year: _year,
      );

      _currentPage = page;
      emit(LoadedState<List<PressRelease>>(result.data));
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
