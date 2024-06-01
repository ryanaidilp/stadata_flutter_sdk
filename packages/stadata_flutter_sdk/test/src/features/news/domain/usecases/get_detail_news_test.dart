import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

void main() {
  late NewsRepository mockRepository;
  late GetDetailNews usecase;
  late ApiResponse<News> news;

  setUpAll(
    () {
      mockRepository = MockNewsRepository();
      registerTestLazySingleton<NewsRepository>(mockRepository);
      usecase = GetDetailNews();

      final jsonNews = jsonFromFixture(Fixture.newsDetail);

      final newsResponse = ApiResponseModel<NewsModel>.fromJson(
        jsonNews,
        (json) {
          if (json == null) {
            return NewsModel(
              id: 0,
              title: '',
              content: '',
              categoryID: '',
              picture: '',
              releaseDate: DateTime.now(),
            );
          }

          return NewsModel.fromJson(json as JSON);
        },
      );

      final data = newsResponse.data;

      news = ApiResponse(
        data: data?.toEntity(),
        status: newsResponse.status,
        message: newsResponse.message,
        pagination: newsResponse.pagination?.toEntity(),
        dataAvailability: newsResponse.dataAvailability,
      );
    },
  );

  tearDownAll(unregisterTestInjection);

  const id = 1;
  const domain = '7315';

  group(
    'GetDetailNews',
    () {
      test(
        'should return instance of news if call success',
        () async {
          when(
            () => mockRepository.detail(
              id: id,
              domain: domain,
            ),
          ).thenAnswer((_) async => Right(news));

          final result = await usecase(
            const GetDetailNewsParam(
              id: id,
              domain: domain,
            ),
          );

          expect(
            result,
            equals(Right<Failure, ApiResponse<News>>(news)),
          );
          verify(
            () => mockRepository.detail(
              id: id,
              domain: domain,
            ),
          ).called(1);
        },
      );

      test(
        'should return failure if exception is thrown',
        () async {
          when(
            () => mockRepository.detail(
              id: id,
              domain: domain,
            ),
          ).thenAnswer(
            (_) async => const Left(
              NewsFailure(message: 'News not available!'),
            ),
          );

          final result = await usecase(
            const GetDetailNewsParam(
              id: id,
              domain: domain,
            ),
          );

          expect(
            result,
            equals(
              const Left<Failure, ApiResponse<News>>(
                NewsFailure(message: 'News not available!'),
              ),
            ),
          );
          verify(
            () => mockRepository.detail(
              id: id,
              domain: domain,
            ),
          ).called(1);
        },
      );
    },
  );
}
