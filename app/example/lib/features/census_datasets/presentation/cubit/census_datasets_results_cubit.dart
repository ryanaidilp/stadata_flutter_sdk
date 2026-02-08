import 'package:injectable/injectable.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class CensusDatasetsResultsCubit extends BaseCubit<BaseState> {
  CensusDatasetsResultsCubit(this._stadataFlutter)
    : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  String? _censusID;
  int? _topicID;

  String? get censusID => _censusID;
  int? get topicID => _topicID;

  bool get canLoadData {
    return _censusID != null &&
        _censusID!.trim().isNotEmpty &&
        _topicID != null;
  }

  String? get validationError {
    if (_censusID == null || _censusID!.trim().isEmpty) {
      return 'Census ID is required';
    }
    if (_topicID == null) {
      return 'Topic ID is required';
    }
    return null;
  }

  void initialize({required String censusID, required int topicID}) {
    _censusID = censusID;
    _topicID = topicID;
  }

  Future<void> loadData() async {
    if (!canLoadData) {
      return;
    }

    emit(const LoadingState());

    try {
      final result = await _stadataFlutter.list.censusEventDatasets(
        censusID: _censusID!,
        topicID: _topicID!,
      );

      emit(LoadedState<List<CensusDataset>>(result.data));
    } on Exception catch (error) {
      emit(ErrorState(error.toString()));
    }
  }

  Future<void> refresh() async {
    await loadData();
  }
}
