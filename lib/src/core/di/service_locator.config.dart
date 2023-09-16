// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i22;
import 'package:stadata_flutter_sdk/src/core/di/register_module.dart' as _i37;
import 'package:stadata_flutter_sdk/src/core/log/log.dart' as _i21;
import 'package:stadata_flutter_sdk/src/core/network/http/http_client.dart'
    as _i15;
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_http_module.dart'
    as _i29;
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart'
    as _i31;
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_view_http_module.dart'
    as _i33;
import 'package:stadata_flutter_sdk/src/core/storage/local_storage.dart'
    as _i19;
import 'package:stadata_flutter_sdk/src/core/storage/secure_storage_impl.dart'
    as _i20;
import 'package:stadata_flutter_sdk/src/features/domains/data/datasources/domain_remote_data_source.dart'
    as _i3;
import 'package:stadata_flutter_sdk/src/features/domains/data/repositories/domain_repository_impl.dart'
    as _i5;
import 'package:stadata_flutter_sdk/src/features/domains/domain/repositories/domain_repository.dart'
    as _i4;
import 'package:stadata_flutter_sdk/src/features/domains/domain/usecases/get_domains.dart'
    as _i14;
import 'package:stadata_flutter_sdk/src/features/infographics/data/datasources/infographic_remote_data_source.dart'
    as _i16;
import 'package:stadata_flutter_sdk/src/features/infographics/data/repositories/infographic_repository_impl.dart'
    as _i18;
import 'package:stadata_flutter_sdk/src/features/infographics/domain/repositories/infographic_repository.dart'
    as _i17;
import 'package:stadata_flutter_sdk/src/features/infographics/domain/usecases/get_all_infographics.dart'
    as _i7;
import 'package:stadata_flutter_sdk/src/features/news/data/datasources/news_remote_data_source.dart'
    as _i23;
import 'package:stadata_flutter_sdk/src/features/news/data/repositories/news_repository_impl.dart'
    as _i25;
import 'package:stadata_flutter_sdk/src/features/news/domain/repositories/news_repository.dart'
    as _i24;
import 'package:stadata_flutter_sdk/src/features/news/domain/usecases/get_all_news.dart'
    as _i8;
import 'package:stadata_flutter_sdk/src/features/news/domain/usecases/get_detail_news.dart'
    as _i11;
import 'package:stadata_flutter_sdk/src/features/publications/data/datasources/publication_remote_data_source.dart'
    as _i26;
import 'package:stadata_flutter_sdk/src/features/publications/data/repositories/publication_repository_impl.dart'
    as _i28;
import 'package:stadata_flutter_sdk/src/features/publications/domain/repositories/publication_repository.dart'
    as _i27;
import 'package:stadata_flutter_sdk/src/features/publications/domain/usecases/get_all_publication.dart'
    as _i9;
import 'package:stadata_flutter_sdk/src/features/publications/domain/usecases/get_detail_publication.dart'
    as _i12;
import 'package:stadata_flutter_sdk/src/features/static_tables/data/datasources/static_table_remote_data_source.dart'
    as _i34;
import 'package:stadata_flutter_sdk/src/features/static_tables/data/repositories/static_table_repository_impl.dart'
    as _i36;
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/repositories/static_table_repository.dart'
    as _i35;
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/usecases/get_all_static_tables.dart'
    as _i10;
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/usecases/get_detail_static_table.dart'
    as _i13;
import 'package:stadata_flutter_sdk/src/list/list.dart' as _i30;
import 'package:stadata_flutter_sdk/src/view/view.dart' as _i32;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.DomainRemoteDataSource>(
      () => _i3.DomainRemoteDataSourceImpl());
  gh.lazySingleton<_i4.DomainRepository>(() => _i5.DomainRepositoryImpl());
  gh.factory<_i6.FlutterSecureStorage>(() => registerModule.secureStorage);
  gh.lazySingleton<_i7.GetAllInfographics>(() => _i7.GetAllInfographics());
  gh.lazySingleton<_i8.GetAllNews>(() => _i8.GetAllNews());
  gh.lazySingleton<_i9.GetAllPublication>(() => _i9.GetAllPublication());
  gh.lazySingleton<_i10.GetAllStaticTables>(() => _i10.GetAllStaticTables());
  gh.lazySingleton<_i11.GetDetailNews>(() => _i11.GetDetailNews());
  gh.lazySingleton<_i12.GetDetailPublication>(
      () => _i12.GetDetailPublication());
  gh.lazySingleton<_i13.GetDetailStaticTable>(
      () => _i13.GetDetailStaticTable());
  gh.lazySingleton<_i14.GetDomains>(() => _i14.GetDomains());
  gh.factory<_i15.HttpClient>(
    () => registerModule.viewHttpClient,
    instanceName: 'viewClient',
  );
  gh.factory<_i15.HttpClient>(
    () => registerModule.listHttpClient,
    instanceName: 'listClient',
  );
  gh.factory<_i15.HttpClient>(() => registerModule.httpClient);
  gh.lazySingleton<_i16.InfographicRemoteDataSource>(
      () => _i16.InfographicRemoteDataSourceImpl());
  gh.lazySingleton<_i17.InfographicRepository>(
      () => _i18.InfographicRepositoryImpl());
  gh.lazySingleton<_i19.LocalStorage>(
    () => _i20.SecureStorageImpl(),
    instanceName: 'secure',
  );
  gh.lazySingleton<_i21.Log>(() => _i21.Log());
  gh.factory<_i22.Logger>(() => registerModule.logger);
  gh.lazySingleton<_i23.NewsRemoteDataSource>(
      () => _i23.NewsRemoteDataSourceImpl());
  gh.lazySingleton<_i24.NewsRepository>(() => _i25.NewsRepositoryImpl());
  gh.lazySingleton<_i26.PublicationRemoteDataSource>(
      () => _i26.PublicationRemoteDataSourceImpl());
  gh.lazySingleton<_i27.PublicationRepository>(
      () => _i28.PublicationRepositoryImpl());
  gh.lazySingleton<_i29.StadataHttpModule>(() => _i29.StadataHttpModule());
  gh.lazySingleton<_i30.StadataList>(() => _i30.StadataListImpl());
  gh.lazySingleton<_i31.StadataListHttpModule>(
      () => _i31.StadataListHttpModule());
  gh.lazySingleton<_i32.StadataView>(() => _i32.StadataViewImpl());
  gh.lazySingleton<_i33.StadataViewHttpModule>(
      () => _i33.StadataViewHttpModule());
  gh.lazySingleton<_i34.StaticTableRemoteDataSource>(
      () => _i34.StaticTableRemoteDataSourceImpl());
  gh.lazySingleton<_i35.StaticTableRepository>(
      () => _i36.StaticTableRepositoryImpl());
  return getIt;
}

class _$RegisterModule extends _i37.RegisterModule {}
