import 'package:injectable/injectable.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class CensusTopicsState extends BaseState {
  const CensusTopicsState({
    required this.baseState,
    this.stateVersion = 0,
    this.censusEvents = const [],
  });

  final BaseState baseState;
  final int stateVersion;
  final List<CensusEvent> censusEvents;

  @override
  List<Object?> get props => [baseState, stateVersion, censusEvents];
}

@injectable
class CensusTopicsCubit extends BaseCubit<BaseState> {
  CensusTopicsCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  String? _censusID;
  DataLanguage _currentLanguage = DataLanguage.id;
  List<CensusEvent> _censusEvents = [];
  int _stateVersion = 0;

  String? get censusID => _censusID;
  DataLanguage get currentLanguage => _currentLanguage;
  List<CensusEvent> get censusEvents => _censusEvents;

  bool get canLoadData {
    return _censusID != null && _censusID!.trim().isNotEmpty;
  }

  String? get validationError {
    if (_censusID == null || _censusID!.trim().isEmpty) {
      return 'Census ID is required';
    }
    return null;
  }

  Future<void> initialize() async {
    await loadCensusEvents();
  }

  Future<void> loadCensusEvents() async {
    emit(const LoadingState());

    try {
      final result = await _stadataFlutter.list.censusEvents();

      _censusEvents = result.data;
      _stateVersion++;
      emit(
        CensusTopicsState(
          baseState: LoadedState<List<CensusEvent>>(_censusEvents),
          stateVersion: _stateVersion,
          censusEvents: _censusEvents,
        ),
      );
    } on Exception catch (error) {
      _stateVersion++;
      emit(
        CensusTopicsState(
          baseState: ErrorState(error.toString()),
          stateVersion: _stateVersion,
          censusEvents: _censusEvents,
        ),
      );
    }
  }

  void setCensusID(String? censusID) {
    _censusID = censusID;
    _stateVersion++;
    emit(
      CensusTopicsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
        censusEvents: _censusEvents,
      ),
    );
  }

  void changeLanguage(DataLanguage language) {
    _currentLanguage = language;
    _censusID = null;
    _stateVersion++;
    emit(
      CensusTopicsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
        censusEvents: _censusEvents,
      ),
    );
    // Reload census events with new language
    loadCensusEvents();
  }

  BaseState _extractBaseState(BaseState state) {
    if (state is CensusTopicsState) {
      return state.baseState;
    }
    return state;
  }
}
