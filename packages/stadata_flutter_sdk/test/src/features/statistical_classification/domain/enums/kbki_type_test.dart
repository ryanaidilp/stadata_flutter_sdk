import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  group('KBKIType', () {
    test(
      'KBKIType is an instance of ClassificationType',
      () => expect(KBKIType.y2015, isA<ClassificationType>()),
    );
    group('fromValue', () {
      test(
        'return a valid value if String is valid/known',
        () => expect(KBKIType.fromValue('kbki2015'), KBKIType.y2015),
      );
      test(
        'return default (KBKIType.y2015) if value is not valid/unknown',
        () => expect(KBKIType.fromValue('unknown'), KBKIType.y2015),
      );
    });
    test(
      "KBKIType.y2015 has 'kbki2015' as its value",
      () => expect(KBKIType.y2015.value, 'kbki2015'),
    );
    test(
      "year getter return correct 'year' value",
      () => expect(KBKIType.y2015.year, 2015),
    );
    group('urlParamGenerator()', () {
      test(
        'will return original code when its already formatted',
        () => expect(
          KBKIType.y2015.urlParamGenerator('kbki_2015_01'),
          'kbki_2015_01',
        ),
      );

      test(
        'will return formatted param with code at the end',
        () => expect(KBKIType.y2015.urlParamGenerator('A'), 'kbki_2015_A'),
      );
    });
  });
}
