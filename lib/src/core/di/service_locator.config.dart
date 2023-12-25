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
import 'package:logger/logger.dart' as _i31;
import 'package:stadata_flutter_sdk/src/core/di/register_module.dart' as _i70;
import 'package:stadata_flutter_sdk/src/core/log/log.dart' as _i30;
import 'package:stadata_flutter_sdk/src/core/network/http/http_client.dart'
    as _i24;
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_http_module.dart'
    as _i44;
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart'
    as _i46;
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_view_http_module.dart'
    as _i48;
import 'package:stadata_flutter_sdk/src/core/storage/local_storage.dart'
    as _i28;
import 'package:stadata_flutter_sdk/src/core/storage/secure_storage_impl.dart'
    as _i29;
import 'package:stadata_flutter_sdk/src/features/domains/data/datasources/domain_remote_data_source.dart'
    as _i3;
import 'package:stadata_flutter_sdk/src/features/domains/data/repositories/domain_repository_impl.dart'
    as _i5;
import 'package:stadata_flutter_sdk/src/features/domains/domain/repositories/domain_repository.dart'
    as _i4;
import 'package:stadata_flutter_sdk/src/features/domains/domain/usecases/get_domains.dart'
    as _i23;
import 'package:stadata_flutter_sdk/src/features/features.dart' as _i53;
import 'package:stadata_flutter_sdk/src/features/infographics/data/datasources/infographic_remote_data_source.dart'
    as _i25;
import 'package:stadata_flutter_sdk/src/features/infographics/data/repositories/infographic_repository_impl.dart'
    as _i27;
import 'package:stadata_flutter_sdk/src/features/infographics/domain/repositories/infographic_repository.dart'
    as _i26;
import 'package:stadata_flutter_sdk/src/features/infographics/domain/usecases/get_all_infographics.dart'
    as _i7;
import 'package:stadata_flutter_sdk/src/features/news/data/datasources/news_remote_data_source.dart'
    as _i35;
import 'package:stadata_flutter_sdk/src/features/news/data/repositories/news_repository_impl.dart'
    as _i37;
import 'package:stadata_flutter_sdk/src/features/news/domain/repositories/news_repository.dart'
    as _i36;
import 'package:stadata_flutter_sdk/src/features/news/domain/usecases/get_all_news.dart'
    as _i8;
import 'package:stadata_flutter_sdk/src/features/news/domain/usecases/get_detail_news.dart'
    as _i19;
import 'package:stadata_flutter_sdk/src/features/news_categories/data/datasources/news_category_remote_data_source.dart'
    as _i32;
import 'package:stadata_flutter_sdk/src/features/news_categories/data/repositories/news_category_repository_impl.dart'
    as _i34;
import 'package:stadata_flutter_sdk/src/features/news_categories/domain/respositories/news_category_repository.dart'
    as _i33;
import 'package:stadata_flutter_sdk/src/features/news_categories/domain/usecases/get_all_news_categories.dart'
    as _i9;
import 'package:stadata_flutter_sdk/src/features/press_releases/data/datasources/press_release_remote_data_source.dart'
    as _i38;
import 'package:stadata_flutter_sdk/src/features/press_releases/data/repositories/press_release_repository_impl.dart'
    as _i40;
import 'package:stadata_flutter_sdk/src/features/press_releases/domain/repositories/press_release_repository.dart'
    as _i39;
import 'package:stadata_flutter_sdk/src/features/press_releases/domain/usecases/get_all_press_releases.dart'
    as _i10;
import 'package:stadata_flutter_sdk/src/features/press_releases/domain/usecases/get_detail_press_release.dart'
    as _i20;
import 'package:stadata_flutter_sdk/src/features/publications/data/datasources/publication_remote_data_source.dart'
    as _i41;
import 'package:stadata_flutter_sdk/src/features/publications/data/repositories/publication_repository_impl.dart'
    as _i43;
import 'package:stadata_flutter_sdk/src/features/publications/domain/repositories/publication_repository.dart'
    as _i42;
import 'package:stadata_flutter_sdk/src/features/publications/domain/usecases/get_all_publication.dart'
    as _i11;
import 'package:stadata_flutter_sdk/src/features/publications/domain/usecases/get_detail_publication.dart'
    as _i21;
import 'package:stadata_flutter_sdk/src/features/static_tables/data/datasources/static_table_remote_data_source.dart'
    as _i49;
import 'package:stadata_flutter_sdk/src/features/static_tables/data/repositories/static_table_repository_impl.dart'
    as _i51;
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/repositories/static_table_repository.dart'
    as _i50;
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/usecases/get_all_static_tables.dart'
    as _i12;
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/usecases/get_detail_static_table.dart'
    as _i22;
import 'package:stadata_flutter_sdk/src/features/strategic_indicators/data/datasources/strategic_indicator_remote_data_source.dart'
    as _i52;
import 'package:stadata_flutter_sdk/src/features/strategic_indicators/data/repositories/strategic_indicator_repository_impl.dart'
    as _i54;
import 'package:stadata_flutter_sdk/src/features/strategic_indicators/domain/usecases/get_all_strategic_indicators.dart'
    as _i13;
import 'package:stadata_flutter_sdk/src/features/subject_categories/data/datasources/subject_category_remote_data_source.dart'
    as _i55;
import 'package:stadata_flutter_sdk/src/features/subject_categories/data/repositories/subject_category_repository_impl.dart'
    as _i57;
import 'package:stadata_flutter_sdk/src/features/subject_categories/domain/repositories/subject_category_repository.dart'
    as _i56;
import 'package:stadata_flutter_sdk/src/features/subject_categories/domain/usecases/get_all_subject_categories.dart'
    as _i14;
import 'package:stadata_flutter_sdk/src/features/subjects/data/datasources/subject_remote_data_source.dart'
    as _i58;
import 'package:stadata_flutter_sdk/src/features/subjects/data/repositories/subject_repository_impl.dart'
    as _i60;
import 'package:stadata_flutter_sdk/src/features/subjects/domain/repositories/subject_repository.dart'
    as _i59;
import 'package:stadata_flutter_sdk/src/features/subjects/domain/usecases/get_all_subjects.dart'
    as _i15;
import 'package:stadata_flutter_sdk/src/features/units/data/datasources/unit_data_remote_data_source.dart'
    as _i61;
import 'package:stadata_flutter_sdk/src/features/units/data/repositories/unit_data_repository_impl.dart'
    as _i63;
import 'package:stadata_flutter_sdk/src/features/units/domain/repositories/unit_data_repository.dart'
    as _i62;
import 'package:stadata_flutter_sdk/src/features/units/domain/usecases/get_all_units.dart'
    as _i16;
import 'package:stadata_flutter_sdk/src/features/variables/data/datasources/variable_remote_data_source.dart'
    as _i64;
import 'package:stadata_flutter_sdk/src/features/variables/data/repositories/variable_repository_impl.dart'
    as _i66;
import 'package:stadata_flutter_sdk/src/features/variables/domain/repositories/variable_repository.dart'
    as _i65;
import 'package:stadata_flutter_sdk/src/features/variables/domain/usecases/get_all_variables.dart'
    as _i17;
import 'package:stadata_flutter_sdk/src/features/vertical_variables/data/datasources/vertical_variable_remote_data_source.dart'
    as _i67;
import 'package:stadata_flutter_sdk/src/features/vertical_variables/data/repositories/vertical_variable_repository_impl.dart'
    as _i69;
import 'package:stadata_flutter_sdk/src/features/vertical_variables/domain/repositories/vertical_variable_repository.dart'
    as _i68;
import 'package:stadata_flutter_sdk/src/features/vertical_variables/domain/usecases/get_all_vertical_variables.dart'
    as _i18;
import 'package:stadata_flutter_sdk/src/list/list.dart' as _i45;
import 'package:stadata_flutter_sdk/src/view/view.dart' as _i47;

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
  gh.lazySingleton<_i16.GetAllUnits>(() => _i16.GetAllUnits());
  gh.lazySingleton<_i17.GetAllVariables>(() => _i17.GetAllVariables());
  gh.lazySingleton<_i18.GetAllVerticalVariables>(
      () => _i18.GetAllVerticalVariables());
  gh.lazySingleton<_i19.GetDetailNews>(() => _i19.GetDetailNews());
  gh.lazySingleton<_i20.GetDetailPressRelease>(
      () => _i20.GetDetailPressRelease());
  gh.lazySingleton<_i21.GetDetailPublication>(
      () => _i21.GetDetailPublication());
  gh.lazySingleton<_i22.GetDetailStaticTable>(
      () => _i22.GetDetailStaticTable());
  gh.lazySingleton<_i23.GetDomains>(() => _i23.GetDomains());
  gh.factory<_i24.HttpClient>(
    () => registerModule.listHttpClient,
    instanceName: 'listClient',
  );
  gh.factory<_i24.HttpClient>(
    () => registerModule.viewHttpClient,
    instanceName: 'viewClient',
  );
  gh.factory<_i24.HttpClient>(() => registerModule.httpClient);
  gh.lazySingleton<_i25.InfographicRemoteDataSource>(
      () => _i25.InfographicRemoteDataSourceImpl());
  gh.lazySingleton<_i26.InfographicRepository>(
      () => _i27.InfographicRepositoryImpl());
  gh.lazySingleton<_i28.LocalStorage>(
    () => _i29.SecureStorageImpl(),
    instanceName: 'secure',
  );
  gh.lazySingleton<_i30.Log>(() => _i30.Log());
  gh.factory<_i31.Logger>(() => registerModule.logger);
  gh.lazySingleton<_i32.NewsCategoryRemoteDataSource>(
      () => _i32.NewsCategoryRemoteDataSourceImpl());
  gh.lazySingleton<_i33.NewsCategoryRepository>(
      () => _i34.NewsCategoryRepositoryImpl());
  gh.lazySingleton<_i35.NewsRemoteDataSource>(
      () => _i35.NewsRemoteDataSourceImpl());
  gh.lazySingleton<_i36.NewsRepository>(() => _i37.NewsRepositoryImpl());
  gh.lazySingleton<_i38.PressReleaseRemoteDataSource>(
      () => _i38.PressReleaseRemoteDataSourceImpl());
  gh.lazySingleton<_i39.PressReleaseRepository>(
      () => _i40.PressReleaseRepositoryImpl());
  gh.lazySingleton<_i41.PublicationRemoteDataSource>(
      () => _i41.PublicationRemoteDataSourceImpl());
  gh.lazySingleton<_i42.PublicationRepository>(
      () => _i43.PublicationRepositoryImpl());
  gh.lazySingleton<_i44.StadataHttpModule>(() => _i44.StadataHttpModule());
  gh.lazySingleton<_i45.StadataList>(() => _i45.StadataListImpl());
  gh.lazySingleton<_i46.StadataListHttpModule>(
      () => _i46.StadataListHttpModule());
  gh.lazySingleton<_i47.StadataView>(() => _i47.StadataViewImpl());
  gh.lazySingleton<_i48.StadataViewHttpModule>(
      () => _i48.StadataViewHttpModule());
  gh.lazySingleton<_i49.StaticTableRemoteDataSource>(
      () => _i49.StaticTableRemoteDataSourceImpl());
  gh.lazySingleton<_i50.StaticTableRepository>(
      () => _i51.StaticTableRepositoryImpl());
  gh.lazySingleton<_i52.StrategicIndicatorRemoteDataSource>(
      () => _i52.StrategicIndicatorRemoteDataSourceImpl());
  gh.lazySingleton<_i53.StrategicIndicatorRepository>(
      () => _i54.StrategicIndicatorRepositoryImpl());
  gh.lazySingleton<_i55.SubjectCategoryRemoteDataSource>(
      () => _i55.SubjectCategoryRemoteDataSourceImpl());
  gh.lazySingleton<_i56.SubjectCategoryRepository>(
      () => _i57.SubjectCategoryRepositoryImpl());
  gh.lazySingleton<_i58.SubjectRemoteDataSource>(
      () => _i58.SubjectModelRemoteDataSourceImpl());
  gh.lazySingleton<_i59.SubjectRepository>(() => _i60.SubjectRepositoryImpl());
  gh.lazySingleton<_i61.UnitDataRemoteDataSource>(
      () => _i61.UnitDataRemoteDataSourceImpl());
  gh.lazySingleton<_i62.UnitDataRepository>(
      () => _i63.UnitDataRepositoryImpl());
  gh.lazySingleton<_i64.VariableRemoteDataSource>(
      () => _i64.VariableRemoteDataSourceImpl());
  gh.lazySingleton<_i65.VariableRepository>(
      () => _i66.VariableRepositoryImpl());
  gh.lazySingleton<_i67.VerticalVariableRemoteDataSource>(
      () => _i67.VerticalVariableRemoteDataSourceImpl());
  gh.lazySingleton<_i68.VerticalVariableRepository>(
      () => _i69.VerticalVariableRepositoryImpl());
  return getIt;
}

class _$RegisterModule extends _i70.RegisterModule {}
