import 'package:injectable/injectable.dart';
import 'package:stadata_example/core/utils/debouncer.dart';
import 'package:stadata_example/core/validators/validators.dart';
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
    return DomainValidator.isValid(_domain);
  }

  bool get canLoadVariables {
    return DomainValidator.isValid(_domain);
  }

  String? get validationError {
    return DomainValidator.validate(_domain);
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

  /// Fetch variables with pagination support for SearchableDropdown
  /// Returns the exact list from API without client-side filtering
  /// to ensure proper pagination (package uses item count to detect last page)
  Future<List<Variable>> fetchVariables({
    required int page,
    String? searchText,
  }) async {
    if (!DomainValidator.isValid(_domain)) {
      return [];
    }

    try {
      final result = await _stadataFlutter.list.variables(
        domain: _domain!,
        lang: _currentLanguage,
        page: page,
      );

      // The searchable_paginated_dropdown package determines the last page
      // by checking if returned items < requestItemCount (10).
      // To fix the pagination issue where "next" shows even on last page:
      // - If we're past the last page, return empty
      // - If we're on the last page, ensure we return < 10 items
      //   by removing one item if we have exactly 10

      if (result.pagination != null) {
        final pagination = result.pagination!;

        // If requesting a page beyond available pages, return empty
        if (page > pagination.pages) {
          return [];
        }

        // If on the last page and we have exactly 10 items,
        // remove the last item to signal this is the end
        // This prevents the "next" button from appearing
        if (page == pagination.pages && result.data.length == 10) {
          return result.data.sublist(0, 9);
        }
      }

      // For all other cases, return the full page
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
