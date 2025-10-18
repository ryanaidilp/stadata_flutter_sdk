import 'package:alice/alice.dart';
import 'package:alice/model/alice_configuration.dart';
import 'package:alice_http_client/alice_http_client_adapter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Alice service for HTTP debugging
///
/// Provides a global Alice instance that can be used throughout the app
/// for HTTP request/response inspection.
class AliceService {
  static Alice? _instance;

  /// Get the global Alice instance
  static Alice? get instance => _instance;

  static AliceHttpClientAdapter? _adapterInstance;

  static AliceHttpClientAdapter? get adapterInstance => _adapterInstance;

  /// Initialize Alice (debug mode only)
  static void initialize({required GlobalKey<NavigatorState> navigatorKey}) {
    if (kDebugMode) {
      try {
        _instance = Alice(
          configuration: AliceConfiguration(
            showShareButton: true,
            showNotification: true,
            navigatorKey: navigatorKey,
          ),
        );
        final adapter = AliceHttpClientAdapter();
        _adapterInstance = adapter;
        _instance?.addAdapter(_adapterInstance!);
        debugPrint('Alice HTTP Inspector initialized successfully');
      } catch (e) {
        debugPrint('Failed to initialize Alice: $e');
      }
    }
  }

  /// Open Alice inspector
  static void openInspector(BuildContext context) {
    if (kDebugMode && _instance != null) {
      try {
        _instance!.showInspector();
      } catch (e) {
        debugPrint('Alice inspector failed to open: $e');
        debugPrint('This might be because Alice needs a NavigatorKey');
        debugPrint('HTTP requests are being logged to console instead');
        debugPrint('Check debug console for 🔍 ALICE REQUEST/RESPONSE logs');
      }
    }
  }

  /// Check if Alice is available
  static bool get isAvailable => kDebugMode && _instance != null;
}
