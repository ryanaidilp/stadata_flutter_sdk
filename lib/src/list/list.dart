// ignore_for_file: public_member_api_docs

import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/features/domains/domain/usecases/get_domains.dart';
import 'package:stadata_flutter_sdk/src/features/infographics/domain/usecases/get_all_infographics.dart';
import 'package:stadata_flutter_sdk/src/features/news/domain/usecases/get_all_news.dart';
import 'package:stadata_flutter_sdk/src/features/publications/domain/usecases/get_all_publication.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/usecases/get_all_static_tables.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

abstract class StadataList {
  Future<ListResult<DomainEntity>> domains({
    DomainType type = DomainType.all,
    String? provinceCode,
  });

  Future<ListResult<Publication>> publications({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    int? month,
    int? year,
  });

  Future<ListResult<Infographic>> infographics({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
  });

  Future<ListResult<StaticTable>> staticTables({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    int? month,
    int? year,
  });

  Future<ListResult<News>> news({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    String? newsCategoryId,
    int? month,
    int? year,
  });
}

@LazySingleton(as: StadataList)
class StadataListImpl implements StadataList {
  final _getDomains = getIt<GetDomains>();
  final _getAllPublications = getIt<GetAllPublication>();
  final _getAllInfographics = getIt<GetAllInfographics>();
  final _getAllStaticTables = getIt<GetAllStaticTables>();
  final _getAllNews = getIt<GetAllNews>();

  @override
  Future<ListResult<DomainEntity>> domains({
    DomainType type = DomainType.all,
    String? provinceCode,
  }) async {
    final result = await _getDomains(
      GetDomainParam(
        type: type,
        provinceCode: provinceCode,
      ),
    );

    return result.fold(
      (l) => throw DomainException(message: l.message),
      (r) => ListResult<DomainEntity>(
        data: r.data ?? [],
        pagination: r.pagination,
      ),
    );
  }

  @override
  Future<ListResult<Publication>> publications({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    int? month,
    int? year,
  }) async {
    final result = await _getAllPublications(
      GetPublicationParam(
        domain: domain,
        lang: lang,
        page: page,
        keyword: keyword,
        month: month,
        year: year,
      ),
    );

    return result.fold(
      (l) => throw PublicationException(message: l.message),
      (r) => ListResult<Publication>(
        data: r.data ?? [],
        pagination: r.pagination,
      ),
    );
  }

  @override
  Future<ListResult<Infographic>> infographics({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
  }) async {
    final result = await _getAllInfographics(
      GetAllInfographicParam(
        domain: domain,
        lang: lang,
        page: page,
        keyword: keyword,
      ),
    );

    return result.fold(
      (l) => throw InfographicException(message: l.message),
      (r) => ListResult<Infographic>(
        data: r.data ?? [],
        pagination: r.pagination,
      ),
    );
  }

  @override
  Future<ListResult<StaticTable>> staticTables({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    int? month,
    int? year,
  }) async {
    final result = await _getAllStaticTables(
      GetAllStaticTableParams(
        lang: lang,
        page: page,
        year: year,
        month: month,
        domain: domain,
        keyword: keyword,
      ),
    );

    return result.fold(
      (l) => throw StaticTableException(message: l.message),
      (r) => ListResult<StaticTable>(
        data: r.data ?? [],
        pagination: r.pagination,
      ),
    );
  }

  @override
  Future<ListResult<News>> news({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    String? newsCategoryId,
    int? month,
    int? year,
  }) async {
    final result = await _getAllNews(
      GetAllNewsParam(
        lang: lang,
        year: year,
        page: page,
        month: month,
        domain: domain,
        keyword: keyword,
        newsCategoryId: newsCategoryId,
      ),
    );

    return result.fold(
      (l) => throw NewsException(message: l.message),
      (r) => ListResult<News>(
        data: r.data ?? [],
        pagination: r.pagination,
      ),
    );
  }
}
