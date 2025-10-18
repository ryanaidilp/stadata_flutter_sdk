import 'package:injectable/injectable.dart';
import 'package:stadata_example/core/utils/debouncer.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class StrategicIndicatorsState extends BaseState {
  const StrategicIndicatorsState({
    required this.baseState,
    this.stateVersion = 0,
    this.variables = const [],
  });

  final BaseState baseState;
  final int stateVersion;
  final List<Variable> variables;

  @override
  List<Object?> get props => [baseState, stateVersion, variables];
}

@injectable
class StrategicIndicatorsCubit extends BaseCubit<BaseState> {
  StrategicIndicatorsCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  String? _domain;
  DataLanguage _currentLanguage = DataLanguage.id;
  int? _variableID;
  List<Variable> _variables = [];
  final Debouncer _debouncer = Debouncer(
    delay: const Duration(milliseconds: 800),
  );

  int _stateVersion = 0;

  String? get domain => _domain;
  DataLanguage get currentLanguage => _currentLanguage;
  int? get variableID => _variableID;
  List<Variable> get variables => _variables;

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

  Future<void> setDomain(String? domain) async {
    _domain = domain;
    _variableID = null; // Reset variable ID when domain changes
    _variables = []; // Clear variables when domain changes

    if (domain != null && domain.trim().isNotEmpty) {
      emit(const LoadingState());
      try {
        final result = await _stadataFlutter.list.variables(
          domain: domain,
          lang: _currentLanguage,
        );

        if (result.data.isNotEmpty) {
          _variables = result.data;
        }
        _stateVersion++;
        emit(
          StrategicIndicatorsState(
            baseState: const InitialState(),
            stateVersion: _stateVersion,
            variables: _variables,
          ),
        );
      } catch (e) {
        _stateVersion++;
        emit(
          StrategicIndicatorsState(
            baseState: ErrorState('Failed to load variables: $e'),
            stateVersion: _stateVersion,
            variables: [],
          ),
        );
      }
    } else {
      _stateVersion++;
      emit(
        StrategicIndicatorsState(
          baseState: const InitialState(),
          stateVersion: _stateVersion,
          variables: [],
        ),
      );
    }
  }

  void changeLanguage(DataLanguage language) {
    _currentLanguage = language;
    // Reload variables when language changes if domain is set
    if (_domain != null && _domain!.trim().isNotEmpty) {
      setDomain(_domain);
    } else {
      _stateVersion++;
      emit(
        StrategicIndicatorsState(
          baseState: _extractBaseState(state),
          stateVersion: _stateVersion,
          variables: _variables,
        ),
      );
    }
  }

  void setVariableID(int? variableID) {
    _variableID = variableID;
    _stateVersion++;
    emit(
      StrategicIndicatorsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
        variables: _variables,
      ),
    );
  }

  BaseState _extractBaseState(BaseState state) {
    if (state is StrategicIndicatorsState) {
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
