import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';

class MockCensusRepository extends Mock implements CensusRepository {}

void main() {
  late GetListOfCensusEvents usecase;
  late CensusRepository mockRepository;
  late ApiResponse<List<CensusEvent>> censusEvents;

  setUpAll(() {
    mockRepository = MockCensusRepository();
    usecase = GetListOfCensusEvents(repo: mockRepository);

    final jsonCensuses = jsonFromFixture(Fixture.census);

    final censusResponse = ApiResponseModel<List<CensusEventModel>>.fromJson(
      jsonCensuses,
      (json) {
        if (json is! List) {
          return [];
        }

        return json.map((e) => CensusEventModel.fromJson(e as JSON)).toList();
      },
    );

    final censusData = censusResponse.data?.map((e) => e).toList() ?? [];

    censusEvents = ApiResponse(
      status: censusResponse.status,
      data: censusData,
      dataAvailability: censusResponse.dataAvailability,
      message: censusResponse.message,
      pagination: censusResponse.pagination,
    );
  });

  group('GetListOfCensusEvents', () {
    test('should return list of census events if success', () async {
      // arrange
      when(
        () => mockRepository.get(),
      ).thenAnswer((_) async => Result.success(censusEvents));

      // act
      final result = await usecase(NoParams());

      // assert
      expect(
        result,
        Result.success<Failure, ApiResponse<List<CensusEvent>>>(censusEvents),
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
        Result.failure<Failure, ApiResponse<List<CensusEvent>>>(
          const CensusDataFailure(),
        ),
      );
      verify(() => mockRepository.get()).called(1);
    });
  });
}
