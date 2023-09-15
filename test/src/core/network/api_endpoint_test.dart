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
      group('publicationDetail', () {
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
      });
      group(
        'infographics',
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
    },
  );
}
