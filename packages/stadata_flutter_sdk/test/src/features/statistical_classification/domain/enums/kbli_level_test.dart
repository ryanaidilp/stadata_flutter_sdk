import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  group('KBLILevel', () {
    test(
      'KBLILevel is an instance of ClassificationLevel',
      () => expect(KBLILevel.category, isA<ClassificationLevel>()),
    );
    group('fromValue', () {
      test(
        'return a valid value if String is valid/known',
        () => expect(KBLILevel.fromValue('kelompok'), KBLILevel.cluster),
      );
      test(
        'return default (KBLILevel.category) if value is not valid/unknown',
        () => expect(KBLILevel.fromValue('unknown'), KBLILevel.category),
      );
    });
    test(
      "KBLILevel.category has 'kategori' as its value",
      () => expect(KBLILevel.category.value, 'kategori'),
    );

    test(
      "KBLILevel.cluster has 'kelompok' as its value",
      () => expect(KBLILevel.cluster.value, 'kelompok'),
    );

    test(
      "KBLILevel.group has 'golongan' as its value",
      () => expect(KBLILevel.group.value, 'golongan'),
    );
    test(
      "KBLILevel.primaryGroup has 'golongan pokok' as its value",
      () => expect(KBLILevel.primaryGroup.value, 'golongan pokok'),
    );
    test(
      "KBLILevel.subGroup has 'subgolongan' as its value",
      () => expect(KBLILevel.subGroup.value, 'subgolongan'),
    );
    group('validateCode', () {
      test(
        'can validate `category` code',
        () => expect(KBLILevel.category.validateCode('A'), isTrue),
      );
      test(
        'can validate `primaryGroup` code',
        () => expect(KBLILevel.primaryGroup.validateCode('A1'), isTrue),
      );
      test(
        'can validate `group` code',
        () => expect(KBLILevel.group.validateCode('A13'), isTrue),
      );
      test(
        'can validate `subGroup` code',
        () => expect(KBLILevel.subGroup.validateCode('A133'), isTrue),
      );
      test(
        'can validate `cluster` code',
        () => expect(KBLILevel.cluster.validateCode('A1335'), isTrue),
      );
    });
  });
}
