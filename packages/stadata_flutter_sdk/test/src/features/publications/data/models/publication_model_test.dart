import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  group(
    'PublicationModel',
    () {
      test(
        'fromEntity should return PublicationModel from its entity',
        () {
          const entity = Publication(
            id: '219dajkda3108',
            title: 'Mock Publication',
            issn: 'issn',
            cover: 'cover',
            pdf: 'pdf',
            size: '2Mb',
            abstract: 'abstract',
            catalogueNumber: 'catalogue number',
            publicationNumber: 'publication number',
          );

          final expected = PublicationModel.fromEntity(entity);

          expect(expected, isA<PublicationModel>());
        },
      );
    },
  );
}
