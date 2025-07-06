import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockStatisticClassificationRepository extends Mock
    implements StatisticClassificationRepository {}

void main() {
  late StatisticClassificationRepository mockRepository;
  late GetDetailStatisticClassification usecase;
  late ApiResponse<List<StatisticClassification>> statisticClassifications;

  setUpAll(() {
    mockRepository = MockStatisticClassificationRepository();
    registerTestLazySingleton<StatisticClassificationRepository>(
      mockRepository,
    );
    usecase = GetDetailStatisticClassification();

    final jsonStatisticClassifications = jsonFromFixture(
      Fixture.statisticClassification,
    );

    final response =
        ApiResponseModel<List<StatisticClassificationModel>>.fromJson(
          jsonStatisticClassifications,
          (json) {
            if (json is! List<Map>) {
              return [];
            }

            return json.map((json) {
              final data = json['_source'] as JSON;
              return StatisticClassificationModel.fromJson(data);
            }).toList();
          },
        );

    statisticClassifications = ApiResponse<List<StatisticClassification>>(
      status: response.status,
      data: response.data?.map((e) => e).toList(),
      message: response.message,
      dataAvailability: response.dataAvailability,
      pagination: response.pagination,
    );
  });

  tearDownAll(unregisterTestInjection);

  const id = 'kbli_2020_01';

  group('GetDetailStatisticClassification', () {
    test(
      'should return list of statistic classification if call success',
      () async {
        // arrange
        when(
          () => mockRepository.detail(id: id, type: KBLIType.y2020),
        ).thenAnswer((_) async => Result.success(statisticClassifications));

        // act
        final result = await usecase(
          const GetDetailStatisticClassificationParam(
            id: id,
            type: KBLIType.y2020,
          ),
        );

        // assert
        expect(
          result,
          equals(
            Result.success<Failure, ApiResponse<List<StatisticClassification>>>(
              statisticClassifications,
            ),
          ),
        );
        verify(
          () => mockRepository.detail(id: id, type: KBLIType.y2020),
        ).called(1);
      },
    );

    test('should return failure if exception is thrown', () async {
      // arrange
      when(
        () => mockRepository.detail(id: id, type: KBLIType.y2020),
      ).thenAnswer(
        (_) async => Result.failure(
          const StatisticClassificationFailure(
            message: 'Statistic classification not available!',
          ),
        ),
      );

      // act
      final result = await usecase(
        const GetDetailStatisticClassificationParam(
          id: id,
          type: KBLIType.y2020,
        ),
      );

      // assert
      expect(
        result,
        equals(
          Result.failure<Failure, ApiResponse<List<StatisticClassification>>>(
            const StatisticClassificationFailure(
              message: 'Statistic classification not available!',
            ),
          ),
        ),
      );
      verify(
        () => mockRepository.detail(id: id, type: KBLIType.y2020),
      ).called(1);
    });
  });
}
