import 'package:injectable/injectable.dart';
import 'package:stadata_example/config/env.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/data/models/request_details.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class NewsDetailCubit extends BaseCubit<BaseState> {
  NewsDetailCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;
  DataLanguage currentLanguage = DataLanguage.id;
  String currentDomain = '7200';
  RequestDetails? _lastRequestDetails;

  RequestDetails? get lastRequestDetails => _lastRequestDetails;

  Future<void> loadNewsDetail(int newsId) async {
    emit(const LoadingState());

    final stopwatch = Stopwatch()..start();

    try {
      // Build request details for tracking
      final parameters = <String, dynamic>{
        'id': newsId,
        'lang': currentLanguage.value,
        'key': Env.apiKey,
      };

      const baseUrl = 'https://webapi.bps.go.id/v1/api/view/news';
      final queryParams = parameters.entries
          .map((e) => '${e.key}=${e.value}')
          .join('&');
      final fullUrl = '$baseUrl?$queryParams';

      final result = await _stadataFlutter.view.news(
        id: newsId,
        domain: currentDomain,
        lang: currentLanguage,
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
        emit(LoadedState<News>(result));
      } else {
        emit(const ErrorState('No data received from API'));
      }
    } on Exception catch (error) {
      stopwatch.stop();
      emit(ErrorState(error.toString()));
    }
  }

  Future<void> refresh(int newsId) async {
    await loadNewsDetail(newsId);
  }
}
