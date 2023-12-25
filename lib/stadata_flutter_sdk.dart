/// A Very Good Project created by Very Good CLI.
library stadata_flutter_sdk;

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:stadata_flutter_sdk/src/core/constants/constants.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/exceptions/exceptions.dart';
import 'package:stadata_flutter_sdk/src/core/storage/local_storage.dart';
import 'package:stadata_flutter_sdk/src/list/list.dart';
import 'package:stadata_flutter_sdk/src/view/view.dart';

export 'src/core/exceptions/exceptions.dart';
export 'src/features/features.dart'
    show
        DomainEntity,
        DomainType,
        Infographic,
        News,
        NewsCategory,
        PressRelease,
        Publication,
        StaticTable,
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
  StadataList get list => getIt<StadataList>();

  /// Get an instance of [StadataView]
  StadataView get view => getIt<StadataView>();

  /// Initialize Stadata configuration and set apiKey
  ///
  /// And return false when initialization failed.
  /// Will return true if initialization success.

  Future<bool> init({
    required String apiKey,
  }) async {
    try {
      if (!Platform.environment.containsKey('FLUTTER_TEST')) {
        unawaited(configureDependencies());
      }

      final storage = getIt<LocalStorage>(instanceName: 'secure');
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
