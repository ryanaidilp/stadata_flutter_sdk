import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

void main() {
  group('PaginationModel', () {
    test('fromEntity should return a PaginationModel from entity', () {
      const entity = Pagination(
        page: 1,
        pages: 2,
        total: 10,
        perPage: 10,
        count: 20,
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
  });
}
