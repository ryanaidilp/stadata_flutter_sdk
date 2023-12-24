import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/network/api_endpoint.dart';
import 'package:stadata_flutter_sdk/src/features/domains/domain/enums/domain_type.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/enums/data_language.dart';

void main() {
  group(
    'ApiEndpoint',
    () {
      group(
        'domain',
        () {
          test(
            'should return domain endpoint with default type set to all',
            () {
              final result = ApiEndpoint.domain();

              expect(result, equals('domain?type=all'));
            },
          );

          test(
            'should throw exception if type is set to regencyByProvince '
            'without privinceCode',
            () => expect(
              () {
                ApiEndpoint.domain(
                  type: DomainType.regencyByProvince,
                );
              },
              throwsAssertionError,
            ),
          );

          test(
            'should include provinceCode in query param if type is set to '
            'regencyByProvince and provinceCode exist',
            () {
              final result = ApiEndpoint.domain(
                type: DomainType.regencyByProvince,
                provinceCode: '72',
              );

              expect(result, equals('domain?type=kabbyprov&prov=72'));
            },
          );

          test(
            'should not include provinceCode in query param if type is not set '
            'to regencyByProvince and provinceCode exist',
            () {
              final result = ApiEndpoint.domain(
                provinceCode: '72',
              );

              expect(result, equals('domain?type=all'));
            },
          );

          test(
            'should set type to kab if DomainType is set to regency',
            () {
              final result = ApiEndpoint.domain(
                type: DomainType.regency,
              );

              expect(result, equals('domain?type=kab'));
            },
          );

          test(
            'should set type to prov if DomainType is set to province',
            () {
              final result = ApiEndpoint.domain(
                type: DomainType.province,
              );

              expect(result, equals('domain?type=prov'));
            },
          );
        },
      );

      group(
        'publication',
        () {
          test(
            'should return publication endpoint with its default param',
            () {
              final result = ApiEndpoint.publication(domain: '7200');
              expect(
                result,
                equals('model/publication?domain=7200&lang=ind&page=1'),
              );
            },
          );

          test(
            'should using correct lang when it set on param',
            () {
              final result = ApiEndpoint.publication(
                domain: '7200',
                lang: DataLanguage.en,
              );
              expect(
                result,
                equals('model/publication?domain=7200&lang=eng&page=1'),
              );
            },
          );

          test(
            'should using correct page when it set on param',
            () {
              final result = ApiEndpoint.publication(
                domain: '7200',
                page: 2,
              );
              expect(
                result,
                equals('model/publication?domain=7200&lang=ind&page=2'),
              );
            },
          );

          test(
            'should not include keyword in param if its exist and  empty',
            () {
              final result = ApiEndpoint.publication(
                domain: '7200',
                keyword: '',
              );
              expect(
                result,
                equals(
                  'model/publication?domain=7200&lang=ind&page=1',
                ),
              );
            },
          );

          test(
            'should include keyword in param if its exist and not empty',
            () {
              final result = ApiEndpoint.publication(
                domain: '7200',
                keyword: 'Keyword',
              );
              expect(
                result,
                equals(
                  'model/publication?domain=7200&lang=ind&page=1&keyword=Keyword',
                ),
              );
            },
          );

          test(
            'should include month in param if its ',
            () {
              final result = ApiEndpoint.publication(
                domain: '7200',
                month: 12,
              );
              expect(
                result,
                equals(
                  'model/publication?domain=7200&lang=ind&page=1&month=12',
                ),
              );
            },
          );

          test(
            'should include month and pad left with 0 in param if its single ',
            () {
              final result = ApiEndpoint.publication(
                domain: '7200',
                month: 2,
              );
              expect(
                result,
                equals(
                  'model/publication?domain=7200&lang=ind&page=1&month=02',
                ),
              );
            },
          );

          test(
            'should include year in param ',
            () {
              final result = ApiEndpoint.publication(
                domain: '7200',
                year: 2023,
              );
              expect(
                result,
                equals(
                  'model/publication?domain=7200&lang=ind&page=1&year=2023',
                ),
              );
            },
          );
        },
      );

      group(
        'publicationDetail',
        () {
          test(
            'should return publication endpoint with default param',
            () {
              final result = ApiEndpoint.publicationDetail(
                id: '1234',
                domain: '7200',
              );

              expect(
                result,
                equals('model/publication?lang=ind&domain=7200&id=1234'),
              );
            },
          );

          test(
            'should return publication endpoint with correct lang param',
            () {
              final result = ApiEndpoint.publicationDetail(
                id: '1234',
                domain: '7200',
                lang: DataLanguage.en,
              );

              expect(
                result,
                equals('model/publication?lang=eng&domain=7200&id=1234'),
              );
            },
          );
        },
      );

      group(
        'infographic',
        () {
          test(
            'should return infographic endpoint with its default param',
            () {
              final result = ApiEndpoint.infographic(domain: '7200');
              expect(
                result,
                equals('model/infographic?domain=7200&lang=ind&page=1'),
              );
            },
          );

          test(
            'should using correct lang when it set on param',
            () {
              final result = ApiEndpoint.infographic(
                domain: '7200',
                lang: DataLanguage.en,
              );
              expect(
                result,
                equals('model/infographic?domain=7200&lang=eng&page=1'),
              );
            },
          );

          test(
            'should using correct page when it set on param',
            () {
              final result = ApiEndpoint.infographic(
                domain: '7200',
                page: 2,
              );
              expect(
                result,
                equals('model/infographic?domain=7200&lang=ind&page=2'),
              );
            },
          );

          test(
            'should not include keyword in param if its exist and  empty',
            () {
              final result = ApiEndpoint.infographic(
                domain: '7200',
                keyword: '',
              );
              expect(
                result,
                equals(
                  'model/infographic?domain=7200&lang=ind&page=1',
                ),
              );
            },
          );

          test(
            'should include keyword in param if its exist and not empty',
            () {
              final result = ApiEndpoint.infographic(
                domain: '7200',
                keyword: 'Keyword',
              );
              expect(
                result,
                equals(
                  'model/infographic?domain=7200&lang=ind&page=1&keyword=Keyword',
                ),
              );
            },
          );
        },
      );

      group(
        'staticTable',
        () {
          test(
            'should return static table endpoint with its default param',
            () {
              final result = ApiEndpoint.staticTable(domain: '7200');
              expect(
                result,
                equals('model/statictable?domain=7200&page=1&lang=ind'),
              );
            },
          );

          test(
            'should using correct lang when it set on param',
            () {
              final result = ApiEndpoint.staticTable(
                domain: '7200',
                lang: DataLanguage.en,
              );
              expect(
                result,
                equals('model/statictable?domain=7200&page=1&lang=eng'),
              );
            },
          );

          test(
            'should using correct page when it set on param',
            () {
              final result = ApiEndpoint.staticTable(
                domain: '7200',
                page: 2,
              );
              expect(
                result,
                equals('model/statictable?domain=7200&page=2&lang=ind'),
              );
            },
          );

          test(
            'should not include keyword in param if its exist and  empty',
            () {
              final result = ApiEndpoint.staticTable(
                domain: '7200',
                keyword: '',
              );
              expect(
                result,
                equals(
                  'model/statictable?domain=7200&page=1&lang=ind',
                ),
              );
            },
          );

          test(
            'should include keyword in param if its exist and not empty',
            () {
              final result = ApiEndpoint.staticTable(
                domain: '7200',
                keyword: 'Keyword',
              );
              expect(
                result,
                equals(
                  'model/statictable?domain=7200&page=1&lang=ind&keyword=Keyword',
                ),
              );
            },
          );

          test(
            'should include month in param if its ',
            () {
              final result = ApiEndpoint.staticTable(
                domain: '7200',
                month: 12,
              );
              expect(
                result,
                equals(
                  'model/statictable?domain=7200&page=1&lang=ind&month=12',
                ),
              );
            },
          );

          test(
            'should include month and pad left with 0 in param if its single ',
            () {
              final result = ApiEndpoint.staticTable(
                domain: '7200',
                month: 2,
              );
              expect(
                result,
                equals(
                  'model/statictable?domain=7200&page=1&lang=ind&month=02',
                ),
              );
            },
          );

          test(
            'should include year in param ',
            () {
              final result = ApiEndpoint.staticTable(
                domain: '7200',
                year: 2023,
              );
              expect(
                result,
                equals(
                  'model/statictable?domain=7200&page=1&lang=ind&year=2023',
                ),
              );
            },
          );
        },
      );

      group(
        'staticTableDetail',
        () {
          test(
            'should return static table endpoint with default param',
            () {
              final result = ApiEndpoint.staticTableDetail(
                id: 1234,
                domain: '7200',
              );

              expect(
                result,
                equals('model/statictable?id=1234&domain=7200&lang=ind'),
              );
            },
          );

          test(
            'should return static table endpoint with correct lang param',
            () {
              final result = ApiEndpoint.staticTableDetail(
                id: 1234,
                domain: '7200',
                lang: DataLanguage.en,
              );

              expect(
                result,
                equals('model/statictable?id=1234&domain=7200&lang=eng'),
              );
            },
          );
        },
      );

      group(
        'news',
        () {
          test(
            'should return news endpoint with its default param',
            () {
              final result = ApiEndpoint.news(domain: '7200');
              expect(
                result,
                equals('model/news?domain=7200&page=1&lang=ind'),
              );
            },
          );

          test(
            'should using correct lang when it set on param',
            () {
              final result = ApiEndpoint.news(
                domain: '7200',
                lang: DataLanguage.en,
              );
              expect(
                result,
                equals('model/news?domain=7200&page=1&lang=eng'),
              );
            },
          );

          test(
            'should using correct page when it set on param',
            () {
              final result = ApiEndpoint.news(
                domain: '7200',
                page: 2,
              );
              expect(
                result,
                equals('model/news?domain=7200&page=2&lang=ind'),
              );
            },
          );

          test(
            'should not include keyword in param if its exist and  empty',
            () {
              final result = ApiEndpoint.news(
                domain: '7200',
                keyword: '',
              );
              expect(
                result,
                equals('model/news?domain=7200&page=1&lang=ind'),
              );
            },
          );

          test(
            'should include keyword in param if its exist and not empty',
            () {
              final result = ApiEndpoint.news(
                domain: '7200',
                keyword: 'Keyword',
              );
              expect(
                result,
                equals(
                  'model/news?domain=7200&page=1&lang=ind&keyword=Keyword',
                ),
              );
            },
          );

          test(
            'should include month in param if its ',
            () {
              final result = ApiEndpoint.news(
                domain: '7200',
                month: 12,
              );
              expect(
                result,
                equals(
                  equals('model/news?domain=7200&page=1&lang=ind&month=12'),
                ),
              );
            },
          );

          test(
            'should include month and pad left with 0 in param if its single ',
            () {
              final result = ApiEndpoint.news(
                domain: '7200',
                month: 2,
              );
              expect(
                result,
                equals('model/news?domain=7200&page=1&lang=ind&month=02'),
              );
            },
          );

          test(
            'should include year in param ',
            () {
              final result = ApiEndpoint.news(
                domain: '7200',
                year: 2023,
              );
              expect(
                result,
                equals('model/news?domain=7200&page=1&lang=ind&year=2023'),
              );
            },
          );

          test(
            'should include news category id in param ',
            () {
              final result = ApiEndpoint.news(
                domain: '7200',
                newsCategoryID: 'Statistik Lain',
              );
              expect(
                result,
                equals(
                  'model/news?domain=7200&page=1&lang=ind&newscat=Statistik Lain',
                ),
              );
            },
          );
        },
      );

      group(
        'newsDetail',
        () {
          test(
            'should return news endpoint with default param',
            () {
              final result = ApiEndpoint.newsDetail(
                id: 1234,
                domain: '7200',
              );

              expect(
                result,
                equals('model/news?id=1234&domain=7200&lang=ind'),
              );
            },
          );

          test(
            'should return news endpoint with correct lang param',
            () {
              final result = ApiEndpoint.newsDetail(
                id: 1234,
                domain: '7200',
                lang: DataLanguage.en,
              );

              expect(
                result,
                equals('model/news?id=1234&domain=7200&lang=eng'),
              );
            },
          );
        },
      );

      group(
        'subjectCategories',
        () {
          test(
            'should return subject categories endpoint with its default param',
            () {
              final result = ApiEndpoint.subjectCategories(domain: '7200');
              expect(
                result,
                equals('model/subcat?page=1&domain=7200&lang=ind'),
              );
            },
          );

          test(
            'should using correct lang when it set on param',
            () {
              final result = ApiEndpoint.subjectCategories(
                domain: '7200',
                lang: DataLanguage.en,
              );
              expect(
                result,
                equals('model/subcat?page=1&domain=7200&lang=eng'),
              );
            },
          );

          test(
            'should using correct page when it set on param',
            () {
              final result = ApiEndpoint.subjectCategories(
                domain: '7200',
                page: 2,
              );
              expect(
                result,
                equals('model/subcat?page=2&domain=7200&lang=ind'),
              );
            },
          );
        },
      );

      group(
        'subjects',
        () {
          test(
            'should return subject endpoint with its default param',
            () {
              final result = ApiEndpoint.subjects(domain: '7200');
              expect(
                result,
                equals('model/subject?domain=7200&lang=ind&page=1'),
              );
            },
          );

          test(
            'should using correct lang when it set on param',
            () {
              final result = ApiEndpoint.subjects(
                domain: '7200',
                lang: DataLanguage.en,
              );
              expect(
                result,
                equals('model/subject?domain=7200&lang=eng&page=1'),
              );
            },
          );

          test(
            'should using correct page when it set on param',
            () {
              final result = ApiEndpoint.subjects(
                domain: '7200',
                page: 2,
              );
              expect(
                result,
                equals('model/subject?domain=7200&lang=ind&page=2'),
              );
            },
          );

          test(
            'should using correct subjectCategoryID when it set on param',
            () {
              final result = ApiEndpoint.subjects(
                domain: '7200',
                subjectCategoryID: 1,
              );
              expect(
                result,
                equals('model/subject?domain=7200&lang=ind&page=1&subcat=1'),
              );
            },
          );
        },
      );

      group(
        'pressReleases',
        () {
          test(
            'should return press release endpoint with its default param',
            () {
              final result = ApiEndpoint.pressReleases(domain: '7200');
              expect(
                result,
                equals('model/pressrelease?domain=7200&page=1&lang=ind'),
              );
            },
          );

          test(
            'should using correct lang when it set on param',
            () {
              final result = ApiEndpoint.pressReleases(
                domain: '7200',
                lang: DataLanguage.en,
              );
              expect(
                result,
                equals('model/pressrelease?domain=7200&page=1&lang=eng'),
              );
            },
          );

          test(
            'should using correct page when it set on param',
            () {
              final result = ApiEndpoint.pressReleases(
                domain: '7200',
                page: 2,
              );
              expect(
                result,
                equals('model/pressrelease?domain=7200&page=2&lang=ind'),
              );
            },
          );

          test(
            'should not include keyword in param if its exist and  empty',
            () {
              final result = ApiEndpoint.pressReleases(
                domain: '7200',
                keyword: '',
              );
              expect(
                result,
                equals('model/pressrelease?domain=7200&page=1&lang=ind'),
              );
            },
          );

          test(
            'should include keyword in param if its exist and not empty',
            () {
              final result = ApiEndpoint.pressReleases(
                domain: '7200',
                keyword: 'Keyword',
              );
              expect(
                result,
                equals(
                  'model/pressrelease?domain=7200&page=1&lang=ind&keyword=Keyword',
                ),
              );
            },
          );

          test(
            'should include month in param if its ',
            () {
              final result = ApiEndpoint.pressReleases(
                domain: '7200',
                month: 12,
              );
              expect(
                result,
                equals(
                  'model/pressrelease?domain=7200&page=1&lang=ind&month=12',
                ),
              );
            },
          );

          test(
            'should include month and pad left with 0 in param if its single ',
            () {
              final result = ApiEndpoint.pressReleases(
                domain: '7200',
                month: 2,
              );
              expect(
                result,
                equals(
                  'model/pressrelease?domain=7200&page=1&lang=ind&month=02',
                ),
              );
            },
          );

          test(
            'should include year in param ',
            () {
              final result = ApiEndpoint.pressReleases(
                domain: '7200',
                year: 2023,
              );
              expect(
                result,
                equals(
                  'model/pressrelease?domain=7200&page=1&lang=ind&year=2023',
                ),
              );
            },
          );
        },
      );

      group(
        'pressReleaseDetail',
        () {
          test(
            'should return press release detail endpoint with default param',
            () {
              final result = ApiEndpoint.pressReleaseDetail(
                id: 1234,
                domain: '7200',
              );

              expect(
                result,
                equals('model/pressrelease?id=1234&domain=7200&lang=ind'),
              );
            },
          );

          test(
            'should return publication endpoint with correct lang param',
            () {
              final result = ApiEndpoint.pressReleaseDetail(
                id: 1234,
                domain: '7200',
                lang: DataLanguage.en,
              );

              expect(
                result,
                equals('model/pressrelease?id=1234&domain=7200&lang=eng'),
              );
            },
          );
        },
      );

      group(
        'strategicIndicators',
        () {
          test(
            'should return strategic indicators endpoint with its default param',
            () {
              final result = ApiEndpoint.strategicIndicators(domain: '7200');
              expect(
                result,
                equals('model/indicators?domain=7200&lang=ind&page=1'),
              );
            },
          );

          test(
            'should using correct lang when it set on param',
            () {
              final result = ApiEndpoint.strategicIndicators(
                domain: '7200',
                lang: DataLanguage.en,
              );
              expect(
                result,
                equals('model/indicators?domain=7200&lang=eng&page=1'),
              );
            },
          );

          test(
            'should using correct page when it set on param',
            () {
              final result = ApiEndpoint.strategicIndicators(
                domain: '7200',
                page: 2,
              );
              expect(
                result,
                equals('model/indicators?domain=7200&lang=ind&page=2'),
              );
            },
          );

          test(
            'should using correct variableID when it set on param',
            () {
              final result = ApiEndpoint.strategicIndicators(
                domain: '7200',
                variableID: 1,
              );
              expect(
                result,
                equals('model/indicators?domain=7200&lang=ind&page=1&var=1'),
              );
            },
          );
        },
      );

      group(
        'variables',
        () {
          test(
            'should return variables endpoint with its default param',
            () {
              final result = ApiEndpoint.variables(domain: '7200');
              expect(
                result,
                equals('model/var?domain=7200&lang=ind&page=1&area=0'),
              );
            },
          );

          test(
            'should using correct lang when it set on param',
            () {
              final result = ApiEndpoint.variables(
                domain: '7200',
                lang: DataLanguage.en,
              );
              expect(
                result,
                equals('model/var?domain=7200&lang=eng&page=1&area=0'),
              );
            },
          );

          test(
            'should using correct page when it set on param',
            () {
              final result = ApiEndpoint.variables(
                domain: '7200',
                page: 2,
              );
              expect(
                result,
                equals('model/var?domain=7200&lang=ind&page=2&area=0'),
              );
            },
          );

          test(
            'should using correct subjectID when it set on param',
            () {
              final result = ApiEndpoint.variables(
                domain: '7200',
                subjectID: 1,
              );
              expect(
                result,
                equals(
                  'model/var?domain=7200&lang=ind&page=1&area=0&subject=1',
                ),
              );
            },
          );

          test(
            'should using correct area when it set on param',
            () {
              final result = ApiEndpoint.variables(
                domain: '7200',
                showExistingVariables: true,
              );
              expect(
                result,
                equals(
                  'model/var?domain=7200&lang=ind&page=1&area=1',
                ),
              );
            },
          );

          test(
            'should using correct year when it set on param',
            () {
              final result = ApiEndpoint.variables(
                domain: '7200',
                year: 2020,
              );
              expect(
                result,
                equals(
                  'model/var?domain=7200&lang=ind&page=1&area=0&year=2020',
                ),
              );
            },
          );
        },
      );
    },
  );
}
