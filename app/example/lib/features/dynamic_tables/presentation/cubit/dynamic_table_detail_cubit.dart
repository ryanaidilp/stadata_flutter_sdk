import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:stadata_example/config/env.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/data/models/request_details.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class DynamicTableDetailCubit extends BaseCubit<BaseState> {
  DynamicTableDetailCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  RequestDetails? _lastRequestDetails;

  // Getter
  RequestDetails? get lastRequestDetails => _lastRequestDetails;

  Future<void> loadDetail({
    required int variableID,
    required String domain,
    required DataLanguage lang,
    String? period,
    int? verticalVarID,
    int? derivedVarID,
    int? derivedPeriodID,
  }) async {
    emit(const LoadingState());

    final stopwatch = Stopwatch()..start();

    try {
      // Build request details for tracking
      final parameters = <String, dynamic>{
        'domain': domain,
        'lang': lang.value,
        'var': variableID,
        'key': Env.apiKey,
      };

      if (period != null && period.isNotEmpty) {
        parameters['th'] = period;
      }
      if (verticalVarID != null) {
        parameters['vervar'] = verticalVarID;
      }
      if (derivedVarID != null) {
        parameters['turvar'] = derivedVarID;
      }
      if (derivedPeriodID != null) {
        parameters['turtahun'] = derivedPeriodID;
      }

      const baseUrl = 'https://webapi.bps.go.id/v1/api/list/model/data';
      final queryParams = parameters.entries
          .map((e) => '${e.key}=${e.value}')
          .join('&');
      final fullUrl = '$baseUrl/$domain/var/$variableID?$queryParams';

      final result = await _stadataFlutter.list.dynamicTableDetail(
        variableID: variableID,
        domain: domain,
        period: period,
        verticalVarID: verticalVarID,
        derivedVarID: derivedVarID,
        derivedPeriodID: derivedPeriodID,
        lang: lang,
      );

      stopwatch.stop();

      await result.fold(
        (failure) async {
          _lastRequestDetails = RequestDetails(
            url: fullUrl,
            method: 'GET',
            parameters: parameters,
            responseTime: Duration(milliseconds: stopwatch.elapsedMilliseconds),
            statusCode: 500,
            errorMessage: failure.toString(),
          );

          emit(ErrorState(failure.toString()));
        },
        (table) async {
          _lastRequestDetails = RequestDetails(
            url: fullUrl,
            method: 'GET',
            parameters: parameters,
            responseTime: Duration(milliseconds: stopwatch.elapsedMilliseconds),
            statusCode: 200,
          );

          emit(LoadedState<DynamicTable>(table));
        },
      );
    } catch (e) {
      stopwatch.stop();

      _lastRequestDetails = RequestDetails(
        url: 'Error',
        method: 'GET',
        parameters: {},
        responseTime: Duration(milliseconds: stopwatch.elapsedMilliseconds),
        statusCode: 500,
        errorMessage: e.toString(),
      );

      emit(ErrorState(e.toString()));
    }
  }

  Future<void> refresh({
    required int variableID,
    required String domain,
    required DataLanguage lang,
    String? period,
    int? verticalVarID,
    int? derivedVarID,
    int? derivedPeriodID,
  }) async {
    await loadDetail(
      variableID: variableID,
      domain: domain,
      lang: lang,
      period: period,
      verticalVarID: verticalVarID,
      derivedVarID: derivedVarID,
      derivedPeriodID: derivedPeriodID,
    );
  }
}
