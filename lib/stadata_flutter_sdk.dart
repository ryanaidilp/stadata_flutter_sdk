/// A Very Good Project created by Very Good CLI.
library stadata_flutter_sdk;

import 'dart:developer';

import 'package:stadata_flutter_sdk/src/core/constants/constants.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/exceptions/exceptions.dart';
import 'package:stadata_flutter_sdk/src/core/storage/local_storage.dart';
import 'package:stadata_flutter_sdk/src/list/list.dart';
import 'package:stadata_flutter_sdk/src/view/view.dart';

export 'src/core/exceptions/exceptions.dart';
export 'src/features/domains/domains.dart';
export 'src/features/infographics/infographics.dart';
export 'src/features/publications/publications.dart';
export 'src/shared/domain/entities/list_result.dart';
export 'src/shared/domain/enums/data_availability.dart';
export 'src/shared/domain/enums/data_language.dart';

/// Stadata Flutter class
class StadataFlutter {
  StadataFlutter._();

  static final StadataFlutter _instance = StadataFlutter._();

  /// Get an instance of [StadataFlutter]
  static StadataFlutter get instance => _instance;

  final _list = getIt<StadataList>();

  final _view = getIt<StadataView>();

  /// Get an instance of [StadataList]
  StadataList get list => _list;

  /// Get an instance of [StadataView]
  StadataView get view => _view;

  final LocalStorage _storage = getIt<LocalStorage>(instanceName: 'secure');

  /// Initialize Stadata configuration and set apiKey
  ///
  /// And return false when initialization failed.
  /// Will return true if initialization success.

  Future<bool> init({
    required String apiKey,
  }) async {
    try {
      if (apiKey.isEmpty) {
        throw const ApiKeyNotFoundException();
      }

      final existingKey = await _storage.get(StorageConstant.apiKey);

      if (existingKey == null || existingKey != apiKey) {
        final result = await _storage.save(
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
