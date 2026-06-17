import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  group('InfographicModel', () {
    const tId = 56;
    const tTitle = 'Analisis Kepuasan Layanan SKD 2020';
    const tImage =
        'https://pinrangkab.bps.go.id/backend/images/Analisis-Kepuasan-Layanan-SKD-2020-ind.png';
    const tCategory = 0;
    const tDownloadUrl =
        'https://pinrangkab.bps.go.id/galery/download.html?asdf=NTY%3D';
    const tDescription = 'Test description';

    const tModel = InfographicModel(
      id: tId,
      title: tTitle,
      image: tImage,
      category: tCategory,
      downloadUrl: tDownloadUrl,
      description: tDescription,
    );

    final tJson = <String, dynamic>{
      'inf_id': tId,
      'title': tTitle,
      'img': tImage,
      'category': tCategory,
      'dl': tDownloadUrl,
      'desc': tDescription,
    };

    group('fromJson', () {
      test('should return a valid model when all fields are present', () {
        // act
        final result = InfographicModel.fromJson(tJson);

        // assert
        expect(result.id, equals(tId));
        expect(result.title, equals(tTitle));
        expect(result.image, equals(tImage));
        expect(result.category, equals(tCategory));
        expect(result.downloadUrl, equals(tDownloadUrl));
        expect(result.description, equals(tDescription));
      });

      test('should return model with null description when absent', () {
        // arrange
        final json = <String, dynamic>{
          'inf_id': 55,
          'title': 'Segmentasi Konsumen SKD 2020',
          'img': tImage,
          'category': 0,
          'dl': tDownloadUrl,
          'desc': null,
        };

        // act
        final result = InfographicModel.fromJson(json);

        // assert
        expect(result.description, isNull);
        expect(result.id, equals(55));
        expect(result.title, equals('Segmentasi Konsumen SKD 2020'));
      });

      test('should default category to 0 when null', () {
        // arrange
        final json = <String, dynamic>{
          'inf_id': tId,
          'title': tTitle,
          'img': tImage,
          'category': null,
          'dl': tDownloadUrl,
          'desc': null,
        };

        // act
        final result = InfographicModel.fromJson(json);

        // assert
        expect(result.category, equals(0));
      });
    });

    group('toJson', () {
      test('should return a JSON map with all fields', () {
        // act
        final result = tModel.toJson();

        // assert
        expect(result, isA<JSON>());
        expect(result['inf_id'], equals(tId));
        expect(result['title'], equals(tTitle));
        expect(result['img'], equals(tImage));
        expect(result['category'], equals(tCategory));
        expect(result['dl'], equals(tDownloadUrl));
        expect(result['desc'], equals(tDescription));
      });

      test('should round-trip fromJson -> toJson correctly', () {
        // act
        final model = InfographicModel.fromJson(tJson);
        final result = model.toJson();

        // assert
        expect(result, equals(tJson));
      });

      test('should include null value for description when not provided', () {
        // arrange
        const modelNoDesc = InfographicModel(
          id: tId,
          title: tTitle,
          image: tImage,
          category: tCategory,
          downloadUrl: tDownloadUrl,
        );

        // act
        final result = modelNoDesc.toJson();

        // assert
        expect(result['desc'], isNull);
        expect(result['inf_id'], equals(tId));
      });
    });

    group('copyWith', () {
      test('should return updated model with new id', () {
        // act
        final result = tModel.copyWith(id: 99);

        // assert
        expect(result.id, equals(99));
        expect(result.title, equals(tTitle));
      });

      test('should return updated model with new title', () {
        // act
        final result = tModel.copyWith(title: 'New Title');

        // assert
        expect(result.title, equals('New Title'));
        expect(result.id, equals(tId));
      });

      test('should return updated model with new category', () {
        // act
        final result = tModel.copyWith(category: 5);

        // assert
        expect(result.category, equals(5));
        expect(result.id, equals(tId));
        expect(result.title, equals(tTitle));
      });

      test('should update nullable description via ValueGetter', () {
        // act
        final result = tModel.copyWith(description: () => 'Updated desc');

        // assert
        expect(result.description, equals('Updated desc'));
        expect(result.id, equals(tId));
      });

      test('should set description to null via ValueGetter returning null', () {
        // act
        final result = tModel.copyWith(description: () => null);

        // assert
        expect(result.description, isNull);
        expect(result.id, equals(tId));
      });

      test('should preserve all unchanged fields', () {
        // act
        final result = tModel.copyWith(downloadUrl: 'https://new.url');

        // assert
        expect(result.downloadUrl, equals('https://new.url'));
        expect(result.id, equals(tId));
        expect(result.title, equals(tTitle));
        expect(result.image, equals(tImage));
        expect(result.category, equals(tCategory));
        expect(result.description, equals(tDescription));
      });

      test('should return identical values when no parameters provided', () {
        // act
        final result = tModel.copyWith();

        // assert
        expect(result.id, equals(tId));
        expect(result.title, equals(tTitle));
        expect(result.image, equals(tImage));
        expect(result.category, equals(tCategory));
        expect(result.downloadUrl, equals(tDownloadUrl));
        expect(result.description, equals(tDescription));
        expect(result, equals(tModel));
      });
    });

    group('equality', () {
      test('should be equal when all properties are the same', () {
        // arrange
        const model2 = InfographicModel(
          id: tId,
          title: tTitle,
          image: tImage,
          category: tCategory,
          downloadUrl: tDownloadUrl,
          description: tDescription,
        );

        // assert
        expect(tModel, equals(model2));
        expect(tModel.hashCode, equals(model2.hashCode));
      });

      test('should not be equal when id is different', () {
        // arrange
        const other = InfographicModel(
          id: 99,
          title: tTitle,
          image: tImage,
          category: tCategory,
          downloadUrl: tDownloadUrl,
        );

        // assert
        expect(tModel, isNot(equals(other)));
      });
    });

    group('inheritance', () {
      test('should be a subclass of Infographic', () {
        expect(tModel, isA<Infographic>());
      });

      test('should be a subclass of BaseEntity', () {
        expect(tModel, isA<BaseEntity>());
      });
    });
  });
}
