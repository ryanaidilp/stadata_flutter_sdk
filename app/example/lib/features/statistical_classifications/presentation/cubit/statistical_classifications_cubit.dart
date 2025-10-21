import 'package:injectable/injectable.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class StatisticalClassificationsState extends BaseState {
  const StatisticalClassificationsState({
    required this.baseState,
    this.stateVersion = 0,
  });

  final BaseState baseState;
  final int stateVersion;

  @override
  List<Object?> get props => [baseState, stateVersion];
}

@injectable
class StatisticalClassificationsCubit extends BaseCubit<BaseState> {
  StatisticalClassificationsCubit(this._stadataFlutter)
    : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  KBLIType _type = KBLIType.y2020;
  KBLILevel? _level;
  DataLanguage _currentLanguage = DataLanguage.id;
  int _stateVersion = 0;

  KBLIType get type => _type;
  KBLILevel? get level => _level;
  DataLanguage get currentLanguage => _currentLanguage;

  bool get canLoadData {
    return true; // Type is always selected (has default value)
  }

  void initialize() {}

  void setType(KBLIType type) {
    _type = type;
    _stateVersion++;
    emit(
      StatisticalClassificationsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
  }

  void setLevel(KBLILevel? level) {
    _level = level;
    _stateVersion++;
    emit(
      StatisticalClassificationsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
  }

  void changeLanguage(DataLanguage language) {
    _currentLanguage = language;
    _stateVersion++;
    emit(
      StatisticalClassificationsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
  }

  BaseState _extractBaseState(BaseState state) {
    if (state is StatisticalClassificationsState) {
      return state.baseState;
    }
    return state;
  }
}
