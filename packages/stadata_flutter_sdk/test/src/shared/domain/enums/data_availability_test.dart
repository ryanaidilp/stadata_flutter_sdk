import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

void main() {
  group(
    'DataAvailability',
    () {
      test(
        'DataAvailability.available return available',
        () => expect(DataAvailability.available.value, equals('available')),
      );

      test(
        'DataAvailability.listNotAvailable return list-not-available',
        () => expect(
          DataAvailability.listNotAvailable.value,
          equals('list-not-available'),
        ),
      );

      test(
        'DataAvailability.notAvailable return not-available',
        () => expect(
          DataAvailability.notAvailable.value,
          equals('not-available'),
        ),
      );
    },
  );
}
