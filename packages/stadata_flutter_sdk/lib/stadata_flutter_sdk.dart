/// A Very Good Project created by Very Good CLI.
library stadata_flutter_sdk;

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:stadata_flutter_sdk/src/config/config.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/list/list.dart';
import 'package:stadata_flutter_sdk/src/view/view.dart';

export 'src/core/exceptions/exceptions.dart';
export 'src/features/features.dart'
    show
        Census,
        CensusTopic,
        ClassificationLevel,
        ClassificationType,
        DomainEntity,
        DomainType,
        Infographic,
        KBKILevel,
        KBKIType,
        KBLILevel,
        KBLIType,
        News,
        NewsCategory,
        PressRelease,
        Publication,
        StaticTable,
        StatisticClassification,
        StrategicIndicator,
        Subject,
        SubjectCategory,
        UnitData,
        Variable,
        VerticalVariable;
export 'src/shared/shared.dart' show DataAvailability, DataLanguage, ListResult;

/// Stadata Flutter class
class StadataFlutter {
  const StadataFlutter._();

  static const StadataFlutter _instance = StadataFlutter._();

  /// Get an instance of [StadataFlutter]
  static StadataFlutter get instance => _instance;

  /// Get an instance of [StadataList]
  StadataList get list => injector.get<StadataList>();

  /// Get an instance of [StadataView]
  StadataView get view => injector.get<StadataView>();

  /// Initialize Stadata configuration and set apiKey
  ///
  /// And return false when initialization failed.
  /// Will return true if initialization success.

  Future<bool> init({required String apiKey}) async {
    try {
      if (!Platform.environment.containsKey('FLUTTER_TEST')) {
        Injector.init(
          modules: [
            CensusDataInjector(),
            DomainInjector(),
            InfographicInjector(),
            NewsInjector(),
            NewsCategoryInjector(),
            PressReleaseInjector(),
            PublicationInjector(),
            StaticTableInjector(),
            StatisticalClassificationInjector(),
            StrategicIndicatorInjector(),
            SubjectCategoryInjector(),
            SubjectInjector(),
            UnitInjector(),
            VariableInjector(),
            VerticalVariableInjector(),
          ],
        );
      }

      if (apiKey.isEmpty) {
        throw const ApiKeyNotFoundException();
      }

      ApiConfig().apiKey = apiKey;

      return true;
    } catch (e) {
      log('$e', name: 'Stadata Flutter SDK');
      return false;
    }
  }
}
