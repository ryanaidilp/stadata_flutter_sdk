import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  group('KBKILevel', () {
    test(
      'KBKILevel is an instance of ClassificationLevel',
      () => expect(KBKILevel.classes, isA<ClassificationLevel>()),
    );
    group('fromValue', () {
      test(
        'return a valid value if String is valid/known',
        () => expect(KBKILevel.fromValue('komoditas'), KBKILevel.commodity),
      );
      test(
        'return default (KBKILevel.section) if value is not valid/unknown',
        () => expect(KBKILevel.fromValue('unknown'), KBKILevel.section),
      );
    });
    test(
      "KBKILevel.classes has 'kelas' as its value",
      () => expect(KBKILevel.classes.value, 'kelas'),
    );

    test(
      "KBKILevel.commodityGroup has 'kelompok komoditas' as its value",
      () => expect(KBKILevel.commodityGroup.value, 'kelompok komoditas'),
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
      "KBKILevel.commodity has 'komoditas' as its value",
      () => expect(KBKILevel.commodity.value, 'komoditas'),
    );
    test(
      "KBKILevel.subClass has 'subkelas' as its value",
      () => expect(KBKILevel.subClass.value, 'subkelas'),
    );
    group('validateCode', () {
      test(
        'can validate `section` code',
        () => expect(KBKILevel.section.validateCode('1'), isTrue),
      );
      test(
        'can validate `division` code',
        () => expect(KBKILevel.division.validateCode('13'), isTrue),
      );
      test(
        'can validate `group` code',
        () => expect(KBKILevel.group.validateCode('135'), isTrue),
      );
      test(
        'can validate `classes` code',
        () => expect(KBKILevel.classes.validateCode('1357'), isTrue),
      );
      test(
        'can validate `subClass` code',
        () => expect(KBKILevel.subClass.validateCode('13579'), isTrue),
      );
      test(
        'can validate `commodityGroup` code',
        () => expect(KBKILevel.commodityGroup.validateCode('1357911'), isTrue),
      );
      test(
        'can validate `commodity` code',
        () => expect(KBKILevel.commodity.validateCode('1357911013'), isTrue),
      );
    });
  });
}
