import 'package:injectable/injectable.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class CensusAreasResultsCubit extends BaseCubit<BaseState> {
  CensusAreasResultsCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  String? _censusID;

  String? get censusID => _censusID;

  bool get canLoadData {
    return _censusID != null && _censusID!.trim().isNotEmpty;
  }

  String? get validationError {
    if (_censusID == null || _censusID!.trim().isEmpty) {
      return 'Census ID is required';
    }
    return null;
  }

  void initialize({required String censusID}) {
    _censusID = censusID;
  }

  Future<void> loadData() async {
    if (!canLoadData) {
      return;
    }

    emit(const LoadingState());

    try {
      final result = await _stadataFlutter.list.censusEventAreas(
        censusID: _censusID!,
      );

      emit(LoadedState<List<CensusArea>>(result.data));
    } on Exception catch (error) {
      emit(ErrorState(error.toString()));
    }
  }

  Future<void> refresh() async {
    await loadData();
  }
}
