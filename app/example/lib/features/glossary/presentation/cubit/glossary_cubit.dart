import 'package:injectable/injectable.dart';
import 'package:stadata_example/config/env.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/data/models/request_details.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class GlossaryCubit extends BaseCubit<BaseState> {
  GlossaryCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;
  String _currentDomain = '0000';
  DataLanguage _currentLanguage = DataLanguage.id;
  int _currentPage = 1;
  String? _keyword;
  String? _prefix;
  RequestDetails? _lastRequestDetails;

  String get currentDomain => _currentDomain;
  DataLanguage get currentLanguage => _currentLanguage;
  int get currentPage => _currentPage;
  String? get keyword => _keyword;
  String? get prefix => _prefix;
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

  void setKeyword(String? keyword) {
    _keyword = keyword?.trim().isEmpty ?? true ? null : keyword?.trim();
    _currentPage = 1;
  }

  void setPrefix(String? prefix) {
    _prefix = prefix;
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
        'lang': _currentLanguage.value,
        'page': _currentPage,
        if (_keyword != null) 'keyword': _keyword,
        if (_prefix != null) 'prefix': _prefix,
        'key': Env.apiKey,
      };

      const baseUrl = 'https://webapi.bps.go.id/v1/api/list/model/glossary';
      final queryParams = parameters.entries
          .map((e) => '${e.key}=${e.value}')
          .join('&');
      final fullUrl = '$baseUrl?$queryParams';

      final result = await _stadataFlutter.list.glossary(
        domain: _currentDomain,
        lang: _currentLanguage,
        page: _currentPage,
        keyword: _keyword,
        prefix: _prefix,
      );

      stopwatch.stop();

      _lastRequestDetails = RequestDetails(
        url: fullUrl,
        method: 'GET',
        parameters: parameters,
        responseTime: stopwatch.elapsed,
      );

      emit(LoadedState<List<Glossary>>(result.data));
    } on Exception catch (error) {
      stopwatch.stop();
      emit(ErrorState(error.toString()));
    }
  }

  Future<void> refresh() async => loadData();
}
