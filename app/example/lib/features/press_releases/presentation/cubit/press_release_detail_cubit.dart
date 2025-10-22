import 'package:injectable/injectable.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class PressReleaseDetailCubit extends BaseCubit<BaseState> {
  PressReleaseDetailCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;
  DataLanguage _currentLanguage = DataLanguage.id;
  String _currentDomain = '7200';

  DataLanguage get currentLanguage => _currentLanguage;
  String get currentDomain => _currentDomain;

  void changeLanguage(DataLanguage language) {
    _currentLanguage = language;
  }

  void changeDomain(String domain) {
    _currentDomain = domain;
  }

  Future<void> loadPressReleaseDetail(int pressReleaseId) async {
    emit(const LoadingState());

    try {
      final result = await _stadataFlutter.view.pressRelease(
        id: pressReleaseId,
        domain: _currentDomain,
        lang: _currentLanguage,
      );

      if (result != null) {
        emit(LoadedState<PressRelease>(result));
      } else {
        emit(const ErrorState('No data received from API'));
      }
    } on Exception catch (error) {
      emit(ErrorState(error.toString()));
    }
  }

  Future<void> refresh(int pressReleaseId) async {
    await loadPressReleaseDetail(pressReleaseId);
  }
}
