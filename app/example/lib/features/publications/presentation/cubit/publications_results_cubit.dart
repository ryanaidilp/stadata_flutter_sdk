import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:stadata_example/config/env.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/data/models/request_details.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class PublicationsResultsCubit extends BaseCubit<BaseState> {
  PublicationsResultsCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  // Search parameters
  String? _domain;
  DataLanguage _currentLanguage = DataLanguage.id;
  String? _keyword;
  int? _month;
  int? _year;
  int _currentPage = 1;

  RequestDetails? _lastRequestDetails;

  // Getters
  String? get domain => _domain;
  DataLanguage get currentLanguage => _currentLanguage;
  String? get keyword => _keyword;
  int? get month => _month;
  int? get year => _year;
  int get currentPage => _currentPage;
  RequestDetails? get lastRequestDetails => _lastRequestDetails;

  /// Check if all required parameters are valid
  bool get canLoadData {
    return _domain != null && _domain!.trim().isNotEmpty;
  }

  /// Get validation error message
  String? get validationError {
    if (_domain == null || _domain!.trim().isEmpty) {
      // Note: For simplicity, we're using a hardcoded message here
      // In a production app, you'd want to inject a translation service
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

    // Don't emit any states during initialization to avoid layout issues
    // The page will show initial state and user can manually trigger loading
  }

  Future<void> loadData({int page = 1}) async {
    if (!canLoadData) {
      return;
    }

    emit(const LoadingState());

    final stopwatch = Stopwatch()..start();

    try {
      // Build request details for tracking
      final parameters = <String, dynamic>{
        'domain': _domain,
        'lang': _currentLanguage.value,
        'page': page,
        if (_keyword != null) 'keyword': _keyword,
        if (_month != null) 'month': _month,
        if (_year != null) 'year': _year,
        'key': Env.apiKey,
      };

      const baseUrl = 'https://webapi.bps.go.id/v1/api/list/publication';
      final queryParams = parameters.entries
          .map((e) => '${e.key}=${e.value}')
          .join('&');
      final fullUrl = '$baseUrl?$queryParams';

      final result = await _stadataFlutter.list.publications(
        domain: _domain!,
        lang: _currentLanguage,
        page: page,
        keyword: _keyword,
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

      _currentPage = page;
      emit(LoadedState<List<Publication>>(result.data));
    } on Exception catch (error) {
      stopwatch.stop();
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
