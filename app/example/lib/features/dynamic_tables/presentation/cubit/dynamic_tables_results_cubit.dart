import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';
import 'package:stadata_example/config/env.dart';
import 'package:stadata_example/shared/data/models/request_details.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';

@injectable
class DynamicTablesResultsCubit extends BaseCubit<BaseState> {
  DynamicTablesResultsCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  // Search parameters
  String _domain = '0000';
  DataLanguage _currentLanguage = DataLanguage.id;
  Variable? _selectedVariable;
  int? _selectedYearId;
  DynamicTable? _dynamicTableResult;

  RequestDetails? _lastRequestDetails;

  // Getters
  String get domain => _domain;
  DataLanguage get currentLanguage => _currentLanguage;
  Variable? get selectedVariable => _selectedVariable;
  int? get selectedYearId => _selectedYearId;
  DynamicTable? get dynamicTableResult => _dynamicTableResult;
  RequestDetails? get lastRequestDetails => _lastRequestDetails;

  /// Check if all required parameters are valid
  bool get canLoadData => _selectedVariable != null && _selectedYearId != null;

  /// Get validation error message
  String? get validationError {
    if (_selectedVariable == null) {
      return 'Variable is required';
    }
    if (_selectedYearId == null) {
      return 'Year is required';
    }
    return null;
  }

  void initialize({
    required String domain,
    required DataLanguage language,
    required Variable variable,
    required int yearId,
  }) {
    _domain = domain;
    _currentLanguage = language;
    _selectedVariable = variable;
    _selectedYearId = yearId;

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

  Future<void> loadData() async {
    if (!canLoadData) {
      return;
    }

    emit(const LoadingState());

    final stopwatch = Stopwatch()..start();

    try {
      // Build request details for tracking
      final parameters = <String, dynamic>{
        'domain': _domain,
        'variableID': _selectedVariable!.id,
        'yearID': _selectedYearId,
        'lang': _currentLanguage.value,
        'key': Env.apiKey,
      };

      final baseUrl = 'https://webapi.bps.go.id/v1/api/list/model/data';
      final queryParams = parameters.entries
          .map((e) => '${e.key}=${e.value}')
          .join('&');
      final fullUrl = '$baseUrl?$queryParams';

      final result = await _stadataFlutter.list.dynamicTable(
        domain: _domain,
        variableID: _selectedVariable!.id,
        yearID: _selectedYearId,
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

      result.fold((failure) => emit(ErrorState(failure.toString())), (
        dynamicTable,
      ) {
        _dynamicTableResult = dynamicTable;
        emit(LoadedState<DynamicTable>(dynamicTable));
      });
    } catch (error) {
      stopwatch.stop();
      emit(ErrorState(error.toString()));
    }
  }

  Future<void> refresh() async {
    await loadData();
  }
}
