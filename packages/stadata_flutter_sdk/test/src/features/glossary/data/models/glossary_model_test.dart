import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  group('GlossaryModel', () {
    const tId = 1;
    const tTitle = 'Angka Absolut';
    const tDescription = 'Nilai yang menunjukkan jumlah sebenarnya.';
    const tUrl = 'https://www.bps.go.id/id/statistics-table';

    const tModel = GlossaryModel(
      id: tId,
      title: tTitle,
      description: tDescription,
      url: tUrl,
    );

    final tJson = <String, dynamic>{
      'glos_id': tId,
      'title': tTitle,
      'description': tDescription,
      'url': tUrl,
    };

    group('fromJson', () {
      test('should return a valid model when all fields are present', () {
        // act
        final result = GlossaryModel.fromJson(tJson);

        // assert
        expect(result, equals(tModel));
        expect(result.id, equals(tId));
        expect(result.title, equals(tTitle));
        expect(result.description, equals(tDescription));
        expect(result.url, equals(tUrl));
      });

      test('should return model with null url when url is absent', () {
        // arrange
        final json = <String, dynamic>{
          'glos_id': 2,
          'title': 'Angka Indeks',
          'description': 'Ukuran statistik untuk perubahan relatif.',
          'url': null,
        };

        // act
        final result = GlossaryModel.fromJson(json);

        // assert
        expect(result.url, isNull);
        expect(result.id, equals(2));
        expect(result.title, equals('Angka Indeks'));
        expect(
          result.description,
          equals('Ukuran statistik untuk perubahan relatif.'),
        );
      });
    });

    group('toJson', () {
      test('should return a JSON map with all fields', () {
        // act
        final result = tModel.toJson();

        // assert
        expect(result, isA<JSON>());
        expect(result['glos_id'], equals(tId));
        expect(result['title'], equals(tTitle));
        expect(result['description'], equals(tDescription));
        expect(result['url'], equals(tUrl));
      });

      test('should round-trip fromJson -> toJson correctly', () {
        // act
        final model = GlossaryModel.fromJson(tJson);
        final result = model.toJson();

        // assert
        expect(result, equals(tJson));
      });

      test('should include null value for url when not provided', () {
        // arrange
        const modelWithNullUrl = GlossaryModel(
          id: tId,
          title: tTitle,
          description: tDescription,
        );

        // act
        final result = modelWithNullUrl.toJson();

        // assert
        expect(result['url'], isNull);
        expect(result['glos_id'], equals(tId));
        expect(result['title'], equals(tTitle));
        expect(result['description'], equals(tDescription));
      });
    });

    group('copyWith', () {
      test('should return updated model with new id', () {
        // act
        final result = tModel.copyWith(id: 99);

        // assert
        expect(result.id, equals(99));
        expect(result.title, equals(tTitle));
        expect(result.description, equals(tDescription));
        expect(result.url, equals(tUrl));
      });

      test('should return updated model with new title', () {
        // act
        final result = tModel.copyWith(title: 'New Title');

        // assert
        expect(result.title, equals('New Title'));
        expect(result.id, equals(tId));
      });

      test('should return updated model with new description', () {
        // act
        final result = tModel.copyWith(description: 'New Description');

        // assert
        expect(result.description, equals('New Description'));
        expect(result.id, equals(tId));
        expect(result.title, equals(tTitle));
      });

      test('should return updated model with new url', () {
        // act
        final result = tModel.copyWith(url: 'https://new-url.com');

        // assert
        expect(result.url, equals('https://new-url.com'));
        expect(result.id, equals(tId));
        expect(result.title, equals(tTitle));
        expect(result.description, equals(tDescription));
      });

      test('should preserve all unchanged fields', () {
        // act
        final result = tModel.copyWith(id: 10);

        // assert
        expect(result.id, equals(10));
        expect(result.title, equals(tTitle));
        expect(result.description, equals(tDescription));
        expect(result.url, equals(tUrl));
      });

      test('should return identical values when no parameters provided', () {
        // act
        final result = tModel.copyWith();

        // assert
        expect(result.id, equals(tId));
        expect(result.title, equals(tTitle));
        expect(result.description, equals(tDescription));
        expect(result.url, equals(tUrl));
        expect(result, equals(tModel));
      });
    });

    group('equality', () {
      test('should be equal when all properties are the same', () {
        // arrange
        const model2 = GlossaryModel(
          id: tId,
          title: tTitle,
          description: tDescription,
          url: tUrl,
        );

        // assert
        expect(tModel, equals(model2));
        expect(tModel.hashCode, equals(model2.hashCode));
      });

      test('should not be equal when id is different', () {
        // arrange
        const other = GlossaryModel(
          id: 99,
          title: tTitle,
          description: tDescription,
          url: tUrl,
        );

        // assert
        expect(tModel, isNot(equals(other)));
      });

      test('should not be equal when title is different', () {
        // arrange
        const other = GlossaryModel(
          id: tId,
          title: 'Different Title',
          description: tDescription,
          url: tUrl,
        );

        // assert
        expect(tModel, isNot(equals(other)));
      });
    });

    group('inheritance', () {
      test('should be a subclass of Glossary', () {
        expect(tModel, isA<Glossary>());
      });

      test('should be a subclass of BaseEntity', () {
        expect(tModel, isA<BaseEntity>());
      });
    });
  });
}
