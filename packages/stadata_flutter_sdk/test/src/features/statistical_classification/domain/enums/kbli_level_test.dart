import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  group(
    'KBLILevel',
    () {
      test(
        'KBLILevel is an instance of StatisticalClassificationLevel',
        () => expect(KBLILevel.category, isA<StatisticalClassificationLevel>()),
      );

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
        "KBLILevel.primaryGroup has 'pokok' as its value",
        () => expect(KBLILevel.primaryGroup.value, 'pokok'),
      );
      test(
        "KBLILevel.subGroup has 'subgolongan' as its value",
        () => expect(KBLILevel.subGroup.value, 'subgolongan'),
      );
    },
  );
}
