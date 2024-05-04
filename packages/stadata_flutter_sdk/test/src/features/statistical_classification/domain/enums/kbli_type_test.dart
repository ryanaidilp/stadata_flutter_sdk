import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  group(
    'KBLIType',
    () {
      test(
        'KBLIType is an instance of StatisticalClassification',
        () => expect(KBLIType.y2009, isA<StatisticalClassification>()),
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
    },
  );
}
