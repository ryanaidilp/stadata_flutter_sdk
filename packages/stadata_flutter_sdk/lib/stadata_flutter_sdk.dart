/// A Very Good Project created by Very Good CLI.
library stadata_flutter_sdk;

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:stadata_flutter_sdk/src/core/constants/constants.dart';
import 'package:stadata_flutter_sdk/src/core/di/injector.dart';
import 'package:stadata_flutter_sdk/src/core/exceptions/exceptions.dart';
import 'package:stadata_flutter_sdk/src/core/storage/local_storage.dart';
import 'package:stadata_flutter_sdk/src/features/domains/injector/domain_injector.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/features/infographics/injector/infographic_injector.dart';
import 'package:stadata_flutter_sdk/src/features/news/injector/news_injector.dart';
import 'package:stadata_flutter_sdk/src/features/news_categories/injector/news_category_injector.dart';
import 'package:stadata_flutter_sdk/src/features/press_releases/injector/press_release_injector.dart';
import 'package:stadata_flutter_sdk/src/features/publications/injector/publication_injector.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/injector/static_table_injector.dart';
import 'package:stadata_flutter_sdk/src/features/strategic_indicators/injector/strategic_indicator_injector.dart';
import 'package:stadata_flutter_sdk/src/features/subject_categories/injector/subject_category_injector.dart';
import 'package:stadata_flutter_sdk/src/features/subjects/injector/subject_injector.dart';
import 'package:stadata_flutter_sdk/src/features/units/injector/unit_injector.dart';
import 'package:stadata_flutter_sdk/src/features/variables/injector/variable_injector.dart';
import 'package:stadata_flutter_sdk/src/features/vertical_variables/injector/vertical_variable_injector.dart';
import 'package:stadata_flutter_sdk/src/list/list.dart';
import 'package:stadata_flutter_sdk/src/view/view.dart';

export 'src/core/exceptions/exceptions.dart';
export 'src/features/features.dart'
    show
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
export 'src/shared/shared.dart';

/// Stadata Flutter class
class StadataFlutter {
  StadataFlutter._();

  static final StadataFlutter _instance = StadataFlutter._();

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

  Future<bool> init({
    required String apiKey,
  }) async {
    try {
      if (!Platform.environment.containsKey('FLUTTER_TEST')) {
        Injector.init(
          modules: [
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

      final storage = injector.get<LocalStorage>(instanceName: 'secure');
      if (apiKey.isEmpty) {
        throw const ApiKeyNotFoundException();
      }

      final existingKey = await storage.get(StorageConstant.apiKey);

      if (existingKey == null || existingKey != apiKey) {
        final result = await storage.save(
          StorageConstant.apiKey,
          apiKey,
        );
        return result;
      }

      return true;
    } catch (e) {
      log('$e', name: 'Stadata Flutter SDK');
      return false;
    }
  }
}
