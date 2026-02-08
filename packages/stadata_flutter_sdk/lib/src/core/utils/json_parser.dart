import 'dart:async';
import 'dart:isolate';

import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';

/// Utility class for parsing JSON in background isolates.
///
/// This class provides methods to parse heavy JSON responses without blocking
/// the main UI thread. Uses Dart's `Isolate.spawn()` for better control and
/// performance compared to `compute()`.
///
/// Example usage:
/// ```dart
/// final model = await JsonParser.parse<DynamicTableModel>(
///   jsonData,
///   DynamicTableModel.fromDetailJson,
/// );
/// ```
class JsonParser {
  /// Private constructor to prevent instantiation
  const JsonParser._();

  /// Parses JSON data in a background isolate.
  ///
  /// **Parameters:**
  /// - [json]: The JSON data to parse (Map&lt;String, dynamic&gt;)
  /// - [parser]: A top-level or static function that converts JSON to `T`
  ///
  /// **Returns:**
  /// A Future that completes with the parsed model of type `T`
  ///
  /// **Note:**
  /// The [parser] function must be a top-level function or a static method
  /// because isolates cannot access instance methods or closures.
  ///
  /// **Throws:**
  /// Any exception thrown by the parser function will be propagated.
  static Future<T> parse<T>(
    JSON json,
    T Function(JSON) parser,
  ) async {
    // ALWAYS use isolate for API response parsing
    // Even "small" JSON can have heavy parsing (nested objects, type conversions)
    // The isolate overhead (~5ms) is negligible compared to potential UI blocking

    final receivePort = ReceivePort();

    try {
      await Isolate.spawn(
        _parseInIsolate<T>,
        _IsolateMessage<T>(
          sendPort: receivePort.sendPort,
          json: json,
          parser: parser,
        ),
        debugName: 'JsonParser.parse<$T>',
      );

      // Wait for result from isolate
      final response = await receivePort.first as _IsolateResponse;

      if (response.error != null) {
        // Re-throw the error from isolate with original stack trace
        Error.throwWithStackTrace(
          response.error! as Object,
          response.stackTrace ?? StackTrace.current,
        );
      }

      return response.result as T;
    } finally {
      receivePort.close();
    }
  }

  /// Parses a list of JSON objects in a background isolate.
  ///
  /// **Parameters:**
  /// - [jsonList]: The list of JSON objects to parse
  /// - [parser]: A top-level or static function that converts JSON to `T`
  ///
  /// **Returns:**
  /// A Future that completes with a list of parsed models of type `T`
  ///
  /// **Note:**
  /// The [parser] function must be a top-level function or a static method.
  ///
  /// **Performance:**
  /// Uses a threshold of 5 items to determine when to use isolate parsing.
  /// This is intentionally VERY conservative because:
  /// - Census data: ~2160+ operations for 432 items (5 categories each)
  /// - Even 5-10 items can cause noticeable UI jank with heavy parsing
  /// - Isolate overhead (~5ms) is minimal compared to main thread blocking
  /// - Better safe than sorry - UI responsiveness is paramount
  static Future<List<T>> parseList<T>(
    List<JSON> jsonList,
    T Function(JSON) parser,
  ) async {
    // VERY AGGRESSIVE THRESHOLD: Use isolate for 5+ items
    // Better to use isolate unnecessarily than to block UI even slightly
    if (jsonList.length < 5) {
      return jsonList.map(parser).toList();
    }

    // For larger lists, spawn isolate to avoid blocking UI
    final receivePort = ReceivePort();

    try {
      await Isolate.spawn(
        _parseListInIsolate<T>,
        _IsolateListMessage<T>(
          sendPort: receivePort.sendPort,
          jsonList: jsonList,
          parser: parser,
        ),
        debugName: 'JsonParser.parseList<$T> (${jsonList.length} items)',
      );

      // Wait for result from isolate
      final response = await receivePort.first as _IsolateResponse;

      if (response.error != null) {
        Error.throwWithStackTrace(
          response.error! as Object,
          response.stackTrace ?? StackTrace.current,
        );
      }

      return response.result as List<T>;
    } finally {
      receivePort.close();
    }
  }

  /// Internal function that runs in the isolate for single object parsing.
  /// This is the entry point for the spawned isolate.
  static void _parseInIsolate<T>(_IsolateMessage<T> message) {
    try {
      final result = message.parser(message.json);
      message.sendPort.send(_IsolateResponse(result: result));
    } on Exception catch (error, stackTrace) {
      message.sendPort.send(
        _IsolateResponse(error: error, stackTrace: stackTrace),
      );
    }
  }

  /// Internal function that runs in the isolate for list parsing.
  /// This is the entry point for the spawned isolate.
  static void _parseListInIsolate<T>(_IsolateListMessage<T> message) {
    try {
      final result = message.jsonList.map(message.parser).toList();
      message.sendPort.send(_IsolateResponse(result: result));
    } on Exception catch (error, stackTrace) {
      message.sendPort.send(
        _IsolateResponse(error: error, stackTrace: stackTrace),
      );
    }
  }
}

/// Message sent to isolate for parsing a single JSON object.
class _IsolateMessage<T> {
  const _IsolateMessage({
    required this.sendPort,
    required this.json,
    required this.parser,
  });

  final SendPort sendPort;
  final JSON json;
  final T Function(JSON) parser;
}

/// Message sent to isolate for parsing a list of JSON objects.
class _IsolateListMessage<T> {
  const _IsolateListMessage({
    required this.sendPort,
    required this.jsonList,
    required this.parser,
  });

  final SendPort sendPort;
  final List<JSON> jsonList;
  final T Function(JSON) parser;
}

/// Response sent back from isolate containing either result or error.
class _IsolateResponse {
  const _IsolateResponse({this.result, this.error, this.stackTrace});

  final dynamic result;
  final dynamic error;
  final StackTrace? stackTrace;
}
