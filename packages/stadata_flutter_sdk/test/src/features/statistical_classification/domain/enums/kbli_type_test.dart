import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/features/statistical_classification/domain/enums/enums.dart';

void main() {
  group(
    'KBLIType',
    () {
      test(
        'KBLIType is an instance of ClassificationType',
        () => expect(KBLIType.y2009, isA<ClassificationType>()),
      );
      group(
        'fromValue',
        () {
          test(
            'return a valid value if String is valid/known',
            () => expect(
              KBLIType.fromValue('kbli2017'),
              KBLIType.y2017,
            ),
          );
          test(
            'return default (KBLIType.y2020) if value is not valid/unknown',
            () => expect(
              KBLIType.fromValue('unknown'),
              KBLIType.y2020,
            ),
          );
        },
      );
      test(
        "KBLIType.y2009 has 'kbli2009' as its value",
        () => expect(KBLIType.y2009.value, 'kbli2009'),
      );

      test(
        "KBLIType.y2015 has 'kbli2015' as its value",
        () => expect(KBLIType.y2015.value, 'kbli2015'),
      );

      test(
        "KBLIType.y2017 has 'kbli2017' as its value",
        () => expect(KBLIType.y2017.value, 'kbli2017'),
      );
      test(
        "KBLIType.y2020 has 'kbli2020' as its value",
        () => expect(KBLIType.y2020.value, 'kbli2020'),
      );
      test(
        "year getter return correct 'year' value",
        () => expect(KBLIType.y2015.year, 2015),
      );
      group(
        'urlParamGenerator()',
        () {
          test(
            'will return original code when its already formatted',
            () => expect(
              KBLIType.y2015.urlParamGenerator('kbli_2015_01'),
              'kbli_2015_01',
            ),
          );

          test(
            'will return formatted param with code at the end',
            () => expect(
              KBLIType.y2015.urlParamGenerator('A'),
              'kbli_2015_A',
            ),
          );
        },
      );
    },
  );
}
