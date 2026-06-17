import 'package:injectable/injectable.dart';
import 'package:stadata_example/config/env.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/data/models/request_details.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class SdgIndicatorsCubit extends BaseCubit<BaseState> {
  SdgIndicatorsCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;
  String _currentDomain = '0000';
  DataLanguage _currentLanguage = DataLanguage.id;
  int _currentPage = 1;
  SdgGoalNumber _currentGoal = SdgGoalNumber.noPoverty;
  RequestDetails? _lastRequestDetails;

  String get currentDomain => _currentDomain;
  DataLanguage get currentLanguage => _currentLanguage;
  int get currentPage => _currentPage;
  SdgGoalNumber get currentGoal => _currentGoal;
  RequestDetails? get lastRequestDetails => _lastRequestDetails;

  bool get canLoadData =>
      _currentDomain.trim().isNotEmpty && _currentDomain.trim().length >= 4;

  void changeDomain(String domain) {
    _currentDomain = domain;
    _currentPage = 1;
  }

  void changeLanguage(DataLanguage language) {
    _currentLanguage = language;
    _currentPage = 1;
  }

  void setGoal(SdgGoalNumber goal) {
    _currentGoal = goal;
    _currentPage = 1;
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

      emit(LoadedState<List<SdgIndicator>>(result.data));
    } on Exception catch (error) {
      stopwatch.stop();
      emit(ErrorState(error.toString()));
    }
  }

  Future<void> refresh() async => loadData();
}
