import 'package:injectable/injectable.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';

@injectable
class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit() : super(const HomeInitial());

  void initialize() {
    emit(const HomeLoaded());
  }
}

// Home States
abstract class HomeState extends BaseState {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoaded extends HomeState {
  const HomeLoaded();
}
