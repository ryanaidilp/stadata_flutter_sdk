/// A Very Good Project created by Very Good CLI.
library stadata_flutter_sdk;

import 'package:stadata_flutter_sdk/src/core/constants/constants.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/exceptions/exceptions.dart';
import 'package:stadata_flutter_sdk/src/core/log/log.dart';
import 'package:stadata_flutter_sdk/src/core/storage/local_storage.dart';
import 'package:stadata_flutter_sdk/src/list/list.dart';

export 'src/core/exceptions/exceptions.dart';
export 'src/list/domains/domains.dart';
export 'src/list/list.dart';
export 'src/view/view.dart';

/// Stadata Flutter class
class StadataFlutter {
  StadataFlutter._();

  static final StadataFlutter _instance = StadataFlutter._();

  /// Get an instance of [StadataFlutter]
  static StadataFlutter get instance => _instance;

  /// Get an instance of [StadataList]
  StadataList get list => getIt<StadataList>();

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

      await configureDependencies();

      final existingKey = await getIt<LocalStorage>(instanceName: 'secure')
          .get(StorageConstant.apiKey);

      if (existingKey == null) {
        return await getIt<LocalStorage>(instanceName: 'secure').save(
          StorageConstant.apiKey,
          apiKey,
        );
      }

      return true;
    } catch (e) {
      await getIt<Log>().console('Stadata Flutter SDK - $e');
      return false;
    }
  }
}
