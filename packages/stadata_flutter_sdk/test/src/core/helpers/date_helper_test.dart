import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';

void main() {
  group('DateHelper', () {
    group('formatDate()', () {
      test('should return correct format of yyyy-MM-dd', () {
        final date = DateTime(2024, 3, 29);

        final result = DateHelper.formatDate(date);

        expect(result, '2024-03-29');
      });
    });
  });
}
