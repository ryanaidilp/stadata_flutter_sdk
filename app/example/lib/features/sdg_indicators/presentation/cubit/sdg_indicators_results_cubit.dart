import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:stadata_example/config/env.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/data/models/request_details.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class SdgIndicatorsResultsCubit extends BaseCubit<BaseState> {
  SdgIndicatorsResultsCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;
  String _currentDomain = '0000';
  DataLanguage _currentLanguage = DataLanguage.id;
  int _currentPage = 1;
  int _totalPages = 1;
  SdgGoalNumber _currentGoal = SdgGoalNumber.noPoverty;
  RequestDetails? _lastRequestDetails;

  String get currentDomain => _currentDomain;
  DataLanguage get currentLanguage => _currentLanguage;
  int get currentPage => _currentPage;
  int get totalPages => _totalPages;
  SdgGoalNumber get currentGoal => _currentGoal;
  RequestDetails? get lastRequestDetails => _lastRequestDetails;

  bool get canLoadData =>
      _currentDomain.trim().isNotEmpty && _currentDomain.trim().length >= 4;

  void initialize({
    required String domain,
    required DataLanguage language,
    required SdgGoalNumber goal,
  }) {
    _currentDomain = domain;
    _currentLanguage = language;
    _currentGoal = goal;
    _currentPage = 1;

    if (canLoadData) {
      unawaited(loadData());
    } else {
      emit(const ErrorState('Domain is required'));
    }
  }

  int get page => _currentPage;
  set page(int value) {
    final page = value;
    _currentPage = page;
  }

  Future<void> loadData() async {
    if (!canLoadData) return;

    emit(const LoadingState());

    final stopwatch = Stopwatch()..start();

    try {
      final parameters = <String, dynamic>{
        'domain': _currentDomain,
        'goal': _currentGoal.value,
        'lang': _currentLanguage.value,
        'page': _currentPage,
        'key': Env.apiKey,
      };

      const baseUrl = 'https://webapi.bps.go.id/v1/api/list/model/sdgs';
      final queryParams = parameters.entries
          .map((e) => '${e.key}=${e.value}')
          .join('&');
      final fullUrl = '$baseUrl?$queryParams';

      final result = await _stadataFlutter.list.sdgIndicators(
        domain: _currentDomain,
        goal: _currentGoal,
        lang: _currentLanguage,
        page: _currentPage,
      );

      stopwatch.stop();

      _lastRequestDetails = RequestDetails(
        url: fullUrl,
        method: 'GET',
        parameters: parameters,
        responseTime: stopwatch.elapsed,
      );

      _totalPages = result.pagination?.pages ?? 1;
      emit(LoadedState<List<SdgIndicator>>(result.data));
    } on Exception catch (error) {
      stopwatch.stop();
      emit(ErrorState(error.toString()));
    }
  }

  Future<void> refresh() async => loadData();

  void nextPage() {
    page = _currentPage + 1;
    unawaited(loadData());
  }

  void previousPage() {
    if (_currentPage > 1) {
      page = _currentPage - 1;
      unawaited(loadData());
    }
  }
}
