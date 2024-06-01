import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';

void main() {
  test(
    'toString should print message of the failure',
    () => expect(
      const DomainFailure().toString(),
      equals('Failed to load domain data!'),
    ),
  );
}
