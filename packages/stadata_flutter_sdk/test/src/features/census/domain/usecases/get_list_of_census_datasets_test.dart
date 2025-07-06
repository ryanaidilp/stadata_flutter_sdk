import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';

class MockCensusRepository extends Mock implements CensusRepository {}

void main() {
  late GetListOfCensusDatasets usecase;
  late CensusRepository mockRepository;
  late ApiResponse<List<CensusDataset>> censusDatasets;

  setUpAll(() {
    mockRepository = MockCensusRepository();
    usecase = GetListOfCensusDatasets(repo: mockRepository);

    final jsonCensusDatasets = jsonFromFixture(Fixture.censusDatasets);

    censusDatasets = ApiResponseModel<List<CensusDatasetModel>>.fromJson(
      jsonCensusDatasets,
      (json) {
        if (json is! List) {
          return [];
        }

        return json.map((e) => CensusDatasetModel.fromJson(e as JSON)).toList();
      },
    );
  });

  group('GetListOfCensusDatasets', () {
    test('should return list of census dataset if success', () async {
      // arrange
      when(
        () => mockRepository.getCensusDatasets(
          censusID: any(named: 'censusID'),
          topicID: any(named: 'topicID'),
        ),
      ).thenAnswer((_) async => Result.success(censusDatasets));

      // act
      final result = await usecase(
        const GetListOfCensusDatasetsParam(censusID: 'sp2020', topicID: 9),
      );

      // assert
      expect(
        result,
        Result.success<Failure, ApiResponse<List<CensusDataset>>>(
          censusDatasets,
        ),
      );
      verify(
        () => mockRepository.getCensusDatasets(censusID: 'sp2020', topicID: 9),
      ).called(1);
    });

    test('should return failure if exception thrown', () async {
      // arrange
      const failure = CensusDatasetFailure();
      when(
        () => mockRepository.getCensusDatasets(
          censusID: any(named: 'censusID'),
          topicID: any(named: 'topicID'),
        ),
      ).thenAnswer((_) async => Result.failure(failure));

      // act
      final result = await usecase(
        const GetListOfCensusDatasetsParam(censusID: 'sp2020', topicID: 9),
      );

      // assert
      expect(
        result,
        Result.failure<Failure, ApiResponse<List<CensusDataset>>>(failure),
      );
      verify(
        () => mockRepository.getCensusDatasets(censusID: 'sp2020', topicID: 9),
      ).called(1);
    });
  });
}
