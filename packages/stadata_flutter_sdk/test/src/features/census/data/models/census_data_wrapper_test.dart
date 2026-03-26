import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  group('CensusDataWrapper', () {
    test('fromJson should parse wrapper with timestamp and data', () {
      final json = {
        'status': 200,
        'data_count': 1,
        'timestamp': '2026-01-20T10:30:00.000Z',
        'data': [
          {
            'id_wilayah': '1667',
            'kode_wilayah': '0',
            'nama_wilayah': 'INDONESIA',
            'id_indikator': '7204701',
            'nama_indikator': 'Jumlah Penduduk',
            'period': '2022',
            'nilai': 6084498,
          },
        ],
      };

      final result = CensusDataWrapper.fromJson(json);

      expect(result.status, 200);
      expect(result.dataCount, 1);
      expect(result.data, hasLength(1));
      expect(result.timestamp, DateTime.parse('2026-01-20T10:30:00.000Z'));
    });

    test(
      'fromJson should apply defaults for invalid timestamp and null data',
      () {
        final nowBefore = DateTime.now();

        final result = CensusDataWrapper.fromJson(const {
          'status': null,
          'data_count': null,
          'timestamp': 'invalid',
          'data': null,
        });

        final nowAfter = DateTime.now();

        expect(result.status, 200);
        expect(result.dataCount, 0);
        expect(result.data, isEmpty);
        expect(result.timestamp.isAfter(nowBefore), isTrue);
        expect(
          result.timestamp.isBefore(nowAfter.add(const Duration(seconds: 1))),
          isTrue,
        );
      },
    );

    test('toJson should convert wrapper back to expected structure', () {
      final wrapper = CensusDataWrapper(
        status: 200,
        dataCount: 0,
        timestamp: DateTime(2026),
        data: const [],
      );

      final result = wrapper.toJson();

      expect(result['status'], 200);
      expect(result['data_count'], 0);
      expect(result['timestamp'], DateTime(2026).toIso8601String());
      expect(result['data'], <dynamic>[]);
    });

    test('props should support equality', () {
      final wrapperA = CensusDataWrapper(
        status: 200,
        dataCount: 1,
        timestamp: DateTime(2026),
        data: const [],
      );
      final wrapperB = CensusDataWrapper(
        status: 200,
        dataCount: 1,
        timestamp: DateTime(2026),
        data: const [],
      );

      expect(wrapperA, wrapperB);
    });
  });
}
