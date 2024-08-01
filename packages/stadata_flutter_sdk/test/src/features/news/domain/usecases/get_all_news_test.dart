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
  late GetAllNews usecase;
  late ApiResponse<List<News>> news;

  setUpAll(
    () {
      mockRepository = MockNewsRepository();
      registerTestLazySingleton<NewsRepository>(mockRepository);
      usecase = GetAllNews();

      final jsonNews = jsonFromFixture(Fixture.news);

      final newsResponse = ApiResponseModel<List<NewsModel>>.fromJson(
        jsonNews,
        (json) {
          if (json is! List) {
            return [];
          }

          return json.map((e) => NewsModel.fromJson(e as JSON)).toList();
        },
      );

      final data = newsResponse.data?.map((e) => e).toList();

      news = ApiResponse<List<News>>(
        data: data,
        status: newsResponse.status,
        message: newsResponse.message,
        pagination: newsResponse.pagination?.toEntity(),
        dataAvailability: newsResponse.dataAvailability,
      );
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7315';

  group(
    'GetAllNews',
    () {
      test(
        'should return list of news if call success',
        () async {
          when(
            () => mockRepository.get(
              domain: domain,
            ),
          ).thenAnswer((_) async => Right(news));

          final result = await usecase(
            const GetAllNewsParam(
              domain: domain,
            ),
          );

          expect(
            result,
            equals(Right<Failure, ApiResponse<List<News>>>(news)),
          );
          verify(
            () => mockRepository.get(domain: '7315'),
          ).called(1);
        },
      );

      test(
        'should return failure if exception is thrown',
        () async {
          when(
            () => mockRepository.get(
              domain: domain,
            ),
          ).thenAnswer(
            (_) async => const Left(
              NewsFailure(message: 'News not available!'),
            ),
          );

          final result = await usecase(
            const GetAllNewsParam(
              domain: domain,
            ),
          );

          expect(
            result,
            equals(
              const Left<Failure, ApiResponse<List<News>>>(
                NewsFailure(message: 'News not available!'),
              ),
            ),
          );
          verify(
            () => mockRepository.get(domain: '7315'),
          ).called(1);
        },
      );
    },
  );
}
