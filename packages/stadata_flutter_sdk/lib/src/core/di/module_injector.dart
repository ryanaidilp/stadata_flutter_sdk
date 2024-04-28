// ignore_for_file: public_member_api_docs

import 'package:stadata_flutter_sdk/src/core/di/injector.dart';

abstract class ModuleInjector {
  void injectRepositories(Injector injector);
  void injectDataSources(Injector injector);
  void injectUseCases(Injector injector);
}
