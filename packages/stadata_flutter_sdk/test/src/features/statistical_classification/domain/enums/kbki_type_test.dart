import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  group(
    'KBKIType',
    () {
      test(
        'KBKIType is an instance of StatisticalClassification',
        () => expect(KBKIType.y2015, isA<StatisticalClassification>()),
      );

      test(
        "KBKIType.y2009 has 'kbki2015' as its value",
        () => expect(KBKIType.y2015.value, 'kbki2015'),
      );
    },
  );
}
