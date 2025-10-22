import 'package:injectable/injectable.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class CensusDataResultsCubit extends BaseCubit<BaseState> {
  CensusDataResultsCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  String? _censusID;
  String? _censusAreaID;
  String? _datasetID;

  String? get censusID => _censusID;
  String? get censusAreaID => _censusAreaID;
  String? get datasetID => _datasetID;

  bool get canLoadData {
    return _censusID != null &&
        _censusID!.trim().isNotEmpty &&
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
      return 'Census Area ID is required';
    }
    if (_datasetID == null || _datasetID!.trim().isEmpty) {
      return 'Dataset ID is required';
    }
    return null;
  }

  void initialize({
    required String censusID,
    required String censusAreaID,
    required String datasetID,
  }) {
    _censusID = censusID;
    _censusAreaID = censusAreaID;
    _datasetID = datasetID;
  }

  Future<void> loadData() async {
    if (!canLoadData) {
      return;
    }

    emit(const LoadingState());

    try {
      final result = await _stadataFlutter.list.censusData(
        censusID: _censusID!,
        censusAreaID: _censusAreaID!,
        datasetID: _datasetID!,
      );

      emit(LoadedState<List<CensusData>>(result.data));
    } on Exception catch (error) {
      emit(ErrorState(error.toString()));
    }
  }

  Future<void> refresh() async {
    await loadData();
  }
}
