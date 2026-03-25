import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/config/config.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/core/network/stadata_http_interceptor.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/list/list.dart';
import 'package:stadata_flutter_sdk/src/view/view.dart';

class _NoopHttpInterceptor implements StadataHttpInterceptor {
  @override
  void onError(Object error, StackTrace stackTrace) {}

  @override
  void onRequest(HttpClientRequest request, {dynamic body}) {}

  @override
  void onResponse(
    HttpClientResponse response,
    HttpClientRequest request, {
    dynamic body,
  }) {}
}

void main() {
  setUp(injector.reset);

  tearDown(injector.reset);

  group('Injector.init', () {
    test('should register core services, clients, and feature modules', () {
      Injector.init(
        customInterceptors: <StadataHttpInterceptor>[
          _NoopHttpInterceptor(),
        ],
        modules: <ModuleInjector>[
          CensusInjector(),
          DomainInjector(),
          DynamicTableInjector(),
          InfographicInjector(),
          NewsInjector(),
          NewsCategoryInjector(),
          PressReleaseInjector(),
          PublicationInjector(),
          StaticTableInjector(),
          TableInjector(),
          StatisticalClassificationInjector(),
          StrategicIndicatorInjector(),
          SubjectCategoryInjector(),
          SubjectInjector(),
          DerivedPeriodInjector(),
          DerivedVariableInjector(),
          PeriodInjector(),
          UnitInjector(),
          VariableInjector(),
          VerticalVariableInjector(),
        ],
      );

      expect(injector.isRegistered<ApiConfig>(), isTrue);
      expect(injector.isRegistered<Log>(), isTrue);
      expect(injector.isRegistered<StadataList>(), isTrue);
      expect(injector.isRegistered<StadataView>(), isTrue);

      expect(
        injector.isRegistered<NetworkClient>(
          instanceName: InjectorConstant.listClient,
        ),
        isTrue,
      );
      expect(
        injector.isRegistered<NetworkClient>(
          instanceName: InjectorConstant.viewClient,
        ),
        isTrue,
      );
      expect(
        injector.isRegistered<NetworkClient>(
          instanceName: InjectorConstant.interoparibilityClient,
        ),
        isTrue,
      );

      final listClient = injector.get<NetworkClient>(
        instanceName: InjectorConstant.listClient,
      );
      final viewClient = injector.get<NetworkClient>(
        instanceName: InjectorConstant.viewClient,
      );
      final interoperabilityClient = injector.get<NetworkClient>(
        instanceName: InjectorConstant.interoparibilityClient,
      );

      expect(listClient.baseUrl, '${Env.apiBaseUrl}list/');
      expect(viewClient.baseUrl, '${Env.apiBaseUrl}view/');
      expect(
        interoperabilityClient.baseUrl,
        '${Env.apiBaseUrl}interoperabilitas/',
      );
    });

    test('should instantiate all primary use cases from each feature', () {
      Injector.init(
        modules: <ModuleInjector>[
          CensusInjector(),
          DomainInjector(),
          DynamicTableInjector(),
          InfographicInjector(),
          NewsInjector(),
          NewsCategoryInjector(),
          PressReleaseInjector(),
          PublicationInjector(),
          StaticTableInjector(),
          TableInjector(),
          StatisticalClassificationInjector(),
          StrategicIndicatorInjector(),
          SubjectCategoryInjector(),
          SubjectInjector(),
          DerivedPeriodInjector(),
          DerivedVariableInjector(),
          PeriodInjector(),
          UnitInjector(),
          VariableInjector(),
          VerticalVariableInjector(),
        ],
      );

      expect(
        injector.get<GetListOfCensusEvents>(),
        isA<GetListOfCensusEvents>(),
      );
      expect(injector.get<GetListOfCensusTopic>(), isA<GetListOfCensusTopic>());
      expect(injector.get<GetListOfCensusArea>(), isA<GetListOfCensusArea>());
      expect(
        injector.get<GetListOfCensusDatasets>(),
        isA<GetListOfCensusDatasets>(),
      );
      expect(injector.get<GetCensusData>(), isA<GetCensusData>());

      expect(injector.get<GetDomains>(), isA<GetDomains>());
      expect(injector.get<GetAllDynamicTables>(), isA<GetAllDynamicTables>());
      expect(
        injector.get<GetDetailDynamicTable>(),
        isA<GetDetailDynamicTable>(),
      );
      expect(injector.get<GetAllInfographics>(), isA<GetAllInfographics>());
      expect(injector.get<GetAllNews>(), isA<GetAllNews>());
      expect(injector.get<GetDetailNews>(), isA<GetDetailNews>());
      expect(injector.get<GetAllNewsCategories>(), isA<GetAllNewsCategories>());

      expect(injector.get<GetAllPressReleases>(), isA<GetAllPressReleases>());
      expect(
        injector.get<GetDetailPressRelease>(),
        isA<GetDetailPressRelease>(),
      );
      expect(injector.get<GetAllPublication>(), isA<GetAllPublication>());
      expect(injector.get<GetDetailPublication>(), isA<GetDetailPublication>());

      expect(injector.get<GetAllStaticTables>(), isA<GetAllStaticTables>());
      expect(injector.get<GetDetailStaticTable>(), isA<GetDetailStaticTable>());
      expect(injector.get<GetTableMetadata>(), isA<GetTableMetadata>());

      expect(
        injector.get<GetStatisticClassification>(),
        isA<GetStatisticClassification>(),
      );
      expect(
        injector.get<GetDetailStatisticClassification>(),
        isA<GetDetailStatisticClassification>(),
      );

      expect(
        injector.get<GetAllStrategicIndicators>(),
        isA<GetAllStrategicIndicators>(),
      );
      expect(
        injector.get<GetAllSubjectCategories>(),
        isA<GetAllSubjectCategories>(),
      );
      expect(injector.get<GetAllSubjects>(), isA<GetAllSubjects>());
      expect(injector.get<GetAllDerivedPeriods>(), isA<GetAllDerivedPeriods>());
      expect(
        injector.get<GetAllDerivedVariables>(),
        isA<GetAllDerivedVariables>(),
      );
      expect(injector.get<GetAllPeriods>(), isA<GetAllPeriods>());
      expect(injector.get<GetAllUnits>(), isA<GetAllUnits>());
      expect(injector.get<GetAllVariables>(), isA<GetAllVariables>());
      expect(
        injector.get<GetAllVerticalVariables>(),
        isA<GetAllVerticalVariables>(),
      );
    });
  });
}
