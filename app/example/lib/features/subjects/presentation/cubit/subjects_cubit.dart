import 'package:injectable/injectable.dart';
import 'package:stadata_example/core/utils/debouncer.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class SubjectsState extends BaseState {
  const SubjectsState({required this.baseState, this.stateVersion = 0});

  final BaseState baseState;
  final int stateVersion;

  @override
  List<Object?> get props => [baseState, stateVersion];
}

@injectable
class SubjectsCubit extends BaseCubit<BaseState> {
  SubjectsCubit() : super(const InitialState());

  String? _domain;
  DataLanguage _currentLanguage = DataLanguage.id;
  int? _subjectCategoryID;
  final Debouncer _debouncer = Debouncer(
    delay: const Duration(milliseconds: 800),
  );

  int _stateVersion = 0;

  String? get domain => _domain;
  DataLanguage get currentLanguage => _currentLanguage;
  int? get subjectCategoryID => _subjectCategoryID;

  bool get canLoadData {
    return _domain != null && _domain!.trim().isNotEmpty;
  }

  String? get validationError {
    if (_domain == null || _domain!.trim().isEmpty) {
      return 'Domain is required';
    }
    return null;
  }

  void initialize() {}

  void setDomain(String? domain) {
    _domain = domain;
    _stateVersion++;
    emit(
      SubjectsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
  }

  void changeLanguage(DataLanguage language) {
    _currentLanguage = language;
    _stateVersion++;
    emit(
      SubjectsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
  }

  void setSubjectCategoryID(int? subjectCategoryID) {
    _subjectCategoryID = subjectCategoryID;
    _stateVersion++;
    emit(
      SubjectsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
  }

  void clearFilters() {
    _subjectCategoryID = null;
    _stateVersion++;
    emit(
      SubjectsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
  }

  BaseState _extractBaseState(BaseState state) {
    if (state is SubjectsState) {
      return state.baseState;
    }
    return state;
  }

  @override
  Future<void> close() {
    _debouncer.dispose();
    return super.close();
  }
}
