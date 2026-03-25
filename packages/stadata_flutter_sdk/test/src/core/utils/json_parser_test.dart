import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/core/utils/json_parser.dart';

int _intParser(JSON json) => json['value'] as int;

int _intParserWithError(JSON json) {
  if (json['throw'] == true) {
    throw const FormatException('Invalid payload');
  }
  return json['value'] as int;
}

void main() {
  group('JsonParser', () {
    test('parse() should parse a single JSON object in isolate', () async {
      final result = await JsonParser.parse<int>(
        <String, dynamic>{'value': 10},
        _intParser,
      );

      expect(result, 10);
    });

    test('parse() should rethrow parser exception', () async {
      expect(
        () => JsonParser.parse<int>(
          <String, dynamic>{'value': 10, 'throw': true},
          _intParserWithError,
        ),
        throwsA(isA<FormatException>()),
      );
    });

    test(
      'parseList() should parse inline when list length is less than 5',
      () async {
        final result = await JsonParser.parseList<int>(
          <JSON>[
            <String, dynamic>{'value': 1},
            <String, dynamic>{'value': 2},
            <String, dynamic>{'value': 3},
            <String, dynamic>{'value': 4},
          ],
          _intParser,
        );

        expect(result, <int>[1, 2, 3, 4]);
      },
    );

    test(
      'parseList() should parse in isolate when list length is 5 or more',
      () async {
        final result = await JsonParser.parseList<int>(
          <JSON>[
            <String, dynamic>{'value': 1},
            <String, dynamic>{'value': 2},
            <String, dynamic>{'value': 3},
            <String, dynamic>{'value': 4},
            <String, dynamic>{'value': 5},
          ],
          _intParser,
        );

        expect(result, <int>[1, 2, 3, 4, 5]);
      },
    );

    test('parseList() should rethrow parser exception from isolate', () async {
      expect(
        () => JsonParser.parseList<int>(
          <JSON>[
            <String, dynamic>{'value': 1},
            <String, dynamic>{'value': 2},
            <String, dynamic>{'value': 3},
            <String, dynamic>{'value': 4},
            <String, dynamic>{'value': 5, 'throw': true},
          ],
          _intParserWithError,
        ),
        throwsA(isA<FormatException>()),
      );
    });
  });
}
