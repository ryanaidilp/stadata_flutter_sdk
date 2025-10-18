import 'package:injectable/injectable.dart';
import 'package:stadata_example/core/utils/debouncer.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class PressReleasesState extends BaseState {
  const PressReleasesState({required this.baseState, this.stateVersion = 0});

  final BaseState baseState;
  final int stateVersion;

  @override
  List<Object?> get props => [baseState, stateVersion];
}

@injectable
class PressReleasesCubit extends BaseCubit<BaseState> {
  PressReleasesCubit() : super(const InitialState());

  String? _domain;
  DataLanguage _currentLanguage = DataLanguage.id;
  String? _keyword;
  int? _month;
  int? _year;
  final Debouncer _debouncer = Debouncer(
    delay: const Duration(milliseconds: 800),
  );

  int _stateVersion = 0;

  String? get domain => _domain;
  DataLanguage get currentLanguage => _currentLanguage;
  String? get keyword => _keyword;
  int? get month => _month;
  int? get year => _year;

  bool get canLoadData {
    return _domain != null && _domain!.trim().isNotEmpty;
  }

  String? get validationError {
    if (_domain == null || _domain!.trim().isEmpty) {
      return 'Domain is required';
    }
    return null;
  }

  void initialize() {}

  void setDomain(String? domain) {
    _domain = domain;
    _stateVersion++;
    emit(
      PressReleasesState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
  }

  void changeLanguage(DataLanguage language) {
    _currentLanguage = language;
    _stateVersion++;
    emit(
      PressReleasesState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
  }

  void setKeyword(String? keyword) {
    _keyword = keyword?.isEmpty ?? false ? null : keyword;
    _stateVersion++;
    emit(
      PressReleasesState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
  }

  void setMonth(int? month) {
    _month = month;
    _stateVersion++;
    emit(
      PressReleasesState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
  }

  void setYear(int? year) {
    _year = year;
    _stateVersion++;
    emit(
      PressReleasesState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
  }

  void clearFilters() {
    _keyword = null;
    _month = null;
    _year = null;
    _stateVersion++;
    emit(
      PressReleasesState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
  }

  BaseState _extractBaseState(BaseState state) {
    if (state is PressReleasesState) {
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
