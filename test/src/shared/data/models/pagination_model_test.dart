import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/pagination.dart';

void main() {
  group(
    'PaginationModel',
    () {
      test(
        'toEntity should return a Pagination entity',
        () {
          const entity = Pagination(
            page: 1,
            pages: 2,
            total: 10,
            perPage: 10,
            count: 20,
          );

          final expected = PaginationModel.fromEntity(entity);

          expect(expected, isA<PaginationModel>());
          expect(expected.page, equals(entity.page));
          expect(expected.pages, equals(entity.pages));
          expect(expected.count, equals(entity.count));
          expect(expected.total, equals(entity.total));
          expect(expected.perPage, equals(entity.perPage));
        },
      );
    },
  );
}
