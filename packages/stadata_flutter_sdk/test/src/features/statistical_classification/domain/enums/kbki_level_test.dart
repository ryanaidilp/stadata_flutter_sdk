import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  group(
    'KBKILevel',
    () {
      test(
        'KBKILevel is an instance of StatisticalClassificationLevel',
        () => expect(KBKILevel.classes, isA<StatisticalClassificationLevel>()),
      );

      test(
        "KBKILevel.classes has 'kelas' as its value",
        () => expect(KBKILevel.classes.value, 'kelas'),
      );

      test(
        "KBKILevel.commodityGroup has 'komoditas' as its value",
        () => expect(KBKILevel.commodityGroup.value, 'komoditas'),
      );

      test(
        "KBKILevel.division has 'divisi' as its value",
        () => expect(KBKILevel.division.value, 'divisi'),
      );
      test(
        "KBKILevel.group has 'kelompok' as its value",
        () => expect(KBKILevel.group.value, 'kelompok'),
      );
      test(
        "KBKILevel.section has 'seksi' as its value",
        () => expect(KBKILevel.section.value, 'seksi'),
      );
      test(
        "KBKILevel.subClass has 'subkelas' as its value",
        () => expect(KBKILevel.subClass.value, 'subkelas'),
      );
    },
  );
}
