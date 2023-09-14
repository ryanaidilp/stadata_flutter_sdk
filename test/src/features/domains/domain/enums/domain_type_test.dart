import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/features/domains/domain/enums/domain_type.dart';

void main() {
  group(
    'DomainType',
    () {
      test(
        'DomainType.all should return all',
        () => expect(
          DomainType.all.value,
          'all',
        ),
      );

      test(
        'DomainType.regency should return kab',
        () => expect(
          DomainType.regency.value,
          'kab',
        ),
      );

      test(
        'DomainType.province should return prov',
        () => expect(
          DomainType.province.value,
          'prov',
        ),
      );

      test(
        'DomainType.regencyByProvince should return kabbyprov',
        () => expect(
          DomainType.regencyByProvince.value,
          'kabbyprov',
        ),
      );
    },
  );
}
