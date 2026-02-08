import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:stadata_example/config/env.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/data/models/request_details.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class StaticTableDetailCubit extends BaseCubit<BaseState> {
  StaticTableDetailCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  RequestDetails? _lastRequestDetails;

  // Getter
  RequestDetails? get lastRequestDetails => _lastRequestDetails;

  Future<void> loadDetail({
    required int id,
    required String domain,
    required DataLanguage lang,
  }) async {
    emit(const LoadingState());

    final stopwatch = Stopwatch()..start();

    try {
      // Build request details for tracking
      final parameters = <String, dynamic>{
        'domain': domain,
        'lang': lang.value,
        'id': id,
        'key': Env.apiKey,
      };

      const baseUrl = 'https://webapi.bps.go.id/v1/api/view/statictable';
      final queryParams = parameters.entries
          .map((e) => '${e.key}=${e.value}')
          .join('&');
      final fullUrl = '$baseUrl?$queryParams';

      final result = await _stadataFlutter.view.staticTable(
        id: id,
        domain: domain,
        lang: lang,
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
        emit(LoadedState<StaticTable>(result));
      } else {
        emit(const ErrorState('Static table not found'));
      }
    } on Exception catch (error) {
      stopwatch.stop();
      emit(ErrorState(error.toString()));
    }
  }

  Future<void> refresh({
    required int id,
    required String domain,
    required DataLanguage lang,
  }) async {
    await loadDetail(id: id, domain: domain, lang: lang);
  }
}
