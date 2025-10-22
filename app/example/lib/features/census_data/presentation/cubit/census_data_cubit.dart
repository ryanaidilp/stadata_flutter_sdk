import 'package:injectable/injectable.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class CensusDataState extends BaseState {
  const CensusDataState({
    required this.baseState,
    this.stateVersion = 0,
    this.censusEvents = const [],
    this.censusTopics = const [],
    this.censusAreas = const [],
    this.censusDatasets = const [],
  });

  final BaseState baseState;
  final int stateVersion;
  final List<CensusEvent> censusEvents;
  final List<CensusTopic> censusTopics;
  final List<CensusArea> censusAreas;
  final List<CensusDataset> censusDatasets;

  @override
  List<Object?> get props => [
    baseState,
    stateVersion,
    censusEvents,
    censusTopics,
    censusAreas,
    censusDatasets,
  ];
}

@injectable
class CensusDataCubit extends BaseCubit<BaseState> {
  CensusDataCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  String? _censusID;
  int? _topicID;
  String? _censusAreaID;
  String? _datasetID;
  List<CensusEvent> _censusEvents = [];
  List<CensusTopic> _censusTopics = [];
  List<CensusArea> _censusAreas = [];
  List<CensusDataset> _censusDatasets = [];
  int _stateVersion = 0;

  String? get censusID => _censusID;
  int? get topicID => _topicID;
  String? get censusAreaID => _censusAreaID;
  String? get datasetID => _datasetID;
  List<CensusEvent> get censusEvents => _censusEvents;
  List<CensusTopic> get censusTopics => _censusTopics;
  List<CensusArea> get censusAreas => _censusAreas;
  List<CensusDataset> get censusDatasets => _censusDatasets;

  bool get canLoadTopicsAndAreas {
    return _censusID != null && _censusID!.trim().isNotEmpty;
  }

  bool get canLoadDatasets {
    return canLoadTopicsAndAreas && _topicID != null;
  }

  bool get canLoadData {
    return canLoadTopicsAndAreas &&
        _censusAreaID != null &&
        _censusAreaID!.trim().isNotEmpty &&
        _datasetID != null &&
        _datasetID!.trim().isNotEmpty;
  }

  String? get validationError {
    if (_censusID == null || _censusID!.trim().isEmpty) {
      return 'Census ID is required';
    }
    if (_censusAreaID == null || _censusAreaID!.trim().isEmpty) {
      return 'Census Area is required';
    }
    if (_datasetID == null || _datasetID!.trim().isEmpty) {
      return 'Dataset is required';
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
        CensusDataState(
          baseState: LoadedState<List<CensusEvent>>(_censusEvents),
          stateVersion: _stateVersion,
          censusEvents: _censusEvents,
          censusTopics: _censusTopics,
          censusAreas: _censusAreas,
          censusDatasets: _censusDatasets,
        ),
      );
    } on Exception catch (error) {
      _stateVersion++;
      emit(
        CensusDataState(
          baseState: ErrorState(error.toString()),
          stateVersion: _stateVersion,
          censusEvents: _censusEvents,
          censusTopics: _censusTopics,
          censusAreas: _censusAreas,
          censusDatasets: _censusDatasets,
        ),
      );
    }
  }

  Future<void> loadTopicsAndAreas() async {
    if (!canLoadTopicsAndAreas) {
      return;
    }

    _stateVersion++;
    emit(
      CensusDataState(
        baseState: const LoadingState(),
        stateVersion: _stateVersion,
        censusEvents: _censusEvents,
        censusTopics: _censusTopics,
        censusAreas: _censusAreas,
        censusDatasets: _censusDatasets,
      ),
    );

    try {
      // Load topics and areas in parallel
      final results = await Future.wait([
        _stadataFlutter.list.censusTopics(censusID: _censusID!),
        _stadataFlutter.list.censusEventAreas(censusID: _censusID!),
      ]);

      _censusTopics = results[0].data as List<CensusTopic>;
      _censusAreas = results[1].data as List<CensusArea>;
      _stateVersion++;
      emit(
        CensusDataState(
          baseState: const LoadedState<bool>(true),
          stateVersion: _stateVersion,
          censusEvents: _censusEvents,
          censusTopics: _censusTopics,
          censusAreas: _censusAreas,
          censusDatasets: _censusDatasets,
        ),
      );
    } on Exception catch (error) {
      _stateVersion++;
      emit(
        CensusDataState(
          baseState: ErrorState(error.toString()),
          stateVersion: _stateVersion,
          censusEvents: _censusEvents,
          censusTopics: _censusTopics,
          censusAreas: _censusAreas,
          censusDatasets: _censusDatasets,
        ),
      );
    }
  }

  Future<void> loadDatasets() async {
    if (!canLoadDatasets) {
      return;
    }

    _stateVersion++;
    emit(
      CensusDataState(
        baseState: const LoadingState(),
        stateVersion: _stateVersion,
        censusEvents: _censusEvents,
        censusTopics: _censusTopics,
        censusAreas: _censusAreas,
        censusDatasets: _censusDatasets,
      ),
    );

    try {
      final result = await _stadataFlutter.list.censusEventDatasets(
        censusID: _censusID!,
        topicID: _topicID!,
      );

      _censusDatasets = result.data;
      _stateVersion++;
      emit(
        CensusDataState(
          baseState: LoadedState<List<CensusDataset>>(_censusDatasets),
          stateVersion: _stateVersion,
          censusEvents: _censusEvents,
          censusTopics: _censusTopics,
          censusAreas: _censusAreas,
          censusDatasets: _censusDatasets,
        ),
      );
    } on Exception catch (error) {
      _stateVersion++;
      emit(
        CensusDataState(
          baseState: ErrorState(error.toString()),
          stateVersion: _stateVersion,
          censusEvents: _censusEvents,
          censusTopics: _censusTopics,
          censusAreas: _censusAreas,
          censusDatasets: _censusDatasets,
        ),
      );
    }
  }

  void setCensusID(String? censusID) {
    _censusID = censusID;
    _topicID = null;
    _censusAreaID = null;
    _datasetID = null;
    _censusTopics = [];
    _censusAreas = [];
    _censusDatasets = [];
    _stateVersion++;
    emit(
      CensusDataState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
        censusEvents: _censusEvents,
        censusTopics: _censusTopics,
        censusAreas: _censusAreas,
        censusDatasets: _censusDatasets,
      ),
    );

    if (canLoadTopicsAndAreas) {
      loadTopicsAndAreas();
    }
  }

  void setTopicID(int? topicID) {
    _topicID = topicID;
    _datasetID = null;
    _censusDatasets = [];
    _stateVersion++;
    emit(
      CensusDataState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
        censusEvents: _censusEvents,
        censusTopics: _censusTopics,
        censusAreas: _censusAreas,
        censusDatasets: _censusDatasets,
      ),
    );

    if (canLoadDatasets) {
      loadDatasets();
    }
  }

  void setCensusAreaID(String? censusAreaID) {
    _censusAreaID = censusAreaID;
    _stateVersion++;
    emit(
      CensusDataState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
        censusEvents: _censusEvents,
        censusTopics: _censusTopics,
        censusAreas: _censusAreas,
        censusDatasets: _censusDatasets,
      ),
    );
  }

  void setDatasetID(String? datasetID) {
    _datasetID = datasetID;
    _stateVersion++;
    emit(
      CensusDataState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
        censusEvents: _censusEvents,
        censusTopics: _censusTopics,
        censusAreas: _censusAreas,
        censusDatasets: _censusDatasets,
      ),
    );
  }

  /// Fetch census areas with client-side pagination and search
  /// for SearchableDropdown compatibility.
  /// Since the API doesn't support pagination, we load all areas once
  /// and then paginate/filter on the client side.
  Future<List<CensusArea>> fetchCensusAreas({
    required int page,
    String? searchText,
  }) async {
    if (!canLoadTopicsAndAreas) {
      return [];
    }

    try {
      // Use cached areas if already loaded, otherwise fetch
      if (_censusAreas.isEmpty) {
        final result = await _stadataFlutter.list.censusEventAreas(
          censusID: _censusID!,
        );
        _censusAreas = result.data;
      }

      // Apply search filter if provided
      var filteredAreas = _censusAreas;
      if (searchText != null && searchText.trim().isNotEmpty) {
        final searchLower = searchText.toLowerCase();
        filteredAreas =
            _censusAreas.where((area) {
              return area.id.toString().contains(searchLower) ||
                  area.name.toLowerCase().contains(searchLower) ||
                  area.slug.toLowerCase().contains(searchLower);
            }).toList();
      }

      // Implement client-side pagination
      const itemsPerPage = 10;
      final startIndex = (page - 1) * itemsPerPage;
      final endIndex = startIndex + itemsPerPage;

      // Return empty if page is beyond available data
      if (startIndex >= filteredAreas.length) {
        return [];
      }

      // Return the paginated subset
      final paginatedAreas = filteredAreas.sublist(
        startIndex,
        endIndex > filteredAreas.length ? filteredAreas.length : endIndex,
      );

      // If this is the last page and we have exactly 10 items,
      // remove the last item to signal end of list to the dropdown
      if (endIndex >= filteredAreas.length && paginatedAreas.length == 10) {
        return paginatedAreas.sublist(0, 9);
      }

      return paginatedAreas;
    } catch (e) {
      return [];
    }
  }

  BaseState _extractBaseState(BaseState state) {
    if (state is CensusDataState) {
      return state.baseState;
    }
    return state;
  }
}
