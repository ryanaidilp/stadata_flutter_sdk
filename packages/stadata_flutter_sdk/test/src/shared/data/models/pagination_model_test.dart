import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

void main() {
  group('PaginationModel', () {
    const tPage = 1;
    const tPages = 2;
    const tTotal = 10;
    const tPerPage = 10;
    const tCount = 20;

    const tModel = PaginationModel(
      page: tPage,
      pages: tPages,
      total: tTotal,
      perPage: tPerPage,
      count: tCount,
    );

    final tJson = <String, dynamic>{
      'total': tTotal,
      'page': tPage,
      'pages': tPages,
      'per_page': tPerPage,
      'count': tCount,
    };

    test('fromEntity should return a PaginationModel from entity', () {
      const entity = Pagination(
        page: tPage,
        pages: tPages,
        total: tTotal,
        perPage: tPerPage,
        count: tCount,
      );

      final expected = PaginationModel(
        page: entity.page,
        pages: entity.pages,
        total: entity.total,
        count: entity.count,
        perPage: entity.perPage,
      );

      expect(expected, isA<PaginationModel>());
      expect(expected.page, equals(entity.page));
      expect(expected.pages, equals(entity.pages));
      expect(expected.count, equals(entity.count));
      expect(expected.total, equals(entity.total));
      expect(expected.perPage, equals(entity.perPage));
    });

    group('fromJson', () {
      test('should return a valid model when all fields are present', () {
        // act
        final result = PaginationModel.fromJson(tJson);

        // assert
        expect(result.page, equals(tPage));
        expect(result.pages, equals(tPages));
        expect(result.total, equals(tTotal));
        expect(result.perPage, equals(tPerPage));
        expect(result.count, equals(tCount));
      });

      test('should default page and pages to 0 when null', () {
        // arrange
        final json = <String, dynamic>{
          'total': tTotal,
          'page': null,
          'pages': null,
          'per_page': null,
          'count': null,
        };

        // act
        final result = PaginationModel.fromJson(json);

        // assert
        expect(result.page, equals(0));
        expect(result.pages, equals(0));
        expect(result.perPage, isNull);
        expect(result.count, isNull);
        expect(result.total, equals(tTotal));
      });
    });

    group('toJson', () {
      test('should return a JSON map with all fields', () {
        // act
        final result = tModel.toJson();

        // assert
        expect(result, isA<JSON>());
        expect(result['total'], equals(tTotal));
        expect(result['page'], equals(tPage));
        expect(result['pages'], equals(tPages));
        expect(result['per_page'], equals(tPerPage));
        expect(result['count'], equals(tCount));
      });

      test('should round-trip fromJson -> toJson correctly', () {
        // act
        final model = PaginationModel.fromJson(tJson);
        final result = model.toJson();

        // assert
        expect(result, equals(tJson));
      });
    });

    group('copyWith', () {
      test('should return updated model with new page', () {
        // act
        final result = tModel.copyWith(page: 3);

        // assert
        expect(result.page, equals(3));
        expect(result.pages, equals(tPages));
        expect(result.total, equals(tTotal));
      });

      test('should return updated model with new total', () {
        // act
        final result = tModel.copyWith(total: 100);

        // assert
        expect(result.total, equals(100));
        expect(result.page, equals(tPage));
        expect(result.pages, equals(tPages));
      });

      test('should update nullable perPage via ValueGetter', () {
        // act
        final result = tModel.copyWith(perPage: () => 20);

        // assert
        expect(result.perPage, equals(20));
        expect(result.total, equals(tTotal));
      });

      test('should set perPage to null via ValueGetter returning null', () {
        // act
        final result = tModel.copyWith(perPage: () => null);

        // assert
        expect(result.perPage, isNull);
        expect(result.total, equals(tTotal));
      });

      test('should update nullable count via ValueGetter', () {
        // act
        final result = tModel.copyWith(count: () => 50);

        // assert
        expect(result.count, equals(50));
        expect(result.total, equals(tTotal));
      });

      test('should return identical values when no parameters provided', () {
        // act
        final result = tModel.copyWith();

        // assert
        expect(result.page, equals(tPage));
        expect(result.pages, equals(tPages));
        expect(result.total, equals(tTotal));
        expect(result.perPage, equals(tPerPage));
        expect(result.count, equals(tCount));
        expect(result, equals(tModel));
      });
    });

    group('inheritance', () {
      test('should be a subclass of Pagination', () {
        expect(tModel, isA<Pagination>());
      });

      test('should be a subclass of BaseEntity', () {
        expect(tModel, isA<BaseEntity>());
      });
    });
  });
}
