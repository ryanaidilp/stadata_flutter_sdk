// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i28;
import 'package:stadata_flutter_sdk/src/core/di/register_module.dart' as _i55;
import 'package:stadata_flutter_sdk/src/core/log/log.dart' as _i27;
import 'package:stadata_flutter_sdk/src/core/network/http/http_client.dart'
    as _i21;
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_http_module.dart'
    as _i41;
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart'
    as _i43;
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_view_http_module.dart'
    as _i45;
import 'package:stadata_flutter_sdk/src/core/storage/local_storage.dart'
    as _i25;
import 'package:stadata_flutter_sdk/src/core/storage/secure_storage_impl.dart'
    as _i26;
import 'package:stadata_flutter_sdk/src/features/domains/data/datasources/domain_remote_data_source.dart'
    as _i3;
import 'package:stadata_flutter_sdk/src/features/domains/data/repositories/domain_repository_impl.dart'
    as _i5;
import 'package:stadata_flutter_sdk/src/features/domains/domain/repositories/domain_repository.dart'
    as _i4;
import 'package:stadata_flutter_sdk/src/features/domains/domain/usecases/get_domains.dart'
    as _i20;
import 'package:stadata_flutter_sdk/src/features/infographics/data/datasources/infographic_remote_data_source.dart'
    as _i22;
import 'package:stadata_flutter_sdk/src/features/infographics/data/repositories/infographic_repository_impl.dart'
    as _i24;
import 'package:stadata_flutter_sdk/src/features/infographics/domain/repositories/infographic_repository.dart'
    as _i23;
import 'package:stadata_flutter_sdk/src/features/infographics/domain/usecases/get_all_infographics.dart'
    as _i7;
import 'package:stadata_flutter_sdk/src/features/news/data/datasources/news_remote_data_source.dart'
    as _i32;
import 'package:stadata_flutter_sdk/src/features/news/data/repositories/news_repository_impl.dart'
    as _i34;
import 'package:stadata_flutter_sdk/src/features/news/domain/repositories/news_repository.dart'
    as _i33;
import 'package:stadata_flutter_sdk/src/features/news/domain/usecases/get_all_news.dart'
    as _i8;
import 'package:stadata_flutter_sdk/src/features/news/domain/usecases/get_detail_news.dart'
    as _i16;
import 'package:stadata_flutter_sdk/src/features/news_categories/data/datasources/news_category_remote_data_source.dart'
    as _i29;
import 'package:stadata_flutter_sdk/src/features/news_categories/data/repositories/news_category_repository_impl.dart'
    as _i31;
import 'package:stadata_flutter_sdk/src/features/news_categories/domain/respositories/news_category_repository.dart'
    as _i30;
import 'package:stadata_flutter_sdk/src/features/news_categories/domain/usecases/get_all_news_categories.dart'
    as _i9;
import 'package:stadata_flutter_sdk/src/features/press_releases/data/datasources/press_release_remote_data_source.dart'
    as _i35;
import 'package:stadata_flutter_sdk/src/features/press_releases/data/repositories/press_release_repository_impl.dart'
    as _i37;
import 'package:stadata_flutter_sdk/src/features/press_releases/domain/repositories/press_release_repository.dart'
    as _i36;
import 'package:stadata_flutter_sdk/src/features/press_releases/domain/usecases/get_all_press_releases.dart'
    as _i10;
import 'package:stadata_flutter_sdk/src/features/press_releases/domain/usecases/get_detail_press_release.dart'
    as _i17;
import 'package:stadata_flutter_sdk/src/features/publications/data/datasources/publication_remote_data_source.dart'
    as _i38;
import 'package:stadata_flutter_sdk/src/features/publications/data/repositories/publication_repository_impl.dart'
    as _i40;
import 'package:stadata_flutter_sdk/src/features/publications/domain/repositories/publication_repository.dart'
    as _i39;
import 'package:stadata_flutter_sdk/src/features/publications/domain/usecases/get_all_publication.dart'
    as _i11;
import 'package:stadata_flutter_sdk/src/features/publications/domain/usecases/get_detail_publication.dart'
    as _i18;
import 'package:stadata_flutter_sdk/src/features/static_tables/data/datasources/static_table_remote_data_source.dart'
    as _i46;
import 'package:stadata_flutter_sdk/src/features/static_tables/data/repositories/static_table_repository_impl.dart'
    as _i48;
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/repositories/static_table_repository.dart'
    as _i47;
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/usecases/get_all_static_tables.dart'
    as _i12;
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/usecases/get_detail_static_table.dart'
    as _i19;
import 'package:stadata_flutter_sdk/src/features/strategic_indicators/domain/usecases/get_all_strategic_indicators.dart'
    as _i13;
import 'package:stadata_flutter_sdk/src/features/subject_categories/data/datasources/subject_category_remote_data_source.dart'
    as _i49;
import 'package:stadata_flutter_sdk/src/features/subject_categories/data/repositories/subject_category_repository_impl.dart'
    as _i51;
import 'package:stadata_flutter_sdk/src/features/subject_categories/domain/repositories/subject_category_repository.dart'
    as _i50;
import 'package:stadata_flutter_sdk/src/features/subject_categories/domain/usecases/get_all_subject_categories.dart'
    as _i14;
import 'package:stadata_flutter_sdk/src/features/subjects/data/datasources/subject_remote_data_source.dart'
    as _i52;
import 'package:stadata_flutter_sdk/src/features/subjects/data/repositories/subject_repository_impl.dart'
    as _i54;
import 'package:stadata_flutter_sdk/src/features/subjects/domain/repositories/subject_repository.dart'
    as _i53;
import 'package:stadata_flutter_sdk/src/features/subjects/domain/usecases/get_all_subjects.dart'
    as _i15;
import 'package:stadata_flutter_sdk/src/list/list.dart' as _i42;
import 'package:stadata_flutter_sdk/src/view/view.dart' as _i44;

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
  gh.lazySingleton<_i9.GetAllNewsCategories>(() => _i9.GetAllNewsCategories());
  gh.lazySingleton<_i10.GetAllPressReleases>(() => _i10.GetAllPressReleases());
  gh.lazySingleton<_i11.GetAllPublication>(() => _i11.GetAllPublication());
  gh.lazySingleton<_i12.GetAllStaticTables>(() => _i12.GetAllStaticTables());
  gh.lazySingleton<_i13.GetAllStrategicIndicators>(
      () => _i13.GetAllStrategicIndicators());
  gh.lazySingleton<_i14.GetAllSubjectCategories>(
      () => _i14.GetAllSubjectCategories());
  gh.lazySingleton<_i15.GetAllSubjects>(() => _i15.GetAllSubjects());
  gh.lazySingleton<_i16.GetDetailNews>(() => _i16.GetDetailNews());
  gh.lazySingleton<_i17.GetDetailPressRelease>(
      () => _i17.GetDetailPressRelease());
  gh.lazySingleton<_i18.GetDetailPublication>(
      () => _i18.GetDetailPublication());
  gh.lazySingleton<_i19.GetDetailStaticTable>(
      () => _i19.GetDetailStaticTable());
  gh.lazySingleton<_i20.GetDomains>(() => _i20.GetDomains());
  gh.factory<_i21.HttpClient>(() => registerModule.httpClient);
  gh.factory<_i21.HttpClient>(
    () => registerModule.viewHttpClient,
    instanceName: 'viewClient',
  );
  gh.factory<_i21.HttpClient>(
    () => registerModule.listHttpClient,
    instanceName: 'listClient',
  );
  gh.lazySingleton<_i22.InfographicRemoteDataSource>(
      () => _i22.InfographicRemoteDataSourceImpl());
  gh.lazySingleton<_i23.InfographicRepository>(
      () => _i24.InfographicRepositoryImpl());
  gh.lazySingleton<_i25.LocalStorage>(
    () => _i26.SecureStorageImpl(),
    instanceName: 'secure',
  );
  gh.lazySingleton<_i27.Log>(() => _i27.Log());
  gh.factory<_i28.Logger>(() => registerModule.logger);
  gh.lazySingleton<_i29.NewsCategoryRemoteDataSource>(
      () => _i29.NewsCategoryRemoteDataSourceImpl());
  gh.lazySingleton<_i30.NewsCategoryRepository>(
      () => _i31.NewsCategoryRepositoryImpl());
  gh.lazySingleton<_i32.NewsRemoteDataSource>(
      () => _i32.NewsRemoteDataSourceImpl());
  gh.lazySingleton<_i33.NewsRepository>(() => _i34.NewsRepositoryImpl());
  gh.lazySingleton<_i35.PressReleaseRemoteDataSource>(
      () => _i35.PressReleaseRemoteDataSourceImpl());
  gh.lazySingleton<_i36.PressReleaseRepository>(
      () => _i37.PressReleaseRepositoryImpl());
  gh.lazySingleton<_i38.PublicationRemoteDataSource>(
      () => _i38.PublicationRemoteDataSourceImpl());
  gh.lazySingleton<_i39.PublicationRepository>(
      () => _i40.PublicationRepositoryImpl());
  gh.lazySingleton<_i41.StadataHttpModule>(() => _i41.StadataHttpModule());
  gh.lazySingleton<_i42.StadataList>(() => _i42.StadataListImpl());
  gh.lazySingleton<_i43.StadataListHttpModule>(
      () => _i43.StadataListHttpModule());
  gh.lazySingleton<_i44.StadataView>(() => _i44.StadataViewImpl());
  gh.lazySingleton<_i45.StadataViewHttpModule>(
      () => _i45.StadataViewHttpModule());
  gh.lazySingleton<_i46.StaticTableRemoteDataSource>(
      () => _i46.StaticTableRemoteDataSourceImpl());
  gh.lazySingleton<_i47.StaticTableRepository>(
      () => _i48.StaticTableRepositoryImpl());
  gh.lazySingleton<_i49.SubjectCategoryRemoteDataSource>(
      () => _i49.SubjectCategoryRemoteDataSourceImpl());
  gh.lazySingleton<_i50.SubjectCategoryRepository>(
      () => _i51.SubjectCategoryRepositoryImpl());
  gh.lazySingleton<_i52.SubjectRemoteDataSource>(
      () => _i52.SubjectModelRemoteDataSourceImpl());
  gh.lazySingleton<_i53.SubjectRepository>(() => _i54.SubjectRepositoryImpl());
  return getIt;
}

class _$RegisterModule extends _i55.RegisterModule {}
