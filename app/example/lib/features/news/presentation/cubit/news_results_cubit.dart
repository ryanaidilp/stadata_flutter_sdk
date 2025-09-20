import 'package:injectable/injectable.dart';
import 'package:stadata_example/config/env.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/data/models/request_details.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class NewsResultsCubit extends BaseCubit<BaseState> {
  NewsResultsCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  // Search parameters
  String _currentDomain = '7200';
  DataLanguage _currentLanguage = DataLanguage.id;
  int _currentPage = 1;
  String? _keyword;
  String? _newsCategoryID;
  int? _month;
  int? _year;

  RequestDetails? _lastRequestDetails;

  // Getters
  String get currentDomain => _currentDomain;
  DataLanguage get currentLanguage => _currentLanguage;
  int get currentPage => _currentPage;
  String? get keyword => _keyword;
  String? get newsCategoryID => _newsCategoryID;
  int? get month => _month;
  int? get year => _year;
  RequestDetails? get lastRequestDetails => _lastRequestDetails;

  /// Check if all required parameters are valid
  bool get canLoadData {
    return _currentDomain.trim().isNotEmpty &&
        _currentDomain.trim().length >= 4;
  }

  /// Get validation error message
  String? get validationError {
    if (_currentDomain.trim().isEmpty) {
      return 'Domain is required';
    }
    if (_currentDomain.trim().length < 4) {
      return 'Domain must be at least 4 characters';
    }
    return null;
  }

  void initialize({
    required String domain,
    required DataLanguage language,
    String? keyword,
    String? newsCategoryID,
    int? month,
    int? year,
  }) {
    _currentDomain = domain;
    _currentLanguage = language;
    _keyword = keyword;
    _newsCategoryID = newsCategoryID;
    _month = month;
    _year = year;
    _currentPage = 1;

    // Auto-load data since user navigated here with intent to see results
    if (canLoadData) {
      loadData();
    } else {
      // Emit error state if parameters are invalid
      final error = validationError;
      if (error != null) {
        emit(ErrorState(error));
      }
    }
  }

  void setPage(int page) {
    _currentPage = page;
    // Page change requires manual load action
  }

  Future<void> loadData() async {
    if (!canLoadData) {
      return;
    }

    emit(const LoadingState());

    final stopwatch = Stopwatch()..start();

    try {
      // Build request details for tracking
      final parameters = <String, dynamic>{
        'domain': _currentDomain,
        'lang': _currentLanguage.value,
        'page': _currentPage,
        if (_keyword != null) 'keyword': _keyword,
        if (_newsCategoryID != null) 'newsCategoryID': _newsCategoryID,
        if (_month != null) 'month': _month,
        if (_year != null) 'year': _year,
        'key': Env.apiKey,
      };

      const baseUrl = 'https://webapi.bps.go.id/v1/api/list/news';
      final queryParams = parameters.entries
          .map((e) => '${e.key}=${e.value}')
          .join('&');
      final fullUrl = '$baseUrl?$queryParams';

      final result = await _stadataFlutter.list.news(
        domain: _currentDomain,
        lang: _currentLanguage,
        page: _currentPage,
        keyword: _keyword,
        newsCategoryID: _newsCategoryID,
        month: _month,
        year: _year,
      );

      stopwatch.stop();

      // Store request details
      _lastRequestDetails = RequestDetails(
        url: fullUrl,
        method: 'GET',
        parameters: parameters,
        responseTime: stopwatch.elapsed,
      );

      emit(LoadedState<List<News>>(result.data));
    } catch (error) {
      stopwatch.stop();
      emit(ErrorState(error.toString()));
    }
  }

  Future<void> refresh() async {
    await loadData();
  }

  void nextPage() {
    setPage(_currentPage + 1);
    loadData(); // Explicit load when user clicks next
  }

  void previousPage() {
    if (_currentPage > 1) {
      setPage(_currentPage - 1);
      loadData(); // Explicit load when user clicks previous
    }
  }
}
