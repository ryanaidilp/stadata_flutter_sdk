import 'package:injectable/injectable.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class CensusDatasetsState extends BaseState {
  const CensusDatasetsState({
    required this.baseState,
    this.stateVersion = 0,
    this.censusEvents = const [],
    this.censusTopics = const [],
  });

  final BaseState baseState;
  final int stateVersion;
  final List<CensusEvent> censusEvents;
  final List<CensusTopic> censusTopics;

  @override
  List<Object?> get props => [
    baseState,
    stateVersion,
    censusEvents,
    censusTopics,
  ];
}

@injectable
class CensusDatasetsCubit extends BaseCubit<BaseState> {
  CensusDatasetsCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  String? _censusID;
  int? _topicID;
  List<CensusEvent> _censusEvents = [];
  List<CensusTopic> _censusTopics = [];
  int _stateVersion = 0;

  String? get censusID => _censusID;
  int? get topicID => _topicID;
  List<CensusEvent> get censusEvents => _censusEvents;
  List<CensusTopic> get censusTopics => _censusTopics;

  bool get canLoadTopics {
    return _censusID != null && _censusID!.trim().isNotEmpty;
  }

  bool get canLoadData {
    return canLoadTopics && _topicID != null;
  }

  String? get validationError {
    if (_censusID == null || _censusID!.trim().isEmpty) {
      return 'Census ID is required';
    }
    if (_topicID == null) {
      return 'Topic is required';
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
        CensusDatasetsState(
          baseState: LoadedState<List<CensusEvent>>(_censusEvents),
          stateVersion: _stateVersion,
          censusEvents: _censusEvents,
          censusTopics: _censusTopics,
        ),
      );
    } on Exception catch (error) {
      _stateVersion++;
      emit(
        CensusDatasetsState(
          baseState: ErrorState(error.toString()),
          stateVersion: _stateVersion,
          censusEvents: _censusEvents,
          censusTopics: _censusTopics,
        ),
      );
    }
  }

  Future<void> loadCensusTopics() async {
    if (!canLoadTopics) {
      return;
    }

    _stateVersion++;
    emit(
      CensusDatasetsState(
        baseState: const LoadingState(),
        stateVersion: _stateVersion,
        censusEvents: _censusEvents,
        censusTopics: _censusTopics,
      ),
    );

    try {
      final result = await _stadataFlutter.list.censusTopics(
        censusID: _censusID!,
      );

      _censusTopics = result.data;
      _stateVersion++;
      emit(
        CensusDatasetsState(
          baseState: LoadedState<List<CensusTopic>>(_censusTopics),
          stateVersion: _stateVersion,
          censusEvents: _censusEvents,
          censusTopics: _censusTopics,
        ),
      );
    } on Exception catch (error) {
      _stateVersion++;
      emit(
        CensusDatasetsState(
          baseState: ErrorState(error.toString()),
          stateVersion: _stateVersion,
          censusEvents: _censusEvents,
          censusTopics: _censusTopics,
        ),
      );
    }
  }

  void setCensusID(String? censusID) {
    _censusID = censusID;
    _topicID = null;
    _censusTopics = [];
    _stateVersion++;
    emit(
      CensusDatasetsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
        censusEvents: _censusEvents,
        censusTopics: _censusTopics,
      ),
    );

    if (canLoadTopics) {
      loadCensusTopics();
    }
  }

  void setTopicID(int? topicID) {
    _topicID = topicID;
    _stateVersion++;
    emit(
      CensusDatasetsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
        censusEvents: _censusEvents,
        censusTopics: _censusTopics,
      ),
    );
  }

  BaseState _extractBaseState(BaseState state) {
    if (state is CensusDatasetsState) {
      return state.baseState;
    }
    return state;
  }
}
