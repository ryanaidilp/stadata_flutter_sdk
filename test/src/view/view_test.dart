import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/publications/data/models/publication_model.dart';
import 'package:stadata_flutter_sdk/src/features/publications/domain/usecases/get_detail_publication.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/data/models/static_table_model.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/usecases/get_detail_static_table.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/src/view/view.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../../fixtures/fixtures.dart';
import '../../helpers/test_injection.dart';

class MockGetDetailPublication extends Mock implements GetDetailPublication {}

class MockGetDetailStaticTable extends Mock implements GetDetailStaticTable {}

void main() {
  late GetDetailPublication mockGetDetailPublication;
  late GetDetailStaticTable mockGetDetailStaticTable;
  late StadataView stadataView;

  setUpAll(
    () {
      mockGetDetailPublication = MockGetDetailPublication();
      registerTestLazySingleton<GetDetailPublication>(mockGetDetailPublication);
      mockGetDetailStaticTable = MockGetDetailStaticTable();
      registerTestLazySingleton<GetDetailStaticTable>(mockGetDetailStaticTable);
      stadataView = StadataViewImpl();
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7200';

  group(
    'publication()',
    () {
      late ApiResponse<Publication> response;
      late Publication data;
      setUp(
        () {
          final json = jsonFromFixture('publication_detail_fixture.json');
          final jsonResponse = ApiResponseModel<PublicationModel?>.fromJson(
            json,
            (json) =>
                json == null ? null : PublicationModel.fromJson(json as JSON),
          );
          response = ApiResponse<Publication>(
            data: jsonResponse.data?.toEntity(),
            status: jsonResponse.status,
            message: jsonResponse.message,
            dataAvailability: jsonResponse.dataAvailability,
            pagination: jsonResponse.pagination?.toEntity(),
          );
          data = jsonResponse.data!.toEntity();
        },
      );

      const id = '1234';

      test(
        'should return an instance of Publication when success',
        () async {
          when(
            () => mockGetDetailPublication(
              const GetPublicationDetailParam(id: id, domain: domain),
            ),
          ).thenAnswer((_) async => Right(response));

          final result = await stadataView.publication(id: id, domain: domain);

          expect(result, data);
          verify(
            () => mockGetDetailPublication(
              const GetPublicationDetailParam(id: id, domain: domain),
            ),
          );
        },
      );

      test(
        'should throw Exception if failure occured',
        () async {
          when(
            () => mockGetDetailPublication(
              const GetPublicationDetailParam(id: id, domain: domain),
            ),
          ).thenAnswer(
            (_) async => const Left(
              PublicationFailure(),
            ),
          );

          expect(
            () => stadataView.publication(id: id, domain: domain),
            throwsA(
              isA<Exception>().having(
                (e) => e.toString(),
                'Exception message',
                'StadataException - Failed to load publication data!',
              ),
            ),
          );
          verify(
            () => mockGetDetailPublication(
              const GetPublicationDetailParam(id: id, domain: domain),
            ),
          );
        },
      );
    },
  );

  group(
    'staticTable()',
    () {
      late ApiResponse<StaticTable> response;
      late StaticTable data;
      setUp(
        () {
          final json = jsonFromFixture('static_table_detail_fixture.json');
          final jsonResponse = ApiResponseModel<StaticTableModel?>.fromJson(
            json,
            (json) =>
                json == null ? null : StaticTableModel.fromJson(json as JSON),
          );
          response = ApiResponse<StaticTable>(
            data: jsonResponse.data?.toEntity(),
            status: jsonResponse.status,
            message: jsonResponse.message,
            dataAvailability: jsonResponse.dataAvailability,
            pagination: jsonResponse.pagination?.toEntity(),
          );
          data = jsonResponse.data!.toEntity();
        },
      );

      const id = 1234;

      test(
        'should return an instance of Static Table when success',
        () async {
          when(
            () => mockGetDetailStaticTable(
              const GetDetailStaticTableParam(id: id, domain: domain),
            ),
          ).thenAnswer((_) async => Right(response));

          final result = await stadataView.staticTable(id: id, domain: domain);

          expect(result, data);
          verify(
            () => mockGetDetailStaticTable(
              const GetDetailStaticTableParam(id: id, domain: domain),
            ),
          );
        },
      );

      test(
        'should throw Exception if failure occured',
        () async {
          when(
            () => mockGetDetailStaticTable(
              const GetDetailStaticTableParam(id: id, domain: domain),
            ),
          ).thenAnswer(
            (_) async => const Left(
              StaticTableFailure(),
            ),
          );

          expect(
            () => stadataView.staticTable(id: id, domain: domain),
            throwsA(
              isA<Exception>().having(
                (e) => e.toString(),
                'Exception message',
                'StadataException - Failed to load static table data!',
              ),
            ),
          );
          verify(
            () => mockGetDetailStaticTable(
              const GetDetailStaticTableParam(id: id, domain: domain),
            ),
          );
        },
      );
    },
  );
}
