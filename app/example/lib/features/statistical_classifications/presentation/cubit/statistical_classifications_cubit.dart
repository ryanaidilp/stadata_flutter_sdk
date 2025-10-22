import 'package:injectable/injectable.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

enum ClassificationCategory { kbli, kbki }

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
  StatisticalClassificationsCubit() : super(const InitialState());

  ClassificationCategory _category = ClassificationCategory.kbli;
  ClassificationType _type = KBLIType.y2020;
  ClassificationLevel? _level;
  DataLanguage _currentLanguage = DataLanguage.id;
  int _stateVersion = 0;

  ClassificationCategory get category => _category;
  ClassificationType get type => _type;
  ClassificationLevel? get level => _level;
  DataLanguage get currentLanguage => _currentLanguage;

  bool get canLoadData {
    return true; // Type is always selected (has default value)
  }

  void initialize() {}

  void setCategory(ClassificationCategory category) {
    if (_category == category) return;

    _category = category;
    // Reset type and level when category changes
    if (category == ClassificationCategory.kbli) {
      _type = KBLIType.y2020;
      _level = null;
    } else {
      _type = KBKIType.y2015;
      _level = null;
    }
    _stateVersion++;
    emit(
      StatisticalClassificationsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
  }

  void setType(ClassificationType type) {
    _type = type;
    _level = null; // Reset level when type changes
    _stateVersion++;
    emit(
      StatisticalClassificationsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
  }

  void setLevel(ClassificationLevel? level) {
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
