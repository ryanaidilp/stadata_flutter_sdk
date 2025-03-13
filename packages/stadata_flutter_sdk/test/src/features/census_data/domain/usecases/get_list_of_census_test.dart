import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';

class MockCensusRepository extends Mock implements CensusRepository {}

void main() {
  late GetListOfCensus usecase;
  late CensusRepository mockRepository;
  late ApiResponse<List<Census>> censuses;

  setUpAll(() {
    mockRepository = MockCensusRepository();
    usecase = GetListOfCensus(repo: mockRepository);

    final jsonCensuses = jsonFromFixture(Fixture.census);

    final censusResponse = ApiResponseModel<List<CensusModel>>.fromJson(
      jsonCensuses,
      (json) {
        if (json is! List) {
          return [];
        }

        return json.map((e) => CensusModel.fromJson(e as JSON)).toList();
      },
    );

    final censusData = censusResponse.data?.map((e) => e).toList() ?? [];

    censuses = ApiResponse(
      status: censusResponse.status,
      data: censusData,
      dataAvailability: censusResponse.dataAvailability,
      message: censusResponse.message,
      pagination: censusResponse.pagination,
    );
  });

  group('GetListOfCensus', () {
    test('should return list of census if success', () async {
      // arrange
      when(
        () => mockRepository.get(),
      ).thenAnswer((_) async => Result.success(censuses));

      // act
      final result = await usecase(NoParams());

      // assert
      expect(
        result,
        Result.success<Failure, ApiResponse<List<Census>>>(censuses),
      );
      verify(() => mockRepository.get()).called(1);
    });

    test('should return failure if exception thrown', () async {
      // arrange
      when(
        () => mockRepository.get(),
      ).thenAnswer((_) async => Result.failure(const CensusDataFailure()));

      // act
      final result = await usecase(NoParams());

      // assert
      expect(
        result,
        Result.failure<Failure, ApiResponse<List<Census>>>(
          const CensusDataFailure(),
        ),
      );
      verify(() => mockRepository.get()).called(1);
    });
  });
}
