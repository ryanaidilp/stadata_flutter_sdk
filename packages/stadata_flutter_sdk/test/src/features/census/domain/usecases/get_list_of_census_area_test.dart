import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';

class MockCensusRepository extends Mock implements CensusRepository {}

void main() {
  late GetListOfCensusArea usecase;
  late CensusRepository mockRepository;
  late ApiResponse<List<CensusArea>> censusAreas;

  setUpAll(() {
    mockRepository = MockCensusRepository();
    usecase = GetListOfCensusArea(repo: mockRepository);

    final jsonCensusAreas = jsonFromFixture(Fixture.censusArea);

    final censusAreaResponse = ApiResponseModel<List<CensusAreaModel>>.fromJson(
      jsonCensusAreas,
      (json) {
        if (json is! List) {
          return [];
        }

        return json.map((e) => CensusAreaModel.fromJson(e as JSON)).toList();
      },
    );

    censusAreas = ApiResponse<List<CensusArea>>(
      status: censusAreaResponse.status,
      data: censusAreaResponse.data,
      dataAvailability: censusAreaResponse.dataAvailability,
      message: censusAreaResponse.message,
      pagination: censusAreaResponse.pagination,
    );
  });

  group('GetListOfCensusArea', () {
    const censusID = 'sp2020';

    test('should return list of census area if success', () async {
      // arrange
      when(
        () => mockRepository.getCensusArea(censusID: any(named: 'censusID')),
      ).thenAnswer((_) async => Result.success(censusAreas));

      // act
      final result = await usecase(censusID);

      // assert
      expect(
        result,
        Result.success<Failure, ApiResponse<List<CensusArea>>>(censusAreas),
      );
      verify(() => mockRepository.getCensusArea(censusID: censusID)).called(1);
    });

    test('should return failure if exception thrown', () async {
      // arrange
      when(
        () => mockRepository.getCensusArea(censusID: any(named: 'censusID')),
      ).thenAnswer((_) async => Result.failure(const CensusAreaFailure()));

      // act
      final result = await usecase(censusID);

      // assert
      expect(
        result,
        Result.failure<Failure, ApiResponse<List<CensusArea>>>(
          const CensusAreaFailure(),
        ),
      );
      verify(() => mockRepository.getCensusArea(censusID: censusID)).called(1);
    });
  });
}
