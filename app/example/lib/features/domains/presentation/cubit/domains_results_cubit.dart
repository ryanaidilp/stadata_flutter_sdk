import 'package:injectable/injectable.dart';
import 'package:stadata_example/config/env.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/data/models/request_details.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class DomainsResultsCubit extends BaseCubit<BaseState> {
  DomainsResultsCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  // Search parameters
  DomainType _currentType = DomainType.all;
  DataLanguage _currentLanguage = DataLanguage.id;
  String? _provinceCode;
  final int _currentPage = 1;
  int _totalPages = 1;

  RequestDetails? _lastRequestDetails;

  // Getters
  DomainType get currentType => _currentType;
  DataLanguage get currentLanguage => _currentLanguage;
  String? get provinceCode => _provinceCode;
  int get currentPage => _currentPage;
  int get totalPages => _totalPages;
  RequestDetails? get lastRequestDetails => _lastRequestDetails;

  /// Check if current domain type requires province code
  bool get requiresProvinceCode => _currentType == DomainType.regencyByProvince;

  /// Check if all required parameters are valid
  bool get canLoadData {
    if (requiresProvinceCode) {
      return _provinceCode != null && _provinceCode!.trim().isNotEmpty;
    }
    return true;
  }

  /// Get validation error message
  String? get validationError {
    if (requiresProvinceCode &&
        (_provinceCode == null || _provinceCode!.trim().isEmpty)) {
      // Note: For simplicity, we're using a hardcoded message here
      // In a production app, you'd want to inject a translation service
      return 'Province code is required for Regency by Province type';
    }
    return null;
  }

  void initialize({
    required DomainType type,
    required DataLanguage language,
    String? provinceCode,
  }) {
    _currentType = type;
    _currentLanguage = language;
    _provinceCode = provinceCode;

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
        'type': _currentType.value,
        if (_provinceCode != null) 'provinceCode': _provinceCode,
        'key': Env.apiKey,
      };

      const baseUrl = 'https://webapi.bps.go.id/v1/api/list/domain';
      final queryParams = parameters.entries
          .map((e) => '${e.key}=${e.value}')
          .join('&');
      final fullUrl = '$baseUrl?$queryParams';

      final result = await _stadataFlutter.list.domains(
        type: _currentType,
        provinceCode: _provinceCode,
      );

      stopwatch.stop();

      // Store request details
      _lastRequestDetails = RequestDetails(
        url: fullUrl,
        method: 'GET',
        parameters: parameters,
        responseTime: stopwatch.elapsed,
      );

      _totalPages = result.pagination?.pages ?? 1;
      emit(LoadedState<List<DomainEntity>>(result.data));
    } catch (error) {
      stopwatch.stop();
      emit(ErrorState(error.toString()));
    }
  }

  Future<void> refresh() async {
    await loadData();
  }
}
