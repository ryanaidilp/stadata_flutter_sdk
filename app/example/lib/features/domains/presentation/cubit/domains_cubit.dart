import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';
import 'package:stadata_example/core/utils/debouncer.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';

// Custom state to handle parameter changes
class DomainsState extends BaseState {
  const DomainsState({required this.baseState, this.stateVersion = 0});

  final BaseState baseState;
  final int stateVersion;

  @override
  List<Object?> get props => [baseState, stateVersion];
}

@injectable
class DomainsCubit extends BaseCubit<BaseState> {
  DomainsCubit() : super(const InitialState());

  DomainType _currentType = DomainType.all;
  DataLanguage _currentLanguage = DataLanguage.id;
  String? _provinceCode;
  final Debouncer _debouncer = Debouncer(
    delay: const Duration(milliseconds: 800),
  );

  // State change counter to force rebuilds
  int _stateVersion = 0;

  DomainType get currentType => _currentType;
  DataLanguage get currentLanguage => _currentLanguage;
  String? get provinceCode => _provinceCode;

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

  void initialize() {
    // Parameter cubit only handles UI state changes
  }

  void changeType(DomainType type) {
    _currentType = type;
    // Clear province code when switching away from regencyByProvince
    if (type != DomainType.regencyByProvince) {
      _provinceCode = null;
    }
    _stateVersion++;
    emit(
      DomainsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
  }

  void changeLanguage(DataLanguage language) {
    _currentLanguage = language;
    _stateVersion++;
    emit(
      DomainsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
  }

  void setProvinceCode(String? code) {
    _provinceCode = code;
    _stateVersion++;
    emit(
      DomainsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
  }

  // Helper method to extract base state from DomainsState or return as is
  BaseState _extractBaseState(BaseState state) {
    if (state is DomainsState) {
      return state.baseState;
    }
    return state;
  }

  @override
  Future<void> close() {
    _debouncer.dispose();
    return super.close();
  }
}
