import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';

class MockCensusRepository extends Mock implements CensusRepository {}

void main() {
  late final GetListOfCensusTopic usecase;
  late final CensusRepository mockRepository;
  late final ApiResponse<List<CensusTopic>> censusTopics;

  setUpAll(() {
    mockRepository = MockCensusRepository();
    usecase = GetListOfCensusTopic(repo: mockRepository);

    final jsonCensusTopics = jsonFromFixture(Fixture.censusTopic);

    final censusTopicResponse =
        ApiResponseModel<List<CensusTopicModel>>.fromJson(jsonCensusTopics, (
          json,
        ) {
          if (json == null || json is! List) {
            return [];
          }

          return json.map((e) => CensusTopicModel.fromJson(e as JSON)).toList();
        });

    censusTopics = ApiResponse(
      status: censusTopicResponse.status,
      pagination: censusTopicResponse.pagination,
      data: censusTopicResponse.data,
      message: censusTopicResponse.message,
      dataAvailability: censusTopicResponse.dataAvailability,
    );
  });

  group('GetListOfCensusTopic', () {
    const censusID = 'sp2020';

    test('should return list of census topics if success', () async {
      // arrange
      when(
        () => mockRepository.getCensusTopics(censusID: any(named: 'censusID')),
      ).thenAnswer((_) async => Result.success(censusTopics));

      // act
      final result = await usecase.call(censusID);

      // assert
      expect(
        result,
        Result.success<Failure, ApiResponse<List<CensusTopic>>>(censusTopics),
      );

      verify(
        () => mockRepository.getCensusTopics(censusID: censusID),
      ).called(1);
    });

    test('should return failure if exceptio throw', () async {
      // arrange
      when(
        () => mockRepository.getCensusTopics(censusID: any(named: 'censusID')),
      ).thenAnswer((_) async => Result.failure(const CensusTopicFailure()));

      // act
      final result = await usecase.call(censusID);

      // assert
      expect(
        result,
        Result.failure<Failure, ApiResponse<List<CensusTopic>>>(
          const CensusTopicFailure(),
        ),
      );

      verify(
        () => mockRepository.getCensusTopics(censusID: censusID),
      ).called(1);
    });
  });
}
