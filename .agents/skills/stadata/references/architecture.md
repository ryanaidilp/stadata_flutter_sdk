# Architecture Templates

Copy-paste scaffolding for a new SDK feature. Patterns verified against `sdg/` and `glossary/`. Replace `Feature`/`feature` and fields. Always prefer reusing an existing entity over creating a new one.

## Use case — `domain/usecases/get_all_{feature}.dart`

```dart
import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetAllFeature
    implements
        UseCase<ApiResponse<List<Feature>>, GetAllFeatureParam, FeatureRepository> {
  @override
  Future<Result<Failure, ApiResponse<List<Feature>>>> call(
    GetAllFeatureParam param,
  ) => repo.get(domain: param.domain, lang: param.lang, page: param.page);

  @override
  FeatureRepository get repo => injector.get<FeatureRepository>();
}

class GetAllFeatureParam extends BaseEntity {
  const GetAllFeatureParam({
    required this.domain,
    this.lang = DataLanguage.id,
    this.page = 1,
  });

  final String domain;
  final DataLanguage lang;
  final int page;

  @override
  List<Object?> get props => [domain, lang, page];
}
```

## Data source — `data/datasources/{feature}_remote_data_source.dart`

```dart
abstract class FeatureRemoteDataSource {
  Future<ApiResponseModel<List<FeatureModel>>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  });
}

class FeatureRemoteDataSourceImpl implements FeatureRemoteDataSource {
  final NetworkClient client = injector.get<NetworkClient>();

  @override
  Future<ApiResponseModel<List<FeatureModel>>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  }) async {
    final result = await client.get<JSON>(
      ApiEndpoint.feature,
      queryParams: {
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: lang.value,
        QueryParamConstant.page: '$page',
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<List<FeatureModel>>.fromJson(
      result,
      (json) => json is List
          ? json.map((e) => FeatureModel.fromJson(e as JSON)).toList()
          : <FeatureModel>[],
    );

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const FeatureNotAvailableException();
    }

    return response;
  }
}
```

## Repository impl — `data/repositories/{feature}_repository_impl.dart`

```dart
class FeatureRepositoryImpl implements FeatureRepository {
  final FeatureRemoteDataSource dataSource;
  final Log log;

  const FeatureRepositoryImpl({required this.dataSource, required this.log});

  @override
  Future<Result<Failure, ApiResponse<List<Feature>>>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  }) async {
    try {
      final result = await dataSource.get(domain: domain, lang: lang, page: page);
      return Result.success(result); // model is-a entity
    } catch (e, s) {
      log.console(e.toString(), error: e, stackTrace: s, type: LogType.error);
      return Result.failure(const FeatureFailure());
    }
  }
}
```

## Public List API surface

- `lib/src/list/stadata_list.dart` — abstract method with doc comment + BPS docs link.
- `lib/src/list/stadata_list_impl.dart`:

```dart
@override
Future<ListResult<Feature>> feature({
  required String domain,
  DataLanguage lang = DataLanguage.id,
  int page = 1,
}) async {
  final result = await _getAllFeature(
    GetAllFeatureParam(domain: domain, lang: lang, page: page),
  );
  return result.fold(
    (l) => throw FeatureException(message: l.message),
    (r) => ListResult<Feature>(
      data: r.data ?? [],
      dataAvailability: r.dataAvailability ?? DataAvailability.listNotAvailable,
      pagination: r.pagination,
    ),
  );
}
```

## Wire-up checklist

- [ ] `core/exceptions/` — `FeatureNotAvailableException`, `FeatureException` (+ barrel)
- [ ] `core/failures/` — `FeatureFailure` (+ barrel)
- [ ] `core/network/api_endpoint.dart` — `ApiEndpoint.feature`
- [ ] `core/constants/` — new `QueryParamConstant` keys if any
- [ ] every layer barrel + `features/features.dart`
- [ ] `injector/{feature}_injector.dart` registers datasource, repository, use cases
- [ ] `lib/stadata_flutter_sdk.dart` `show` list — public entity + enums
- [ ] tests: datasource, repository, use case (success + failure) with fixtures
- [ ] docs (see SKILL §6) + example screen

## Example-app cubit pattern (paginated list)

Getter+setter pair with a non-trivial setter body satisfies `unnecessary_getters_setters`; `unawaited` satisfies `discarded_futures`:

```dart
import 'dart:async';

int get page => _currentPage;
set page(int value) {
  final page = value;
  _currentPage = page;
}

void nextPage() {
  page = _currentPage + 1;
  unawaited(loadData());
}
```
