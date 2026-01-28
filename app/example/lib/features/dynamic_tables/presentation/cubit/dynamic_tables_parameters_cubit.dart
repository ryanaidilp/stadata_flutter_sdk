import 'package:injectable/injectable.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class DynamicTablesParametersState extends BaseState {
  const DynamicTablesParametersState({
    required this.baseState,
    this.stateVersion = 0,
    this.subjectCategories = const [],
    this.subjects = const [],
    this.variables = const [],
    this.verticalVariables = const [],
    this.derivedVariables = const [],
    this.periods = const [],
    this.derivedPeriods = const [],
  });

  final BaseState baseState;
  final int stateVersion;
  final List<SubjectCategory> subjectCategories;
  final List<Subject> subjects;
  final List<Variable> variables;
  final List<VerticalVariable> verticalVariables;
  final List<DerivedVariable> derivedVariables;
  final List<Period> periods;
  final List<DerivedPeriod> derivedPeriods;

  @override
  List<Object?> get props => [
    baseState,
    stateVersion,
    subjectCategories,
    subjects,
    variables,
    verticalVariables,
    derivedVariables,
    periods,
    derivedPeriods,
  ];
}

@injectable
class DynamicTablesParametersCubit
    extends BaseCubit<DynamicTablesParametersState> {
  DynamicTablesParametersCubit(this._stadataFlutter)
    : super(
        const DynamicTablesParametersState(
          baseState: InitialState(),
        ),
      );

  final StadataFlutter _stadataFlutter;

  String? _domain;
  int? _subjectCategoryID;
  int? _subjectID;
  int? _variableID;
  int? _verticalVariableID;
  int? _derivedVariableID;
  List<int> _selectedPeriodIDs = []; // Changed to List for multi-select
  int? _derivedPeriodID;

  List<SubjectCategory> _subjectCategories = [];
  List<Subject> _subjects = [];
  List<Variable> _variables = [];
  List<VerticalVariable> _verticalVariables = [];
  List<DerivedVariable> _derivedVariables = [];
  List<Period> _periods = [];
  List<DerivedPeriod> _derivedPeriods = [];
  int _stateVersion = 0;

  // Getters
  String? get domain => _domain;
  int? get subjectCategoryID => _subjectCategoryID;
  int? get subjectID => _subjectID;
  int? get variableID => _variableID;
  int? get verticalVariableID => _verticalVariableID;
  int? get derivedVariableID => _derivedVariableID;
  List<int> get selectedPeriodIDs => _selectedPeriodIDs; // Changed to List
  int? get derivedPeriodID => _derivedPeriodID;

  List<SubjectCategory> get subjectCategories => _subjectCategories;
  List<Subject> get subjects => _subjects;
  List<Variable> get variables => _variables;
  List<VerticalVariable> get verticalVariables => _verticalVariables;
  List<DerivedVariable> get derivedVariables => _derivedVariables;
  List<Period> get periods => _periods;
  List<DerivedPeriod> get derivedPeriods => _derivedPeriods;

  // Validation getters
  bool get canLoadSubjectCategories {
    return _domain != null && _domain!.trim().isNotEmpty;
  }

  bool get canLoadSubjects {
    return canLoadSubjectCategories && _subjectCategoryID != null;
  }

  bool get canLoadVariables {
    return canLoadSubjects && _subjectID != null;
  }

  bool get canLoadDimensions {
    return canLoadVariables && _variableID != null;
  }

  bool get canLoadData {
    return canLoadDimensions && _variableID != null;
  }

  String? get validationError {
    if (_domain == null || _domain!.trim().isEmpty) {
      return 'Domain is required';
    }
    if (_variableID == null) {
      return 'Variable is required';
    }
    return null;
  }

  Future<void> initialize(String domain) async {
    _domain = domain;
    await loadSubjectCategories();
  }

  /// Initialize with existing parameters (for persistence)
  Future<void> initializeWithParameters({
    required String domain,
    int? variableID,
    int? subjectCategoryID,
    int? subjectID,
    int? verticalVariableID,
    int? derivedVariableID,
    List<int>? selectedPeriodIDs,
    int? derivedPeriodID,
  }) async {
    _domain = domain;

    // Set all parameters
    _variableID = variableID;
    _subjectCategoryID = subjectCategoryID;
    _subjectID = subjectID;
    _verticalVariableID = verticalVariableID;
    _derivedVariableID = derivedVariableID;
    _selectedPeriodIDs = selectedPeriodIDs ?? [];
    _derivedPeriodID = derivedPeriodID;

    // Load subject categories first
    await loadSubjectCategories();

    // If we have a subject category, load subjects
    if (_subjectCategoryID != null) {
      await loadSubjects();
    }

    // If we have a subject, load variables
    if (_subjectID != null) {
      await loadVariables();
    }

    // If we have a variable, load dimensions
    if (_variableID != null) {
      await loadDimensions();
    }
  }

  Future<void> loadSubjectCategories() async {
    if (!canLoadSubjectCategories) {
      return;
    }

    _emitState(const LoadingState());

    try {
      final result = await _stadataFlutter.list.subjectCategories(
        domain: _domain!,
      );

      _subjectCategories = result.data;
      _stateVersion++;
      _emitState(
        LoadedState<List<SubjectCategory>>(_subjectCategories),
      );
    } on Exception catch (error) {
      _stateVersion++;
      _emitState(ErrorState(error.toString()));
    }
  }

  void setSubjectCategoryID(int? subjectCategoryID) {
    _subjectCategoryID = subjectCategoryID;
    // Clear dependent fields
    _subjectID = null;
    _variableID = null;
    _verticalVariableID = null;
    _derivedVariableID = null;
    _selectedPeriodIDs = []; // Changed to List
    _derivedPeriodID = null;
    // Clear dependent data
    _subjects = [];
    _variables = [];
    _verticalVariables = [];
    _derivedVariables = [];
    _periods = [];
    _derivedPeriods = [];
    _stateVersion++;
    _emitState(state);
    // Auto-load subjects if ready
    if (canLoadSubjects) {
      loadSubjects();
    }
  }

  Future<void> loadSubjects() async {
    if (!canLoadSubjects) {
      return;
    }

    _emitState(const LoadingState());

    try {
      final result = await _stadataFlutter.list.subjects(
        domain: _domain!,
        subjectCategoryID: _subjectCategoryID,
      );

      _subjects = result.data;
      _stateVersion++;
      _emitState(LoadedState<List<Subject>>(_subjects));
    } on Exception catch (error) {
      _stateVersion++;
      _emitState(ErrorState(error.toString()));
    }
  }

  void setSubjectID(int? subjectID) {
    _subjectID = subjectID;
    // Clear dependent fields
    _variableID = null;
    _verticalVariableID = null;
    _derivedVariableID = null;
    _selectedPeriodIDs = []; // Changed to List
    _derivedPeriodID = null;
    // Clear dependent data
    _variables = [];
    _verticalVariables = [];
    _derivedVariables = [];
    _periods = [];
    _derivedPeriods = [];
    _stateVersion++;
    _emitState(state);
    // Auto-load variables if ready
    if (canLoadVariables) {
      loadVariables();
    }
  }

  Future<void> loadVariables() async {
    if (!canLoadVariables) {
      return;
    }

    _emitState(const LoadingState());

    try {
      final result = await _stadataFlutter.list.variables(
        domain: _domain!,
        subjectID: _subjectID,
      );

      _variables = result.data;
      _stateVersion++;
      _emitState(LoadedState<List<Variable>>(_variables));
    } on Exception catch (error) {
      _stateVersion++;
      _emitState(ErrorState(error.toString()));
    }
  }

  void setVariableID(int? variableID) {
    _variableID = variableID;
    // Clear dependent fields
    _verticalVariableID = null;
    _derivedVariableID = null;
    _selectedPeriodIDs = []; // Changed to List
    _derivedPeriodID = null;
    // Clear dependent data
    _verticalVariables = [];
    _derivedVariables = [];
    _periods = [];
    _derivedPeriods = [];
    _stateVersion++;
    _emitState(state);
    // Auto-load dimensions if ready
    if (canLoadDimensions) {
      loadDimensions();
    }
  }

  Future<void> loadDimensions() async {
    if (!canLoadDimensions) {
      return;
    }

    _emitState(const LoadingState());

    try {
      // Load dimensions individually to handle unavailable ones gracefully

      // Load vertical variables
      try {
        final verticalVarsResult = await _stadataFlutter.list.verticalVariables(
          domain: _domain!,
          variableID: _variableID,
        );
        _verticalVariables = verticalVarsResult.data;
      } on Exception {
        _verticalVariables = [];
      }

      // Load derived variables
      try {
        final derivedVarsResult = await _stadataFlutter.list.derivedVariables(
          domain: _domain!,
          variableID: _variableID,
        );
        _derivedVariables = derivedVarsResult.data;
      } on Exception {
        _derivedVariables = [];
      }

      // Load periods
      try {
        final periodsResult = await _stadataFlutter.list.periods(
          domain: _domain!,
          variableID: _variableID,
        );
        _periods = periodsResult.data;
      } on Exception {
        _periods = [];
      }

      // Load derived periods
      try {
        final derivedPeriodsResult = await _stadataFlutter.list.derivedPeriods(
          domain: _domain!,
          variableID: _variableID,
        );
        _derivedPeriods = derivedPeriodsResult.data;
      } on Exception {
        _derivedPeriods = [];
      }

      _stateVersion++;
      _emitState(
        const LoadedState<String>('Dimensions loaded'),
      );
    } catch (error) {
      _stateVersion++;
      _emitState(ErrorState(error.toString()));
    }
  }

  void setVerticalVariableID(int? verticalVariableID) {
    _verticalVariableID = verticalVariableID;
    _stateVersion++;
    _emitState(state);
  }

  void setDerivedVariableID(int? derivedVariableID) {
    _derivedVariableID = derivedVariableID;
    _stateVersion++;
    _emitState(state);
  }

  /// Toggle period selection (multi-select)
  void togglePeriodID(int periodID) {
    if (_selectedPeriodIDs.contains(periodID)) {
      _selectedPeriodIDs.remove(periodID);
    } else {
      _selectedPeriodIDs.add(periodID);
    }
    _stateVersion++;
    _emitState(state);
  }

  /// Check if a period is selected
  bool isPeriodSelected(int periodID) {
    return _selectedPeriodIDs.contains(periodID);
  }

  /// Clear all selected periods
  void clearSelectedPeriods() {
    _selectedPeriodIDs = [];
    _stateVersion++;
    _emitState(state);
  }

  /// Set all selected periods at once (for persistence)
  void setSelectedPeriods(List<int> periodIDs) {
    _selectedPeriodIDs = List<int>.from(periodIDs);
    _stateVersion++;
    _emitState(state);
  }

  void setDerivedPeriodID(int? derivedPeriodID) {
    _derivedPeriodID = derivedPeriodID;
    _stateVersion++;
    _emitState(state);
  }

  void _emitState(BaseState baseState) {
    emit(
      DynamicTablesParametersState(
        baseState: baseState,
        stateVersion: _stateVersion,
        subjectCategories: _subjectCategories,
        subjects: _subjects,
        variables: _variables,
        verticalVariables: _verticalVariables,
        derivedVariables: _derivedVariables,
        periods: _periods,
        derivedPeriods: _derivedPeriods,
      ),
    );
  }
}
