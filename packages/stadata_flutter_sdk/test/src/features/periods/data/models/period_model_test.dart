import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  group('PeriodModel', () {
    const tId = 117;
    const tYear = 2017;

    const tPeriodModel = PeriodModel(
      id: tId,
      year: tYear,
    );

    const tPeriodEntity = Period(
      id: tId,
      year: tYear,
    );

    final tJson = <String, dynamic>{
      'th_id': tId,
      'th': tYear,
    };

    group('fromJson', () {
      test('should return a valid PeriodModel from JSON', () {
        // act
        final result = PeriodModel.fromJson(tJson);

        // assert
        expect(result, equals(tPeriodModel));
        expect(result.id, equals(tId));
        expect(result.year, equals(tYear));
      });

      test('should handle different id and year values correctly', () {
        // arrange
        final json = <String, dynamic>{
          'th_id': 108,
          'th': 2008,
        };

        // act
        final result = PeriodModel.fromJson(json);

        // assert
        expect(result.id, equals(108));
        expect(result.year, equals(2008));
      });
    });

    group('toJson', () {
      test('should return a JSON map containing proper data', () {
        // act
        final result = tPeriodModel.toJson();

        // assert
        expect(result, equals(tJson));
        expect(result['th_id'], equals(tId));
        expect(result['th'], equals(tYear));
      });

      test('should return JSON matching the BPS API format', () {
        // act
        final result = tPeriodModel.toJson();

        // assert
        expect(result, isA<JSON>());
        expect(result.containsKey('th_id'), isTrue);
        expect(result.containsKey('th'), isTrue);
        expect(result.keys.length, equals(2));
      });
    });

    group('fromEntity', () {
      test('should create PeriodModel from Period entity', () {
        // act
        final result = PeriodModel.fromEntity(tPeriodEntity);

        // assert
        expect(result, equals(tPeriodModel));
        expect(result, isA<PeriodModel>());
        expect(result.id, equals(tPeriodEntity.id));
        expect(result.year, equals(tPeriodEntity.year));
      });

      test('should preserve all entity properties', () {
        // arrange
        const entity = Period(
          id: 115,
          year: 2015,
        );

        // act
        final result = PeriodModel.fromEntity(entity);

        // assert
        expect(result.id, equals(entity.id));
        expect(result.year, equals(entity.year));
      });
    });

    group('copyWith', () {
      test('should return a new instance with updated id', () {
        // act
        final result = tPeriodModel.copyWith(id: 116);

        // assert
        expect(result.id, equals(116));
        expect(result.year, equals(tYear));
        expect(result, isNot(same(tPeriodModel)));
      });

      test('should return a new instance with updated year', () {
        // act
        final result = tPeriodModel.copyWith(year: 2016);

        // assert
        expect(result.id, equals(tId));
        expect(result.year, equals(2016));
        expect(result, isNot(same(tPeriodModel)));
      });

      test('should return a new instance with all fields updated', () {
        // act
        final result = tPeriodModel.copyWith(
          id: 115,
          year: 2015,
        );

        // assert
        expect(result.id, equals(115));
        expect(result.year, equals(2015));
        expect(result, isNot(same(tPeriodModel)));
      });

      test(
        'should return a copy with same values when no parameters provided',
        () {
          // act
          final result = tPeriodModel.copyWith();

          // assert
          expect(result.id, equals(tId));
          expect(result.year, equals(tYear));
          expect(result, isNot(same(tPeriodModel)));
          expect(result, equals(tPeriodModel));
        },
      );
    });

    group('equality', () {
      test('should be equal when properties are the same', () {
        // arrange
        const model1 = PeriodModel(id: 117, year: 2017);
        const model2 = PeriodModel(id: 117, year: 2017);

        // assert
        expect(model1, equals(model2));
        expect(model1.hashCode, equals(model2.hashCode));
      });

      test('should not be equal when id is different', () {
        // arrange
        const model1 = PeriodModel(id: 117, year: 2017);
        const model2 = PeriodModel(id: 116, year: 2017);

        // assert
        expect(model1, isNot(equals(model2)));
      });

      test('should not be equal when year is different', () {
        // arrange
        const model1 = PeriodModel(id: 117, year: 2017);
        const model2 = PeriodModel(id: 117, year: 2016);

        // assert
        expect(model1, isNot(equals(model2)));
      });
    });

    group('inheritance', () {
      test('should be a subclass of Period', () {
        // assert
        expect(tPeriodModel, isA<Period>());
      });

      test('should be a subclass of BaseEntity', () {
        // assert
        expect(tPeriodModel, isA<BaseEntity>());
      });
    });
  });
}
