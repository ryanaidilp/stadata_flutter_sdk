import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class MockCensusRepository extends Mock implements CensusRepository {}

void main() {
  late GetCensusData usecase;
  late CensusRepository mockRepository;
  late ApiResponse<List<CensusData>> censusDataResponse;

  setUpAll(() {
    mockRepository = MockCensusRepository();
    usecase = GetCensusData(repo: mockRepository);

    // Create sample census data based on fixture structure
    final categories = [
      const CensusCategory(
        id: '1022',
        name: 'Klasifikasi Kelompok Umur',
        itemID: '1292',
        itemCode: '2',
        itemName: '5-9',
      ),
      const CensusCategory(
        id: '1027',
        name: 'Klasifikasi Perkotaan dan Perdesaan',
        itemID: '1358',
        itemCode: '1',
        itemName: 'Perkotaan',
      ),
    ];

    final sampleCensusData = CensusData(
      regionID: '1667',
      regionCode: '0',
      regionName: 'INDONESIA',
      indicatorID: '7204701',
      indicatorName: 'Jumlah Penduduk Berumur 5 Tahun ke Atas',
      categories: categories,
      period: '2022',
      value: 6084498,
    );

    final censusData = [sampleCensusData];

    censusDataResponse = ApiResponse(
      status: true,
      data: censusData,
      dataAvailability: DataAvailability.available,
    );
  });

  group('GetCensusData', () {
    const tParam = GetCensusDataParam(
      censusID: 'sp2020',
      censusAreaID: '1667',
      datasetID: 'dataset123',
    );

    test('should return list of census data if success', () async {
      // arrange
      when(
        () => mockRepository.getCensusData(
          censusID: any(named: 'censusID'),
          censusAreaID: any(named: 'censusAreaID'),
          datasetID: any(named: 'datasetID'),
        ),
      ).thenAnswer((_) async => Result.success(censusDataResponse));

      // act
      final result = await usecase(tParam);

      // assert
      expect(
        result,
        Result.success<Failure, ApiResponse<List<CensusData>>>(
          censusDataResponse,
        ),
      );
      verify(
        () => mockRepository.getCensusData(
          censusID: 'sp2020',
          censusAreaID: '1667',
          datasetID: 'dataset123',
        ),
      ).called(1);
    });

    test('should return failure if exception thrown', () async {
      // arrange
      when(
        () => mockRepository.getCensusData(
          censusID: any(named: 'censusID'),
          censusAreaID: any(named: 'censusAreaID'),
          datasetID: any(named: 'datasetID'),
        ),
      ).thenAnswer((_) async => Result.failure(const CensusDataFailure()));

      // act
      final result = await usecase(tParam);

      // assert
      expect(
        result,
        Result.failure<Failure, ApiResponse<List<CensusData>>>(
          const CensusDataFailure(),
        ),
      );
      verify(
        () => mockRepository.getCensusData(
          censusID: 'sp2020',
          censusAreaID: '1667',
          datasetID: 'dataset123',
        ),
      ).called(1);
    });
  });

  group('GetCensusDataParam', () {
    const tParam = GetCensusDataParam(
      censusID: 'sp2020',
      censusAreaID: '1667',
      datasetID: 'dataset123',
    );

    test('should be a subclass of BaseEntity', () {
      // assert
      expect(tParam, isA<BaseEntity>());
    });

    test('should return correct props', () {
      // act
      final props = tParam.props;

      // assert
      expect(
        props,
        ['sp2020', '1667', 'dataset123'],
      );
    });

    test('should support equality comparison', () {
      // arrange
      const anotherParam = GetCensusDataParam(
        censusID: 'sp2020',
        censusAreaID: '1667',
        datasetID: 'dataset123',
      );

      // assert
      expect(tParam, equals(anotherParam));
    });

    test('should not be equal when properties differ', () {
      // arrange
      const differentParam = GetCensusDataParam(
        censusID: 'sp2021',
        censusAreaID: '1668',
        datasetID: 'dataset456',
      );

      // assert
      expect(tParam, isNot(equals(differentParam)));
    });
  });
}
