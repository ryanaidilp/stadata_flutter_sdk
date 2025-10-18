/// STADATA Flutter SDK - Official Flutter SDK for BPS WebAPI
///
/// A comprehensive Flutter package that provides seamless access to
/// the official API from Badan Pusat Statistik (BPS) Indonesia.
///
/// This SDK enables developers to integrate statistical data from BPS
/// into their Flutter applications with a clean, type-safe interface.
library;

// Main SDK class uses generic catch for initialization error handling
// ignore_for_file: avoid_catches_without_on_clauses

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:stadata_flutter_sdk/src/config/config.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/core/network/stadata_http_interceptor.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/list/list.dart';
import 'package:stadata_flutter_sdk/src/view/view.dart';

// Core exports
export 'src/core/exceptions/exceptions.dart';
export 'src/core/network/stadata_http_interceptor.dart';
// Feature exports - Domain entities and types
export 'src/features/features.dart'
    show
        CensusArea,
        CensusCategory,
        CensusData,
        CensusDataset,
        CensusEvent,
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
// Shared exports
export 'src/shared/shared.dart' show DataAvailability, DataLanguage, ListResult;

/// Main entry point for the STADATA Flutter SDK.
///
/// This singleton class provides access to BPS (Badan Pusat Statistik) Indonesia's
/// statistical data through a clean, type-safe API interface.
///
/// ## Usage
///
/// ```dart
/// // Initialize the SDK
/// final stadata = StadataFlutter.instance;
/// await stadata.init(apiKey: 'your_api_key');
///
/// // Use List API to fetch data collections
/// final domains = await stadata.list.domains();
///
/// // Use View API to fetch detailed information
/// final publication = await stadata.view.publication(
///   id: '123',
///   domain: 'domain_code',
/// );
/// ```
///
/// ## API Structure
///
/// - **List API**: Fetch collections of data (domains, publications, etc.)
/// - **View API**: Fetch detailed information about specific items
///
/// See: https://webapi.bps.go.id/documentation/ for complete API documentation.
class StadataFlutter {
  const StadataFlutter._();

  static const StadataFlutter _instance = StadataFlutter._();

  /// Get the singleton instance of [StadataFlutter].
  static StadataFlutter get instance => _instance;

  /// Access to the List API for fetching collections of data.
  ///
  /// Provides methods to retrieve lists of domains, publications, news,
  /// infographics, and other statistical data from BPS.
  StadataList get list => injector.get<StadataList>();

  /// Access to the View API for fetching detailed information.
  ///
  /// Provides methods to retrieve detailed information about specific
  /// publications, news articles, press releases, and other content.
  StadataView get view => injector.get<StadataView>();

  /// Initialize the SDK with the required API key.
  ///
  /// This method must be called before using any other SDK functionality.
  /// It sets up dependency injection and configures the API client.
  ///
  /// **Parameters:**
  /// - [apiKey]: Valid API key from BPS WebAPI. Register at
  ///   https://webapi.bps.go.id/developer/ to obtain your key.
  /// - [interceptors]: Optional list of custom network interceptors.
  ///   These will be added to all network clients (list, view, and main client).
  ///   Useful for debugging tools like Alice HTTP inspector.
  ///
  /// **Returns:**
  /// - `true` if initialization succeeds
  /// - `false` if initialization fails (invalid API key, network issues, etc.)
  ///
  /// **Example:**
  /// ```dart
  /// final success = await StadataFlutter.instance.init(
  ///   apiKey: 'your_bps_api_key_here',
  ///   interceptors: [
  ///     AliceInterceptor(alice), // For HTTP debugging
  ///     CustomLoggingInterceptor(), // Custom logging
  ///   ],
  /// );
  ///
  /// if (success) {
  ///   // SDK is ready to use
  /// } else {
  ///   // Handle initialization failure
  /// }
  /// ```
  Future<bool> init({
    required String apiKey,
    List<StadataHttpInterceptor>? interceptors,
  }) async {
    try {
      // Validate API key before proceeding
      if (apiKey.isEmpty) {
        throw const ApiKeyNotFoundException();
      }

      // Initialize dependency injection (skip in test environment)
      if (!Platform.environment.containsKey('FLUTTER_TEST')) {
        _initializeDependencyInjection(interceptors ?? []);
      }

      // Configure API client with the provided key
      ApiConfig().apiKey = apiKey;

      return true;
    } catch (e) {
      log('SDK initialization failed: $e', name: 'Stadata Flutter SDK');
      return false;
    }
  }

  /// Initialize all feature dependency injectors.
  ///
  /// This method sets up dependency injection for all SDK features,
  /// ensuring proper instantiation of repositories, use cases, and data sources.
  void _initializeDependencyInjection(
    List<StadataHttpInterceptor> customInterceptors,
  ) {
    Injector.init(
      customInterceptors: customInterceptors,
      modules: [
        // Data and content features
        CensusInjector(),
        DomainInjector(),
        InfographicInjector(),
        NewsInjector(),
        NewsCategoryInjector(),
        PressReleaseInjector(),
        PublicationInjector(),
        StaticTableInjector(),
        // Classification and categorization features
        StatisticalClassificationInjector(),
        StrategicIndicatorInjector(),
        SubjectCategoryInjector(),
        SubjectInjector(),
        // Data structure features
        UnitInjector(),
        VariableInjector(),
        VerticalVariableInjector(),
      ],
    );
  }
}
