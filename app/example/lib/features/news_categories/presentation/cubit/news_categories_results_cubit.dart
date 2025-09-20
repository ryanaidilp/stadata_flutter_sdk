import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';
import 'package:stadata_example/config/env.dart';
import 'package:stadata_example/shared/data/models/request_details.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';

@injectable
class NewsCategoriesResultsCubit extends BaseCubit<BaseState> {
  NewsCategoriesResultsCubit(this._stadataFlutter)
    : super(const InitialState());

  final StadataFlutter _stadataFlutter;
  String _currentDomain = '';
  DataLanguage _currentLanguage = DataLanguage.id;
  RequestDetails? _lastRequestDetails;

  String get currentDomain => _currentDomain;
  DataLanguage get currentLanguage => _currentLanguage;
  RequestDetails? get lastRequestDetails => _lastRequestDetails;

  void initialize({required String domain, required DataLanguage language}) {
    _currentDomain = domain;
    _currentLanguage = language;

    // Auto-load data when initialized with parameters
    loadData();
  }

  Future<void> loadData() async {
    emit(const LoadingState());

    final stopwatch = Stopwatch()..start();

    try {
      // Build request details for tracking
      final parameters = <String, dynamic>{
        'domain': _currentDomain,
        'lang': _currentLanguage.value,
        'key': Env.apiKey,
      };

      final baseUrl = 'https://webapi.bps.go.id/v1/api/list/newscategory';
      final queryParams = parameters.entries
          .map((e) => '${e.key}=${e.value}')
          .join('&');
      final fullUrl = '$baseUrl?$queryParams';

      final result = await _stadataFlutter.list.newsCategories(
        domain: _currentDomain,
        lang: _currentLanguage,
      );

      stopwatch.stop();

      // Store request details
      _lastRequestDetails = RequestDetails(
        url: fullUrl,
        method: 'GET',
        parameters: parameters,
        responseTime: stopwatch.elapsed,
      );

      emit(LoadedState<List<NewsCategory>>(result.data));
    } catch (error) {
      stopwatch.stop();
      emit(ErrorState(error.toString()));
    }
  }

  Future<void> refresh() async {
    await loadData();
  }
}
