import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/features/domains/data/models/domain_model.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

void main() {
  group(
    'DomainModel',
    () {
      test(
        'fromEntity should return DomainModel from DomainEntity',
        () {
          const entity = DomainEntity(
            id: '7200',
            name: 'Sulawesi Tengah',
            url: 'https://sultengprov.bps.go.id',
          );

          final expected = DomainModel.fromEntity(entity);

          expect(expected, isA<DomainModel>());
        },
      );
    },
  );
}
