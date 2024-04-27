// Package imports:
// Project imports:

// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:stadata_flutter_sdk/src/core/di/injector.dart';
import 'package:stadata_flutter_sdk/src/core/storage/local_storage.dart';

class SecureStorageImpl implements LocalStorage {
  SecureStorageImpl();
  final FlutterSecureStorage storage = injector.get<FlutterSecureStorage>();

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
