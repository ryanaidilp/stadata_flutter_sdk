import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

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
              final result = ApiEndpoint.domain;

              expect(result, equals('domain'));
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
              final result = ApiEndpoint.publication;
              expect(
                result,
                equals('model/publication'),
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
              final result = ApiEndpoint.infographic;
              expect(
                result,
                equals('model/infographic'),
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
              final result = ApiEndpoint.staticTable;
              expect(
                result,
                equals('model/statictable'),
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
              final result = ApiEndpoint.news;
              expect(
                result,
                equals('model/news'),
              );
            },
          );
        },
      );

      group(
        'subjectCategory',
        () {
          test(
            'should return subject categories endpoint with its default param',
            () {
              final result = ApiEndpoint.subjectCategory;
              expect(
                result,
                equals('model/subcat'),
              );
            },
          );
        },
      );

      group(
        'subject',
        () {
          test(
            'should return subject endpoint with its default param',
            () {
              final result = ApiEndpoint.subject;
              expect(
                result,
                equals('model/subject'),
              );
            },
          );
        },
      );

      group(
        'pressRelease',
        () {
          test(
            'should return press release endpoint with its default param',
            () {
              final result = ApiEndpoint.pressRelease;
              expect(
                result,
                equals('model/pressrelease'),
              );
            },
          );
        },
      );

      group(
        'strategicIndicator',
        () {
          test(
            'should return strategic indicators endpoint with its default param',
            () {
              final result = ApiEndpoint.strategicIndicator;
              expect(
                result,
                equals('model/indicators'),
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
              final result = ApiEndpoint.variable;
              expect(
                result,
                equals('model/var'),
              );
            },
          );
        },
      );
      group(
        'verticalVariables',
        () {
          test(
            'should return vertical variables endpoint with its default param',
            () {
              final result = ApiEndpoint.verticalVariable;
              expect(
                result,
                equals('model/vervar'),
              );
            },
          );
        },
      );

      group(
        'units',
        () {
          test(
            'should return units endpoint with its default param',
            () {
              final result = ApiEndpoint.unit;
              expect(
                result,
                equals('model/unit'),
              );
            },
          );
        },
      );

      group(
        'statisticClassification()',
        () {
          test(
            'should return correct endpoint with its param',
            () {
              final result = ApiEndpoint.statisticClassification(
                type: KBLIType.y2009,
              );

              expect(
                result,
                equals('model/${KBLIType.y2009.value}'),
              );
            },
          );
        },
      );
    },
  );
}
