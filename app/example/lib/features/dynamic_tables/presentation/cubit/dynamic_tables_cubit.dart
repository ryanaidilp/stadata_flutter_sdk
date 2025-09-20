import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';
import 'package:stadata_example/config/env.dart';
import 'package:stadata_example/core/utils/debouncer.dart';
import 'package:stadata_example/shared/data/models/request_details.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';

@injectable
class DynamicTablesCubit extends BaseCubit<BaseState> {
  DynamicTablesCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  String _domain = '0000';
  DataLanguage _currentLanguage = DataLanguage.id;
  Variable? _selectedVariable;
  List<Period> _availablePeriods = [];
  int? _selectedYearId;
  RequestDetails? _lastRequestDetails;
  final Debouncer _debouncer = Debouncer(
    delay: const Duration(milliseconds: 800),
  );

  String get domain => _domain;
  DataLanguage get currentLanguage => _currentLanguage;
  Variable? get selectedVariable => _selectedVariable;
  List<Period> get availablePeriods => _availablePeriods;
  int? get selectedYearId => _selectedYearId;
  RequestDetails? get lastRequestDetails => _lastRequestDetails;

  bool get canLoadPeriods => _selectedVariable != null;
  bool get canGenerateTable =>
      _selectedVariable != null && _selectedYearId != null;

  void initialize() {
    // Don't auto-load data, let user manually trigger it
  }

  void changeDomain(String domain) {
    _domain = domain;
    _clearDependentData();
    emit(state);
    // Debounce any automatic data loading if needed
    _debouncer.run(() {
      // No automatic loading for this feature, but debouncer is ready for future use
    });
  }

  void changeLanguage(DataLanguage language) {
    _currentLanguage = language;
    _clearDependentData();
    emit(state);
  }

  void selectVariable(Variable variable) {
    _selectedVariable = variable;
    _availablePeriods.clear();
    _selectedYearId = null;
    emit(state);
  }

  void selectYearId(int yearId) {
    _selectedYearId = yearId;
    emit(state);
  }

  void _clearDependentData() {
    _selectedVariable = null;
    _availablePeriods.clear();
    _selectedYearId = null;
  }

  Future<void> loadAvailablePeriods() async {
    if (!canLoadPeriods) return;

    emit(const LoadingState());

    final stopwatch = Stopwatch()..start();

    try {
      final parameters = <String, dynamic>{
        'domain': _domain,
        'variableID': _selectedVariable!.id,
        'lang': _currentLanguage.value,
        'key': Env.apiKey,
      };

      final baseUrl = 'https://webapi.bps.go.id/v1/api/list/model/th';
      final queryParams = parameters.entries
          .map((e) => '${e.key}=${e.value}')
          .join('&');
      final fullUrl = '$baseUrl?$queryParams';

      final result = await _stadataFlutter.list.periods(
        domain: _domain,
        variableID: _selectedVariable!.id,
        lang: _currentLanguage,
      );

      stopwatch.stop();

      _lastRequestDetails = RequestDetails(
        url: fullUrl,
        method: 'GET',
        parameters: parameters,
        responseTime: stopwatch.elapsed,
      );

      _availablePeriods = result.data;
      emit(LoadedState<List<Period>>(_availablePeriods));
    } catch (error) {
      stopwatch.stop();
      emit(ErrorState(error.toString()));
    }
  }

  @override
  Future<void> close() {
    _debouncer.dispose();
    return super.close();
  }
}
