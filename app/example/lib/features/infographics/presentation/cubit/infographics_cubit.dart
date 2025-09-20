import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';
import 'package:stadata_example/core/utils/debouncer.dart';
import 'package:stadata_example/shared/data/models/request_details.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';

@injectable
class InfographicsCubit extends BaseCubit<BaseState> {
  InfographicsCubit(StadataFlutter stadataFlutter)
    : super(const InitialState());
  String _currentDomain = '7200';
  DataLanguage _currentLanguage = DataLanguage.id;
  int _currentPage = 1;
  String? _keyword;
  RequestDetails? _lastRequestDetails;
  final Debouncer _debouncer = Debouncer(
    delay: const Duration(milliseconds: 800),
  );

  String get currentDomain => _currentDomain;
  DataLanguage get currentLanguage => _currentLanguage;
  int get currentPage => _currentPage;
  String? get keyword => _keyword;
  RequestDetails? get lastRequestDetails => _lastRequestDetails;

  /// Check if all required parameters are valid
  bool get canLoadData {
    return _currentDomain.trim().isNotEmpty &&
        _currentDomain.trim().length >= 4;
  }

  /// Get validation error message
  String? get validationError {
    if (_currentDomain.trim().isEmpty) {
      // Note: For simplicity, we're using a hardcoded message here
      // In a production app, you'd want to inject a translation service
      return 'Domain is required';
    }
    if (_currentDomain.trim().length < 4) {
      return 'Domain must be at least 4 characters';
    }
    return null;
  }

  void initialize() {
    // Don't auto-load data anymore, let user manually trigger it
    // This makes the UI more educational and deliberate
  }

  void changeDomain(String domain) {
    _currentDomain = domain;
    // Reset pagination when domain changes
    _currentPage = 1;
    emit(state); // Trigger rebuild to update UI state
  }

  void changeLanguage(DataLanguage language) {
    _currentLanguage = language;
    // Reset pagination when language changes
    _currentPage = 1;
    emit(state); // Trigger rebuild to update UI state
  }

  void setKeyword(String? keyword) {
    _keyword = keyword?.trim().isEmpty == true ? null : keyword?.trim();
    // Reset pagination when keyword changes
    _currentPage = 1;
    emit(state); // Trigger rebuild to update UI state
  }

  void setPage(int page) {
    _currentPage = page;
    // This method only updates the page parameter without triggering data load
    // Used for parameter panel text field changes
    emit(state); // Trigger rebuild to update UI state
  }

  @override
  Future<void> close() {
    _debouncer.dispose();
    return super.close();
  }
}
