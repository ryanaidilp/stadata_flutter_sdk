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
    return _domain != null && _domain!.trim().length == 4;
  }

  bool get canLoadVariables {
    return _domain != null && _domain!.trim().length == 4;
  }

  String? get validationError {
    if (_domain == null || _domain!.trim().isEmpty) {
      return 'Domain is required';
    }
    if (_domain!.trim().length != 4) {
      return 'Domain must be exactly 4 digits';
    }
    return null;
  }

  void initialize() {}

  void setDomain(String? domain) {
    _domain = domain;
    _variableID = null; // Reset variable ID when domain changes
    _variables = []; // Clear variables when domain changes

    _stateVersion++;
    emit(
      StrategicIndicatorsState(
        baseState: const InitialState(),
        stateVersion: _stateVersion,
        variables: [],
      ),
    );
  }

  /// Fetch variables with pagination support for DropdownSearch
  Future<List<Variable>> fetchVariables({
    required int page,
    String? searchText,
  }) async {
    if (_domain == null || _domain!.trim().length != 4) {
      return [];
    }

    try {
      final result = await _stadataFlutter.list.variables(
        domain: _domain!,
        lang: _currentLanguage,
        page: page,
      );

      // Filter by search text if provided
      if (searchText != null && searchText.isNotEmpty) {
        return result.data
            .where(
              (variable) =>
                  variable.title.toLowerCase().contains(
                        searchText.toLowerCase(),
                      ) ||
                  variable.id.toString().contains(searchText),
            )
            .toList();
      }

      return result.data;
    } catch (e) {
      return [];
    }
  }

  void changeLanguage(DataLanguage language) {
    _currentLanguage = language;
    // Reset variable ID when language changes
    _variableID = null;
    _stateVersion++;
    emit(
      StrategicIndicatorsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
        variables: _variables,
      ),
    );
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
