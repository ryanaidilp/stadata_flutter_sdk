import 'package:injectable/injectable.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class CensusAreasState extends BaseState {
  const CensusAreasState({
    required this.baseState,
    this.stateVersion = 0,
    this.censusEvents = const [],
    this.censusAreas = const [],
  });

  final BaseState baseState;
  final int stateVersion;
  final List<CensusEvent> censusEvents;
  final List<CensusArea> censusAreas;

  @override
  List<Object?> get props => [
    baseState,
    stateVersion,
    censusEvents,
    censusAreas,
  ];
}

@injectable
class CensusAreasCubit extends BaseCubit<BaseState> {
  CensusAreasCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  String? _censusID;
  List<CensusEvent> _censusEvents = [];
  List<CensusArea> _censusAreas = [];
  int _stateVersion = 0;

  String? get censusID => _censusID;
  List<CensusEvent> get censusEvents => _censusEvents;
  List<CensusArea> get censusAreas => _censusAreas;

  bool get canLoadAreas {
    return _censusID != null && _censusID!.trim().isNotEmpty;
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
        CensusAreasState(
          baseState: LoadedState<List<CensusEvent>>(_censusEvents),
          stateVersion: _stateVersion,
          censusEvents: _censusEvents,
          censusAreas: _censusAreas,
        ),
      );
    } on Exception catch (error) {
      _stateVersion++;
      emit(
        CensusAreasState(
          baseState: ErrorState(error.toString()),
          stateVersion: _stateVersion,
          censusEvents: _censusEvents,
          censusAreas: _censusAreas,
        ),
      );
    }
  }

  Future<void> loadCensusAreas() async {
    if (!canLoadAreas) {
      return;
    }

    _stateVersion++;
    emit(
      CensusAreasState(
        baseState: const LoadingState(),
        stateVersion: _stateVersion,
        censusEvents: _censusEvents,
        censusAreas: _censusAreas,
      ),
    );

    try {
      final result = await _stadataFlutter.list.censusEventAreas(
        censusID: _censusID!,
      );

      _censusAreas = result.data;
      _stateVersion++;
      emit(
        CensusAreasState(
          baseState: LoadedState<List<CensusArea>>(_censusAreas),
          stateVersion: _stateVersion,
          censusEvents: _censusEvents,
          censusAreas: _censusAreas,
        ),
      );
    } on Exception catch (error) {
      _stateVersion++;
      emit(
        CensusAreasState(
          baseState: ErrorState(error.toString()),
          stateVersion: _stateVersion,
          censusEvents: _censusEvents,
          censusAreas: _censusAreas,
        ),
      );
    }
  }

  void setCensusID(String? censusID) {
    _censusID = censusID;
    _censusAreas = [];
    _stateVersion++;
    emit(
      CensusAreasState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
        censusEvents: _censusEvents,
        censusAreas: _censusAreas,
      ),
    );

    if (canLoadAreas) {
      loadCensusAreas();
    }
  }

  BaseState _extractBaseState(BaseState state) {
    if (state is CensusAreasState) {
      return state.baseState;
    }
    return state;
  }
}
