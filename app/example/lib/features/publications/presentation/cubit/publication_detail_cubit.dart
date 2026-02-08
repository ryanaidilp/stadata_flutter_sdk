import 'package:injectable/injectable.dart';
import 'package:stadata_example/config/env.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/data/models/request_details.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class PublicationDetailCubit extends BaseCubit<BaseState> {
  PublicationDetailCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;
  DataLanguage _currentLanguage = DataLanguage.id;
  String _currentDomain = '7200';
  RequestDetails? _lastRequestDetails;

  DataLanguage get currentLanguage => _currentLanguage;
  String get currentDomain => _currentDomain;
  RequestDetails? get lastRequestDetails => _lastRequestDetails;

  void changeLanguage(DataLanguage language) {
    _currentLanguage = language;
  }

  void changeDomain(String domain) {
    _currentDomain = domain;
  }

  Future<void> loadPublicationDetail(String publicationId) async {
    emit(const LoadingState());

    final stopwatch = Stopwatch()..start();

    try {
      // Build request details for tracking
      final parameters = <String, dynamic>{
        'id': publicationId,
        'domain': _currentDomain,
        'lang': _currentLanguage.value,
        'key': Env.apiKey,
      };

      const baseUrl = 'https://webapi.bps.go.id/v1/api/view/publication';
      final queryParams = parameters.entries
          .map((e) => '${e.key}=${e.value}')
          .join('&');
      final fullUrl = '$baseUrl?$queryParams';

      final result = await _stadataFlutter.view.publication(
        id: publicationId,
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

      if (result != null) {
        emit(LoadedState<Publication>(result));
      } else {
        emit(const ErrorState('No data received from API'));
      }
    } on Exception catch (error) {
      stopwatch.stop();
      emit(ErrorState(error.toString()));
    }
  }

  Future<void> refresh() async {
    // Reload with current parameters
    if (_lastRequestDetails != null) {
      final publicationId = _lastRequestDetails!.parameters['id'] as String;
      await loadPublicationDetail(publicationId);
    }
  }
}
