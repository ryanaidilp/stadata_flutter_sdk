import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  group('PublicationModel', () {
    test('fromEntity should return PublicationModel from its entity', () {
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
    });

    test(
      'fromEntity should preserve relatedPublications from entity',
      () {
        final relatedPub = RelatedPublication(
          id: 'related_id_123',
          title: 'Related Publication Title',
          releaseDate: DateTime.parse('2023-01-15'),
          url: 'https://example.com/publication',
          cover: 'https://example.com/cover.jpg',
        );

        final entity = Publication(
          id: '219dajkda3108',
          title: 'Mock Publication',
          issn: 'issn',
          cover: 'cover',
          pdf: 'pdf',
          size: '2Mb',
          abstract: 'abstract',
          catalogueNumber: 'catalogue number',
          publicationNumber: 'publication number',
          relatedPublications: [relatedPub],
        );

        final model = PublicationModel.fromEntity(entity);

        expect(model, isA<PublicationModel>());
        expect(model.relatedPublications, hasLength(1));
        expect(model.relatedPublications.first.id, equals('related_id_123'));
        expect(
          model.relatedPublications.first.title,
          equals('Related Publication Title'),
        );
      },
    );

    test('fromJson should correctly parse related publications', () {
      final json = <String, dynamic>{
        'pub_id': 'pub_123',
        'title': 'Test Publication',
        'issn': '1234-5678',
        'cover': 'https://example.com/cover.jpg',
        'pdf': 'https://example.com/publication.pdf',
        'size': '2.5 MB',
        'abstract': 'This is a test publication',
        'kat_no': 'CAT-001',
        'pub_no': 'PUB-001',
        'related': [
          {
            'pub_id': 'related_1',
            'title': 'Related Publication 1',
            'rl_date': '2023-01-15',
            'url': 'https://example.com/related1',
            'cover': 'https://example.com/related1_cover.jpg',
          },
          {
            'pub_id': 'related_2',
            'title': 'Related Publication 2',
            'rl_date': '2023-02-20',
            'url': 'https://example.com/related2',
            'cover': 'https://example.com/related2_cover.jpg',
          },
        ],
      };

      final model = PublicationModel.fromJson(json);

      expect(model, isA<PublicationModel>());
      expect(model.id, equals('pub_123'));
      expect(model.title, equals('Test Publication'));

      // Verify related publications
      expect(model.relatedPublications, hasLength(2));
      expect(model.relatedPublications[0].id, equals('related_1'));
      expect(
        model.relatedPublications[0].title,
        equals('Related Publication 1'),
      );
      expect(model.relatedPublications[1].id, equals('related_2'));
      expect(
        model.relatedPublications[1].title,
        equals('Related Publication 2'),
      );
    });

    test('fromJson should handle missing related field', () {
      final json = <String, dynamic>{
        'pub_id': 'pub_123',
        'title': 'Test Publication',
        'issn': '1234-5678',
        'cover': 'https://example.com/cover.jpg',
        'pdf': 'https://example.com/publication.pdf',
        'size': '2.5 MB',
        'abstract': 'This is a test publication',
        'kat_no': 'CAT-001',
        'pub_no': 'PUB-001',
      };

      final model = PublicationModel.fromJson(json);

      expect(model, isA<PublicationModel>());
      expect(model.relatedPublications, isEmpty);
    });

    test('toJson should include related publications', () {
      final model = PublicationModel(
        id: 'pub_123',
        title: 'Test Publication',
        issn: '1234-5678',
        cover: 'https://example.com/cover.jpg',
        pdf: 'https://example.com/publication.pdf',
        size: '2.5 MB',
        abstract: 'This is a test publication',
        catalogueNumber: 'CAT-001',
        publicationNumber: 'PUB-001',
        relatedPublications: [
          RelatedPublication(
            id: 'related_1',
            title: 'Related Publication 1',
            releaseDate: DateTime.parse('2023-01-15'),
            url: 'https://example.com/related1',
            cover: 'https://example.com/related1_cover.jpg',
          ),
        ],
      );

      final json = model.toJson();

      expect(json, isA<JSON>());
      expect(json['related'], isNotNull);
      expect(json['related'], isA<List<dynamic>>());
      expect(json['related'] as List<dynamic>, hasLength(1));

      final relatedJson = (json['related'] as List<dynamic>)[0] as JSON;
      expect(relatedJson['pub_id'], equals('related_1'));
      expect(relatedJson['title'], equals('Related Publication 1'));
      expect(relatedJson['rl_date'], equals('2023-01-15T00:00:00.000'));
    });

    test('copyWith should update relatedPublications', () {
      final original = PublicationModel(
        id: 'pub_123',
        title: 'Test Publication',
        issn: '1234-5678',
        cover: 'https://example.com/cover.jpg',
        pdf: 'https://example.com/publication.pdf',
        size: '2.5 MB',
        abstract: 'This is a test publication',
        catalogueNumber: 'CAT-001',
        publicationNumber: 'PUB-001',
        relatedPublications: [
          RelatedPublication(
            id: 'related_1',
            title: 'Related Publication 1',
            releaseDate: DateTime.parse('2023-01-15'),
            url: 'https://example.com/related1',
            cover: 'https://example.com/related1_cover.jpg',
          ),
        ],
      );

      final newRelated = RelatedPublication(
        id: 'related_2',
        title: 'Related Publication 2',
        releaseDate: DateTime.parse('2023-02-20'),
        url: 'https://example.com/related2',
        cover: 'https://example.com/related2_cover.jpg',
      );

      final updated = original.copyWith(
        relatedPublications: [newRelated],
      );

      expect(updated.relatedPublications, hasLength(1));
      expect(updated.relatedPublications.first.id, equals('related_2'));
      expect(
        updated.relatedPublications.first.title,
        equals('Related Publication 2'),
      );

      // Verify other fields are preserved
      expect(updated.id, equals(original.id));
      expect(updated.title, equals(original.title));
    });
  });
}
