import 'package:injectable/injectable.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class NewsCategoriesCubit extends BaseCubit<BaseState> {
  NewsCategoriesCubit() : super(const InitialState());

  String _currentDomain = '7200';
  DataLanguage _currentLanguage = DataLanguage.id;

  String get currentDomain => _currentDomain;
  DataLanguage get currentLanguage => _currentLanguage;

  /// Check if all required parameters are valid
  bool get canLoadData {
    return _currentDomain.trim().isNotEmpty &&
        _currentDomain.trim().length >= 4;
  }

  /// Get validation error message
  String? get validationError {
    if (_currentDomain.trim().isEmpty) {
      return 'Domain is required';
    }
    if (_currentDomain.trim().length < 4) {
      return 'Domain must be at least 4 characters';
    }
    return null;
  }

  void initialize() {
    // Initialize with default values - no auto-loading
    emit(const InitialState());
  }

  void changeDomain(String domain) {
    _currentDomain = domain;
    emit(const InitialState());
  }

  void changeLanguage(DataLanguage language) {
    _currentLanguage = language;
    emit(const InitialState());
  }
}
