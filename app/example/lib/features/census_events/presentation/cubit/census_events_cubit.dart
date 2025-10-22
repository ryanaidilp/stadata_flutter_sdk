import 'package:injectable/injectable.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class CensusEventsCubit extends BaseCubit<BaseState> {
  CensusEventsCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  Future<void> loadData() async {
    emit(const LoadingState());

    try {
      final result = await _stadataFlutter.list.censusEvents();
      emit(LoadedState<List<CensusEvent>>(result.data));
    } on Exception catch (error) {
      emit(ErrorState(error.toString()));
    }
  }

  Future<void> refresh() async {
    await loadData();
  }
}
