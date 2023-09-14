// Package imports:
// Project imports:

// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/storage/local_storage.dart';

@Named('secure')
@LazySingleton(as: LocalStorage)
class SecureStorageImpl implements LocalStorage {
  SecureStorageImpl();
  final FlutterSecureStorage storage = getIt<FlutterSecureStorage>();

  @override
  Future<dynamic> get(String key) async => storage.read(key: key);

  @override
  Future<bool> remove(String key) async {
    try {
      await storage.delete(key: key);
      return true;
    } catch (e) {
      log(e.toString(), name: 'StadataError');
      return false;
    }
  }

  @override
  Future<bool> save(String key, dynamic value) async {
    try {
      await storage.write(key: key, value: value.toString());
      return true;
    } catch (e) {
      log(e.toString(), name: 'StadataError');
      return false;
    }
  }

  @override
  Future<bool> has(String key) async {
    return Future.value(storage.containsKey(key: key));
  }
}
